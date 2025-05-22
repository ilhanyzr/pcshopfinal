import { createClient } from 'npm:@supabase/supabase-js@2.39.7';
import { createHash } from 'node:crypto';

const supabaseUrl = Deno.env.get('SUPABASE_URL') || '';
const supabaseServiceKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') || '';

const supabase = createClient(supabaseUrl, supabaseServiceKey);

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
};

interface CartItem {
  id: string;
  name: string;
  price: number;
  quantity: number;
}

interface CreatePaymentRequest {
  items: CartItem[];
  userId: string;
  shippingAddress: string;
}

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { headers: corsHeaders });
  }

  try {
    const { items, userId, shippingAddress }: CreatePaymentRequest = await req.json();

    // Calculate total amount
    const totalAmount = items.reduce((sum, item) => sum + (item.price * item.quantity), 0);

    // Create order in database
    const { data: order, error: orderError } = await supabase
      .from('orders')
      .insert({
        user_id: userId,
        total_amount: totalAmount,
        shipping_address: shippingAddress,
        status: 'pending'
      })
      .select()
      .single();

    if (orderError) throw orderError;

    // Insert order items
    const orderItems = items.map(item => ({
      order_id: order.id,
      product_id: item.id,
      quantity: item.quantity,
      price: item.price
    }));

    const { error: itemsError } = await supabase
      .from('order_items')
      .insert(orderItems);

    if (itemsError) throw itemsError;

    // Get user details
    const { data: profile } = await supabase
      .from('profiles')
      .select('name, phone')
      .eq('id', userId)
      .single();

    // Create PayTR token
    const merchantId = Deno.env.get('PAYTR_MERCHANT_ID');
    const merchantKey = Deno.env.get('PAYTR_MERCHANT_KEY');
    const merchantSalt = Deno.env.get('PAYTR_MERCHANT_SALT');
    
    const merchantOid = order.id;
    const userIp = req.headers.get('x-forwarded-for') || '1.1.1.1';
    const userEmail = 'customer@example.com'; // Get from auth
    const paymentAmount = Math.round(totalAmount * 100); // Convert to kuruş
    const noInstallment = '0';
    const maxInstallment = '0';
    const currency = 'TL';
    const test_mode = '1';
    const userName = profile?.name || 'Customer';
    const userPhone = profile?.phone || '';
    const merchantOkUrl = `${req.headers.get('origin')}/order-confirmation/${order.id}`;
    const merchantFailUrl = `${req.headers.get('origin')}/order-confirmation/${order.id}`;
    const timeoutLimit = '30';
    const debug_on = '1';

    // Create basket items for PayTR
    const basketItems = items.map(item => ({
      name: item.name,
      price: item.price.toString(),
      qty: item.quantity.toString(),
    }));

    const hashStr = `${merchantId}${userIp}${merchantOid}${userEmail}${paymentAmount}${noInstallment}${maxInstallment}${currency}${test_mode}${merchantSalt}`;
    const token = createHash('sha256')
      .update(hashStr, 'utf8')
      .digest('base64');

    const paytrData = {
      merchant_id: merchantId,
      user_ip: userIp,
      merchant_oid: merchantOid,
      email: userEmail,
      payment_amount: paymentAmount,
      paytr_token: token,
      user_basket: JSON.stringify(basketItems),
      debug_on: debug_on,
      no_installment: noInstallment,
      max_installment: maxInstallment,
      user_name: userName,
      user_phone: userPhone,
      merchant_ok_url: merchantOkUrl,
      merchant_fail_url: merchantFailUrl,
      timeout_limit: timeoutLimit,
      currency: currency,
      test_mode: test_mode
    };

    return new Response(
      JSON.stringify({
        paytrData,
        orderId: order.id
      }),
      {
        headers: {
          ...corsHeaders,
          'Content-Type': 'application/json'
        }
      }
    );
  } catch (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      {
        status: 400,
        headers: {
          ...corsHeaders,
          'Content-Type': 'application/json'
        }
      }
    );
  }
});