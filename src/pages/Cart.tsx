import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useCartStore } from '../store/cartStore';
import { 
  Trash2, 
  Plus, 
  Minus, 
  ShoppingBag, 
  Building2, 
  Loader2,
  MapPin
} from 'lucide-react';
import { supabase } from '../lib/supabase';

interface ShippingAddress {
  province: string;
  district: string;
  neighborhood: string;
  street: string;
  buildingNo: string;
  apartmentNo: string;
  additionalDetails: string;
}

const Cart = () => {
  const { items, removeItem, updateQuantity, clearCart } = useCartStore();
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [shippingAddress, setShippingAddress] = useState<ShippingAddress>({
    province: '',
    district: '',
    neighborhood: '',
    street: '',
    buildingNo: '',
    apartmentNo: '',
    additionalDetails: ''
  });

  const total = items.reduce((sum, item) => sum + item.price * item.quantity, 0);

  const handleBankTransfer = async () => {
    try {
      // Validate all required address fields
      if (!shippingAddress.province.trim() || 
          !shippingAddress.district.trim() || 
          !shippingAddress.neighborhood.trim() || 
          !shippingAddress.street.trim() || 
          !shippingAddress.buildingNo.trim()) {
        setError('Lütfen tüm zorunlu adres alanlarını doldurun.');
        return;
      }

      setLoading(true);
      setError('');

      const { data: { user } } = await supabase.auth.getUser();
      if (!user) {
        navigate('/login');
        return;
      }

      // Format shipping address
      const formattedAddress = `${shippingAddress.neighborhood} Mah. ${shippingAddress.street} ${
        shippingAddress.street.toLowerCase().includes('cad.') || 
        shippingAddress.street.toLowerCase().includes('sokak') || 
        shippingAddress.street.toLowerCase().includes('sk.') ? 
        '' : 
        'Cad./Sok.'
      } No:${shippingAddress.buildingNo} ${
        shippingAddress.apartmentNo ? `Daire:${shippingAddress.apartmentNo}` : ''
      } ${shippingAddress.additionalDetails ? `(${shippingAddress.additionalDetails})` : ''} ${
        shippingAddress.district}/${shippingAddress.province}`.trim();

      // Create order
      const { data: order, error: orderError } = await supabase
        .from('orders')
        .insert({
          user_id: user.id,
          total_amount: total,
          status: 'pending',
          payment_method: 'bank_transfer',
          shipping_address: formattedAddress
        })
        .select()
        .single();

      if (orderError) throw orderError;

      // Create order items
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

      // Clear cart and redirect
      clearCart();
      navigate(`/order-confirmation/${order.id}`);

    } catch (err: any) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  if (items.length === 0) {
    return (
      <div className="max-w-4xl mx-auto text-center py-16">
        <ShoppingBag className="w-16 h-16 text-gray-400 mx-auto mb-4" />
        <h2 className="text-2xl font-bold mb-4">Sepetiniz boş</h2>
        <p className="text-gray-600 mb-8">Sepetinize ürün ekleyerek alışverişe başlayabilirsiniz.</p>
        <button
          onClick={() => navigate('/products')}
          className="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors"
        >
          Alışverişe Başla
        </button>
      </div>
    );
  }

  return (
    <div className="max-w-6xl mx-auto px-4 py-8">
      <h2 className="text-3xl font-bold mb-8">Alışveriş Sepeti</h2>

      {error && (
        <div className="mb-6 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded">
          {error}
        </div>
      )}

      <div className="flex flex-col lg:flex-row gap-8">
        <div className="lg:w-2/3">
          <div className="bg-white rounded-xl shadow-md overflow-hidden">
            {items.map((item) => (
              <div key={item.id} className="flex items-center p-6 border-b last:border-b-0">
                <img
                  src={item.image}
                  alt={item.name}
                  className="w-24 h-24 object-cover rounded-lg"
                />
                <div className="ml-6 flex-grow">
                  <h3 className="text-lg font-semibold">{item.name}</h3>
                  <p className="text-gray-600 mt-1">{item.description}</p>
                  <div className="mt-4 flex items-center justify-between">
                    <div className="flex items-center space-x-4">
                      <button
                        onClick={() => updateQuantity(item.id, Math.max(1, item.quantity - 1))}
                        className="p-2 hover:bg-gray-100 rounded-full transition-colors"
                      >
                        <Minus className="w-4 h-4" />
                      </button>
                      <span className="w-8 text-center font-medium">{item.quantity}</span>
                      <button
                        onClick={() => updateQuantity(item.id, item.quantity + 1)}
                        className="p-2 hover:bg-gray-100 rounded-full transition-colors"
                      >
                        <Plus className="w-4 h-4" />
                      </button>
                    </div>
                    <div className="flex items-center space-x-6">
                      <span className="text-lg font-semibold">
                        ₺{(item.price * item.quantity).toLocaleString('tr-TR')}
                      </span>
                      <button
                        onClick={() => removeItem(item.id)}
                        className="text-red-500 hover:text-red-700 transition-colors"
                      >
                        <Trash2 className="w-5 h-5" />
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>

        <div className="lg:w-1/3">
          <div className="bg-white rounded-xl shadow-md p-6 sticky top-8">
            <h3 className="text-xl font-semibold mb-6">Sipariş Özeti</h3>
            
            <div className="space-y-4">
              <div className="flex justify-between text-gray-600">
                <span>Ara Toplam</span>
                <span>₺{total.toLocaleString('tr-TR')}</span>
              </div>
              <div className="flex justify-between text-gray-600">
                <span>Kargo</span>
                <span>Ücretsiz</span>
              </div>
              <div className="border-t pt-4">
                <div className="flex justify-between text-xl font-semibold">
                  <span>Toplam</span>
                  <span>₺{total.toLocaleString('tr-TR')}</span>
                </div>
                <p className="text-sm text-gray-500 mt-1">KDV Dahil</p>
              </div>
            </div>

            {/* Teslimat Adresi */}
            <div className="mt-6 space-y-4">
              <h4 className="font-medium flex items-center gap-2">
                <MapPin className="w-5 h-5" />
                Teslimat Adresi
              </h4>
              
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    İl <span className="text-red-500">*</span>
                  </label>
                  <input
                    type="text"
                    value={shippingAddress.province}
                    onChange={(e) => setShippingAddress(prev => ({ ...prev, province: e.target.value }))}
                    className="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500"
                    required
                  />
                </div>
                
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    İlçe <span className="text-red-500">*</span>
                  </label>
                  <input
                    type="text"
                    value={shippingAddress.district}
                    onChange={(e) => setShippingAddress(prev => ({ ...prev, district: e.target.value }))}
                    className="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500"
                    required
                  />
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Mahalle <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  value={shippingAddress.neighborhood}
                  onChange={(e) => setShippingAddress(prev => ({ ...prev, neighborhood: e.target.value }))}
                  className="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500"
                  required
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Cadde/Sokak <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  value={shippingAddress.street}
                  onChange={(e) => setShippingAddress(prev => ({ ...prev, street: e.target.value }))}
                  className="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500"
                  required
                  placeholder="Örn: Atatürk Cad. veya Gül Sok."
                />
              </div>

              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Bina No <span className="text-red-500">*</span>
                  </label>
                  <input
                    type="text"
                    value={shippingAddress.buildingNo}
                    onChange={(e) => setShippingAddress(prev => ({ ...prev, buildingNo: e.target.value }))}
                    className="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500"
                    required
                  />
                </div>
                
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Daire No
                  </label>
                  <input
                    type="text"
                    value={shippingAddress.apartmentNo}
                    onChange={(e) => setShippingAddress(prev => ({ ...prev, apartmentNo: e.target.value }))}
                    className="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500"
                  />
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Adres Tarifi (Opsiyonel)
                </label>
                <textarea
                  value={shippingAddress.additionalDetails}
                  onChange={(e) => setShippingAddress(prev => ({ ...prev, additionalDetails: e.target.value }))}
                  rows={2}
                  className="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500"
                  placeholder="Apartman adı, kat, zil bilgisi, vb."
                />
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

            <button
              onClick={handleBankTransfer}
              disabled={loading}
              className="w-full mt-8 bg-blue-600 text-white py-3 px-4 rounded-lg hover:bg-blue-700 transition-colors flex items-center justify-center gap-2 font-medium disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {loading ? (
                <>
                  <Loader2 className="w-5 h-5 animate-spin" />
                  İşleniyor...
                </>
              ) : (
                <>
                  <Building2 className="w-5 h-5" />
                  Havale/EFT ile Öde
                </>
              )}
            </button>

            <button
              onClick={() => navigate('/products')}
              className="w-full mt-4 text-blue-600 py-3 px-4 rounded-lg hover:bg-blue-50 transition-colors font-medium"
            >
              Alışverişe Devam Et
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Cart;