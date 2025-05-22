import { createClient } from 'npm:@supabase/supabase-js@2.39.7';
import { createHash } from 'node:crypto';

const supabaseUrl = Deno.env.get('SUPABASE_URL') || '';
const supabaseServiceKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') || '';
const merchantKey = Deno.env.get('PAYTR_MERCHANT_KEY') || '';
const merchantSalt = Deno.env.get('PAYTR_MERCHANT_SALT') || '';

const supabase = createClient(supabaseUrl, supabaseServiceKey);

Deno.serve(async (req) => {
  try {
    const formData = await req.formData();
    const merchantOid = formData.get('merchant_oid');
    const status = formData.get('status');
    const totalAmount = formData.get('total_amount');
    const hash = formData.get('hash');

    // Verify hash
    const hashStr = `${merchantOid}${merchantSalt}${status}${totalAmount}${merchantKey}`;
    const expectedHash = createHash('sha256')
      .update(hashStr, 'utf8')
      .digest('base64');

    if (hash !== expectedHash) {
      throw new Error('Invalid hash');
    }

    // Update order status
    const { error } = await supabase
      .from('orders')
      .update({ 
        status: status === 'success' ? 'processing' : 'cancelled' 
      })
      .eq('id', merchantOid);

    if (error) throw error;

    return new Response('OK', {
      headers: { 'Content-Type': 'text/plain' }
    });
  } catch (error) {
    return new Response(
      error.message,
      { 
        status: 400,
        headers: { 'Content-Type': 'text/plain' }
      }
    );
  }
});