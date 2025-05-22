import { createClient } from 'npm:@supabase/supabase-js@2.39.7';
import { SMTPClient } from 'npm:emailjs@4.0.3';

const supabaseUrl = Deno.env.get('SUPABASE_URL') || '';
const supabaseServiceKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') || '';
const supabase = createClient(supabaseUrl, supabaseServiceKey);

const smtp = new SMTPClient({
  user: Deno.env.get('SMTP_USER'),
  password: Deno.env.get('SMTP_PASSWORD'),
  host: Deno.env.get('SMTP_HOST'),
  ssl: true,
});

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

interface NotificationRequest {
  type: 'order_confirmation' | 'order_status_update';
  orderId: string;
}

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { headers: corsHeaders });
  }

  try {
    const { type, orderId }: NotificationRequest = await req.json();

    // Get order details
    const { data: order, error: orderError } = await supabase
      .from('orders')
      .select(`
        *,
        user:users!user_id (
          email,
          profiles (
            name,
            phone
          )
        )
      `)
      .eq('id', orderId)
      .single();

    if (orderError) throw orderError;

    const userEmail = order.user.email;
    const userName = order.user.profiles?.name || 'Değerli Müşterimiz';
    const userPhone = order.user.profiles?.phone;

    let subject = '';
    let message = '';

    switch (type) {
      case 'order_confirmation':
        subject = 'Siparişiniz Alındı';
        message = `
          Sayın ${userName},
          
          ${orderId} numaralı siparişiniz başarıyla alınmıştır.
          
          Sipariş Tutarı: ₺${order.total_amount.toLocaleString('tr-TR')}
          Durum: ${order.status}
          
          Siparişinizin durumunu web sitemizden takip edebilirsiniz.
          
          Bizi tercih ettiğiniz için teşekkür ederiz.
          
          PC Store
        `;
        break;

      case 'order_status_update':
        subject = 'Sipariş Durumu Güncellendi';
        message = `
          Sayın ${userName},
          
          ${orderId} numaralı siparişinizin durumu güncellendi.
          
          Yeni Durum: ${order.status}
          
          Siparişinizin detaylarını web sitemizden görüntüleyebilirsiniz.
          
          PC Store
        `;
        break;
    }

    // Send email
    await smtp.send({
      from: 'PC Store <noreply@pcstore.com>',
      to: userEmail,
      subject,
      text: message,
    });

    return new Response(
      JSON.stringify({ success: true }),
      {
        headers: {
          ...corsHeaders,
          'Content-Type': 'application/json',
        },
      }
    );
  } catch (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      {
        status: 400,
        headers: {
          ...corsHeaders,
          'Content-Type': 'application/json',
        },
      }
    );
  }
});