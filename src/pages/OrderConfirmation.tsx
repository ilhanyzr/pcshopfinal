import React, { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { CheckCircle, XCircle, Loader2, Upload, AlertCircle } from 'lucide-react';
import { supabase } from '../lib/supabase';

interface Order {
  id: string;
  status: string;
  total_amount: number;
  created_at: string;
  payment_method: string;
  receipt_url?: string;
}

const OrderConfirmation = () => {
  const { orderId } = useParams();
  const [order, setOrder] = useState<Order | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [uploadLoading, setUploadLoading] = useState(false);
  const [uploadError, setUploadError] = useState<string | null>(null);
  const [uploadSuccess, setUploadSuccess] = useState(false);

  useEffect(() => {
    loadOrder();
  }, [orderId]);

  const loadOrder = async () => {
    try {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) throw new Error('Not authenticated');

      const { data, error } = await supabase
        .from('orders')
        .select('*')
        .eq('id', orderId)
        .eq('user_id', user.id)
        .single();

      if (error) throw error;
      setOrder(data);
    } catch (err: any) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const handleFileUpload = async (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (!file) return;

    try {
      setUploadLoading(true);
      setUploadError(null);

      // Dosya uzantısını kontrol et
      const fileExt = file.name.split('.').pop()?.toLowerCase();
      if (!['jpg', 'jpeg', 'png', 'pdf'].includes(fileExt || '')) {
        throw new Error('Sadece JPG, PNG ve PDF dosyaları yükleyebilirsiniz.');
      }

      // Dosya boyutunu kontrol et (max 5MB)
      if (file.size > 5 * 1024 * 1024) {
        throw new Error('Dosya boyutu 5MB\'dan küçük olmalıdır.');
      }

      const fileName = `${orderId}-${Math.random()}.${fileExt}`;
      const filePath = `receipts/${fileName}`;

      // Dosyayı yükle
      const { error: uploadError } = await supabase.storage
        .from('receipts')
        .upload(filePath, file);

      if (uploadError) throw uploadError;

      // Dosya URL'ini al
      const { data: { publicUrl } } = supabase.storage
        .from('receipts')
        .getPublicUrl(filePath);

      // Siparişi güncelle
      const { error: updateError } = await supabase
        .from('orders')
        .update({
          receipt_url: publicUrl,
          status: 'processing'
        })
        .eq('id', orderId);

      if (updateError) throw updateError;

      setUploadSuccess(true);
      loadOrder(); // Siparişi yeniden yükle

    } catch (err: any) {
      setUploadError(err.message);
    } finally {
      setUploadLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="max-w-2xl mx-auto py-16 text-center">
        <Loader2 className="w-12 h-12 animate-spin mx-auto text-blue-600" />
        <p className="mt-4 text-gray-600">Sipariş detayları yükleniyor...</p>
      </div>
    );
  }

  if (error || !order) {
    return (
      <div className="max-w-2xl mx-auto py-16 text-center">
        <XCircle className="w-16 h-16 text-red-500 mx-auto" />
        <h2 className="mt-4 text-2xl font-bold text-gray-900">Sipariş Bulunamadı</h2>
        <p className="mt-2 text-gray-600">{error || 'Sipariş detayları bulunamadı'}</p>
        <Link
          to="/products"
          className="mt-8 inline-block bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors"
        >
          Alışverişe Devam Et
        </Link>
      </div>
    );
  }

  return (
    <div className="max-w-2xl mx-auto py-16 px-4">
      <div className="text-center">
        <CheckCircle className="w-16 h-16 text-green-500 mx-auto" />
        <h2 className="mt-4 text-2xl font-bold text-gray-900">Siparişiniz Alındı!</h2>
        <p className="mt-2 text-gray-600">
          Siparişiniz başarıyla oluşturuldu. Lütfen ödeme dekontunu yükleyin.
        </p>
      </div>

      <div className="mt-8 bg-white rounded-lg shadow-md p-6">
        <h3 className="text-lg font-semibold mb-4">Sipariş Detayları</h3>
        <div className="space-y-3">
          <div className="flex justify-between">
            <span className="text-gray-600">Sipariş No:</span>
            <span className="font-medium">{order.id}</span>
          </div>
          <div className="flex justify-between">
            <span className="text-gray-600">Durum:</span>
            <span className={`font-medium ${
              order.status === 'processing' ? 'text-green-600' :
              order.status === 'pending' ? 'text-yellow-600' :
              'text-gray-600'
            }`}>
              {order.status === 'processing' ? 'İşlemde' :
               order.status === 'pending' ? 'Ödeme Bekleniyor' :
               order.status}
            </span>
          </div>
          <div className="flex justify-between">
            <span className="text-gray-600">Toplam Tutar:</span>
            <span className="font-medium">₺{order.total_amount.toLocaleString('tr-TR')}</span>
          </div>
          <div className="flex justify-between">
            <span className="text-gray-600">Sipariş Tarihi:</span>
            <span className="font-medium">
              {new Date(order.created_at).toLocaleDateString('tr-TR')}
            </span>
          </div>
        </div>

        {/* Banka Bilgileri */}
        <div className="mt-6 p-4 bg-blue-50 rounded-lg">
          <h4 className="font-medium mb-2">Banka Hesap Bilgileri</h4>
          <div className="text-sm space-y-1 text-gray-600">
            <p>Banka: Ziraat Bankası</p>
            <p>Hesap Sahibi: PC Store A.Ş.</p>
            <p>IBAN: TR12 3456 7890 1234 5678 9012 34</p>
          </div>
        </div>

        {/* Dekont Yükleme */}
        {order.status === 'pending' && (
          <div className="mt-6">
            <h4 className="font-medium mb-4">Dekont Yükleme</h4>
            
            {uploadError && (
              <div className="mb-4 p-4 bg-red-50 text-red-700 rounded-lg flex items-center gap-2">
                <AlertCircle className="w-5 h-5" />
                {uploadError}
              </div>
            )}

            {uploadSuccess && (
              <div className="mb-4 p-4 bg-green-50 text-green-700 rounded-lg flex items-center gap-2">
                <CheckCircle className="w-5 h-5" />
                Dekont başarıyla yüklendi!
              </div>
            )}

            <div className="relative">
              <input
                type="file"
                onChange={handleFileUpload}
                accept=".jpg,.jpeg,.png,.pdf"
                className="hidden"
                id="receipt-upload"
                disabled={uploadLoading}
              />
              <label
                htmlFor="receipt-upload"
                className={`flex items-center justify-center gap-2 p-4 border-2 border-dashed rounded-lg cursor-pointer
                  ${uploadLoading ? 'bg-gray-50 cursor-not-allowed' : 'hover:bg-gray-50'}`}
              >
                {uploadLoading ? (
                  <>
                    <Loader2 className="w-5 h-5 animate-spin" />
                    Yükleniyor...
                  </>
                ) : (
                  <>
                    <Upload className="w-5 h-5" />
                    Dekont Yükle (JPG, PNG veya PDF)
                  </>
                )}
              </label>
            </div>
            <p className="mt-2 text-sm text-gray-500">
              Maksimum dosya boyutu: 5MB
            </p>
          </div>
        )}

        {order.receipt_url && (
          <div className="mt-6">
            <h4 className="font-medium mb-2">Yüklenen Dekont</h4>
            <a
              href={order.receipt_url}
              target="_blank"
              rel="noopener noreferrer"
              className="text-blue-600 hover:text-blue-700 flex items-center gap-2"
            >
              Dekontu Görüntüle
              <Upload className="w-4 h-4" />
            </a>
          </div>
        )}
      </div>

      <div className="mt-8 text-center">
        <Link
          to="/products"
          className="inline-block bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors"
        >
          Alışverişe Devam Et
        </Link>
      </div>
    </div>
  );
};

export default OrderConfirmation;