import React, { useState, useEffect, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import {
  PlusCircle,
  Pencil,
  Trash2,
  Save,
  Package,
  Users,
  ShoppingCart,
  AlertCircle,
  BarChart3,
  Settings,
  Search,
  X,
  Check,
  AlertTriangle,
  Upload,
  Image as ImageIcon,
  DollarSign,
  TrendingUp,
  Clock,
  ChevronRight,
  Filter,
  Download,
  Printer,
  RefreshCw,
  Star,
  Loader2
} from 'lucide-react';

interface Product {
  id: string;
  name: string;
  price: number;
  description: string;
  image: string;
  specs: string[];
  rating: number;
  stock: number;
  category: string;
  brand: string;
  technical_specs?: Record<string, any>;
}

interface Order {
  id: string;
  user_id: string;
  status: string;
  total_amount: number;
  shipping_address: string;
  created_at: string;
  updated_at: string;
  user?: {
    name: string;
    phone: string;
    email: string;
  };
  items?: OrderItem[];
}

interface OrderItem {
  id: string;
  product_id: string;
  quantity: number;
  price: number;
  product?: Product;
}

interface DashboardStats {
  totalRevenue: number;
  totalOrders: number;
  averageOrderValue: number;
  pendingOrders: number;
  lowStockProducts: number;
  totalCustomers: number;
}

const Admin = () => {
  const navigate = useNavigate();
  const [activeTab, setActiveTab] = useState('dashboard');
  const [dragActive, setDragActive] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);
  const [products, setProducts] = useState<Product[]>([]);
  const [orders, setOrders] = useState<Order[]>([]);
  const [stats, setStats] = useState<DashboardStats>({
    totalRevenue: 0,
    totalOrders: 0,
    averageOrderValue: 0,
    pendingOrders: 0,
    lowStockProducts: 0,
    totalCustomers: 0
  });
  const [editingId, setEditingId] = useState<string | null>(null);
  const [editingProduct, setEditingProduct] = useState<Partial<Product>>({
    specs: [],
    technical_specs: {}
  });
  const [loading, setLoading] = useState(true);
  const [message, setMessage] = useState<{ type: string; text: string } | null>(null);
  const [searchTerm, setSearchTerm] = useState('');
  const [orderFilter, setOrderFilter] = useState('all');
  const [dateRange, setDateRange] = useState('week');
  const [uploadingImages, setUploadingImages] = useState(false);

  const categories = {
    'Hazır Sistemler': [
      { id: 'gaming-pc', name: 'Gaming PC' },
      { id: 'workstation', name: 'İş İstasyonları' },
      { id: 'home-office', name: 'Ev/Ofis Sistemleri' }
    ],
    'Laptoplar': [
      { id: 'gaming-laptop', name: 'Gaming Laptop' },
      { id: 'ultrabook', name: 'Ultrabook' },
      { id: 'business-laptop', name: 'İş Laptopları' }
    ],
    'Bileşenler': [
      { id: 'cpu', name: 'İşlemciler' },
      { id: 'gpu', name: 'Ekran Kartları' },
      { id: 'motherboard', name: 'Anakartlar' }
    ],
    'Monitörler': [
      { id: 'gaming-monitor', name: 'Gaming Monitör' },
      { id: '4k-monitor', name: '4K Monitör' },
      { id: 'ultrawide', name: 'Ultrawide' }
    ],
    'Çevre Birimleri': [
      { id: 'gaming-mouse', name: 'Gaming Mouse' },
      { id: 'gaming-keyboard', name: 'Gaming Klavye' },
      { id: 'gaming-headset', name: 'Gaming Kulaklık' }
    ],
    'Depolama': [
      { id: 'ssd', name: 'SSD' },
      { id: 'hdd', name: 'HDD' },
      { id: 'nas', name: 'NAS' }
    ]
  };

  useEffect(() => {
    checkAdminAccess();
    loadDashboardData();
    if (activeTab === 'products') loadProducts();
    if (activeTab === 'orders') loadOrders();
  }, [activeTab]);

  useEffect(() => {
    if (editingId) {
      const product = products.find(p => p.id === editingId);
      if (product) {
        setEditingProduct(product);
      }
    } else if (editingId === null) {
      setEditingProduct({
        name: '',
        price: 0,
        description: '',
        image: '',
        specs: [],
        stock: 0,
        category: '',
        technical_specs: {}
      });
    }
  }, [editingId]);

  const checkAdminAccess = async () => {
    const { data: { user } } = await supabase.auth.getUser();
    if (user?.email !== 'admin@example.com') {
      navigate('/');
    }
  };

  const loadDashboardData = async () => {
    try {
      const [ordersData, productsData, customersData] = await Promise.all([
        supabase.from('orders').select('*'),
        supabase.from('products').select('*'),
        supabase.from('profiles').select('*')
      ]);

      const orders = ordersData.data || [];
      const totalRevenue = orders.reduce((sum, order) => sum + order.total_amount, 0);
      const pendingOrders = orders.filter(order => order.status === 'pending').length;
      const lowStockProducts = (productsData.data || []).filter(p => p.stock < 10).length;

      setStats({
        totalRevenue,
        totalOrders: orders.length,
        averageOrderValue: orders.length ? totalRevenue / orders.length : 0,
        pendingOrders,
        lowStockProducts,
        totalCustomers: (customersData.data || []).length
      });
    } catch (error) {
      showMessage('error', 'Dashboard verisi yüklenirken hata oluştu');
    }
  };

  const loadProducts = async () => {
    try {
      const { data, error } = await supabase
        .from('products')
        .select('*')
        .order('created_at', { ascending: false });
      
      if (error) throw error;
      setProducts(data || []);
    } catch (error) {
      showMessage('error', 'Ürünler yüklenirken hata oluştu');
    } finally {
      setLoading(false);
    }
  };

  const loadOrders = async () => {
    try {
      const { data, error } = await supabase
        .from('orders')
        .select(`
          *,
          user:profiles!orders_user_id_fkey (
            name,
            phone,
            email:users(email)
          ),
          items:order_items (
            *,
            product:products(*)
          )
        `)
        .order('created_at', { ascending: false });
      
      if (error) throw error;
      setOrders(data || []);
    } catch (error) {
      showMessage('error', 'Siparişler yüklenirken hata oluştu');
      setOrders([]);
    } finally {
      setLoading(false);
    }
  };

  const showMessage = (type: string, text: string) => {
    setMessage({ type, text });
    setTimeout(() => setMessage(null), 3000);
  };

  const handleDrag = (e: React.DragEvent) => {
    e.preventDefault();
    e.stopPropagation();
    if (e.type === "dragenter" || e.type === "dragover") {
      setDragActive(true);
    } else if (e.type === "dragleave") {
      setDragActive(false);
    }
  };

  const handleDrop = async (e: React.DragEvent) => {
    e.preventDefault();
    e.stopPropagation();
    setDragActive(false);

    const files = Array.from(e.dataTransfer.files);
    if (files.length > 0) {
      await handleMultipleFileUpload(files);
    }
  };

  const handleMultipleFileUpload = async (files: File[]) => {
    try {
      setUploadingImages(true);
      const uploadedUrls: string[] = [];

      for (const file of files) {
        // Validate file type
        const allowedTypes = ['image/jpeg', 'image/png', 'image/webp'];
        if (!allowedTypes.includes(file.type)) {
          throw new Error('Sadece JPG, PNG ve WEBP dosyaları yükleyebilirsiniz.');
        }

        // Validate file size (max 5MB)
        if (file.size > 5 * 1024 * 1024) {
          throw new Error('Dosya boyutu 5MB\'dan küçük olmalıdır.');
        }

        // Generate unique filename
        const fileExt = file.name.split('.').pop()?.toLowerCase() || '';
        const fileName = `${Math.random()}.${fileExt}`;
        const filePath = `product-images/${fileName}`;

        // Upload file
        const { error: uploadError } = await supabase.storage
          .from('public')
          .upload(filePath, file);

        if (uploadError) throw uploadError;

        // Get public URL
        const { data: { publicUrl } } = supabase.storage
          .from('public')
          .getPublicUrl(filePath);

        uploadedUrls.push(publicUrl);
      }

      // Update product with first image URL
      if (uploadedUrls.length > 0) {
        setEditingProduct(prev => ({ ...prev, image: uploadedUrls[0] }));
      }

      showMessage('success', `${uploadedUrls.length} resim başarıyla yüklendi`);

    } catch (error: any) {
      showMessage('error', error.message);
    } finally {
      setUploadingImages(false);
    }
  };

  const handleUpdateOrderStatus = async (orderId: string, newStatus: string) => {
    try {
      const { error } = await supabase
        .from('orders')
        .update({ status: newStatus })
        .eq('id', orderId);

      if (error) throw error;
      
      setOrders(orders.map(order =>
        order.id === orderId ? { ...order, status: newStatus } : order
      ));
      
      showMessage('success', 'Sipariş durumu güncellendi');
    } catch (error) {
      showMessage('error', 'Sipariş durumu güncellenirken hata oluştu');
    }
  };

  const handleSaveProduct = async () => {
    try {
      if (!editingProduct.name || !editingProduct.price || !editingProduct.category) {
        throw new Error('Lütfen gerekli alanları doldurun');
      }

      const productData = {
        name: editingProduct.name,
        price: editingProduct.price,
        description: editingProduct.description,
        image: editingProduct.image,
        specs: editingProduct.specs,
        stock: editingProduct.stock,
        category: editingProduct.category,
        brand: editingProduct.brand,
        technical_specs: editingProduct.technical_specs
      };

      if (editingId) {
        const { error } = await supabase
          .from('products')
          .update(productData)
          .eq('id', editingId);

        if (error) throw error;
        showMessage('success', 'Ürün başarıyla güncellendi');
      } else {
        const { error } = await supabase
          .from('products')
          .insert([productData]);

        if (error) throw error;
        showMessage('success', 'Ürün başarıyla eklendi');
      }

      setEditingId(undefined);
      loadProducts();
    } catch (error: any) {
      showMessage('error', error.message);
    }
  };

  const handleDeleteProduct = async (productId: string) => {
    try {
      const { error } = await supabase
        .from('products')
        .delete()
        .eq('id', productId);

      if (error) throw error;
      
      setProducts(products.filter(p => p.id !== productId));
      showMessage('success', 'Ürün başarıyla silindi');
    } catch (error) {
      showMessage('error', 'Ürün silinirken hata oluştu');
    }
  };

  const renderProductForm = () => (
    <div className="space-y-6">
      <div>
        <label className="block text-gray-700 text-sm font-medium mb-2">Ürün Adı</label>
        <input
          type="text"
          value={editingProduct.name || ''}
          onChange={(e) => setEditingProduct(prev => ({ ...prev, name: e.target.value }))}
          className="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
        />
      </div>

      <div>
        <label className="block text-gray-700 text-sm font-medium mb-2">Kategori</label>
        <select
          value={editingProduct.category || ''}
          onChange={(e) => setEditingProduct(prev => ({ ...prev, category: e.target.value }))}
          className="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
        >
          <option value="">Kategori Seçin</option>
          {Object.entries(categories).map(([group, items]) => (
            <optgroup key={group} label={group}>
              {items.map(item => (
                <option key={item.id} value={item.id}>
                  {item.name}
                </option>
              ))}
            </optgroup>
          ))}
        </select>
      </div>

      <div>
        <label className="block text-gray-700 text-sm font-medium mb-2">Marka</label>
        <input
          type="text"
          value={editingProduct.brand || ''}
          onChange={(e) => setEditingProduct(prev => ({ ...prev, brand: e.target.value }))}
          className="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
        />
      </div>

      <div>
        <label className="block text-gray-700 text-sm font-medium mb-2">Fiyat</label>
        <input
          type="number"
          value={editingProduct.price || ''}
          onChange={(e) => setEditingProduct(prev => ({ ...prev, price: parseFloat(e.target.value) }))}
          className="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
        />
      </div>

      <div>
        <label className="block text-gray-700 text-sm font-medium mb-2">Stok</label>
        <input
          type="number"
          value={editingProduct.stock || ''}
          onChange={(e) => setEditingProduct(prev => ({ ...prev, stock: parseInt(e.target.value) }))}
          className="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
        />
      </div>

      <div>
        <label className="block text-gray-700 text-sm font-medium mb-2">Açıklama</label>
        <textarea
          value={editingProduct.description || ''}
          onChange={(e) => setEditingProduct(prev => ({ ...prev, description: e.target.value }))}
          rows={4}
          className="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
        />
      </div>

      <div>
        <label className="block text-gray-700 text-sm font-medium mb-2">Özellikler</label>
        <div className="mt-1 space-y-2">
          {(editingProduct.specs || []).map((spec, index) => (
            <div key={index} className="flex gap-2">
              <input
                type="text"
                value={spec}
                onChange={(e) => {
                  const newSpecs = [...(editingProduct.specs || [])];
                  newSpecs[index] = e.target.value;
                  setEditingProduct(prev => ({ ...prev, specs: newSpecs }));
                }}
                className="flex-1 px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              />
              <button
                onClick={() => {
                  const newSpecs = [...(editingProduct.specs || [])];
                  newSpecs.splice(index, 1);
                  setEditingProduct(prev => ({ ...prev, specs: newSpecs }));
                }}
                className="p-2 text-red-600 hover:bg-red-50 rounded-lg"
              >
                <X className="w-5 h-5" />
              </button>
            </div>
          ))}
          <button
            onClick={() => setEditingProduct(prev => ({ 
              ...prev, 
              specs: [...(prev.specs || []), '']
            }))}
            className="text-blue-600 hover:text-blue-700 text-sm"
          >
            + Özellik Ekle
          </button>
        </div>
      </div>

      <div>
        <label className="block text-gray-700 text-sm font-medium mb-2">Teknik Özellikler</label>
        <div className="mt-1 space-y-2">
          {Object.entries(editingProduct.technical_specs || {}).map(([key, value], index) => (
            <div key={index} className="flex gap-2">
              <input
                type="text"
                value={key}
                onChange={(e) => {
                  const newSpecs = { ...(editingProduct.technical_specs || {}) };
                  const oldValue = newSpecs[key];
                  delete newSpecs[key];
                  newSpecs[e.target.value] = oldValue;
                  setEditingProduct(prev => ({ ...prev, technical_specs: newSpecs }));
                }}
                placeholder="Özellik Adı"
                className="w-1/3 px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              />
              <input
                type="text"
                value={value}
                onChange={(e) => {
                  const newSpecs = { ...(editingProduct.technical_specs || {}) };
                  newSpecs[key] = e.target.value;
                  setEditingProduct(prev => ({ ...prev, technical_specs: newSpecs }));
                }}
                placeholder="Değer"
                className="flex-1 px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              />
              <button
                onClick={() => {
                  const newSpecs = { ...(editingProduct.technical_specs || {}) };
                  delete newSpecs[key];
                  setEditingProduct(prev => ({ ...prev, technical_specs: newSpecs }));
                }}
                className="p-2 text-red-600 hover:bg-red-50 rounded-lg"
              >
                <X className="w-5 h-5" />
              </button>
            </div>
          ))}
          <button
            onClick={() => {
              const newSpecs = { ...(editingProduct.technical_specs || {}) };
              newSpecs[`özellik_${Object.keys(newSpecs).length + 1}`] = '';
              setEditingProduct(prev => ({ ...prev, technical_specs: newSpecs }));
            }}
            className="text-blue-600 hover:text-blue-700 text-sm"
          >
            + Teknik Özellik Ekle
          </button>
        </div>
      </div>

      <div>
        <label className="block text-gray-700 text-sm font-medium mb-2">Ürün Görseli</label>
        <div
          className={`mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-dashed rounded-lg ${
            dragActive ? 'border-blue-500 bg-blue-50' : 'border-gray-300'
          }`}
          onDragEnter={handleDrag}
          onDragLeave={handleDrag}
          onDragOver={handleDrag}
          onDrop={handleDrop}
        >
          <div className="space-y-2 text-center">
            <div className="flex text-sm text-gray-600">
              <label
                htmlFor="file-upload"
                className="relative cursor-pointer rounded-md font-medium text-blue-600 hover:text-blue-500 focus-within:outline-none focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-blue-500"
              >
                <span>Dosya Yükle</span>
                <input
                  id="file-upload"
                  name="file-upload"
                  type="file"
                  className="sr-only"
                  ref={fileInputRef}
                  onChange={(e) => {
                    const files = e.target.files;
                    if (files && files.length > 0) {
                      handleMultipleFileUpload(Array.from(files));
                    }
                  }}
                  multiple
                  accept="image/jpeg,image/png,image/webp"
                />
              </label>
              <p className="pl-1">veya sürükleyip bırakın</p>
            </div>
            <p className="text-xs text-gray-500">PNG, JPG, WEBP (Max 5MB)</p>
            {uploadingImages && (
              <div className="flex items-center justify-center gap-2 text-blue-600">
                <Loader2 className="w-5 h-5 animate-spin" />
                <span>Yükleniyor...</span>
              </div>
            )}
          </div>
        </div>
        {editingProduct.image && (
          <div className="mt-4">
            <h4 className="text-sm font-medium text-gray-700 mb-2">Yüklenen Görsel</h4>
            <div className="relative w-32 h-32 group">
              <img
                src={editingProduct.image}
                alt="Preview"
                className="w-full h-full object-cover rounded-lg"
              />
              <button
                onClick={() => setEditingProduct(prev => ({ ...prev, image: '' }))}
                className="absolute top-2 right-2 p-1 bg-red-500 text-white rounded-full opacity-0 group-hover:opacity-100 transition-opacity"
              >
                <X className="w-4 h-4" />
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );

  const renderDashboard = () => (
    <div className="space-y-6">
      {/* Stats Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <div className="bg-white rounded-xl shadow-md p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-gray-500">Toplam Gelir</p>
              <h3 className="text-2xl font-bold">₺{stats.totalRevenue.toLocaleString('tr-TR')}</h3>
            </div>
            <DollarSign className="w-12 h-12 text-green-500" />
          </div>
          <div className="mt-4 flex items-center text-sm text-green-600">
            <TrendingUp className="w-4 h-4 mr-1" />
            <span>%12 artış</span>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-md p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-gray-500">Toplam Sipariş</p>
              <h3 className="text-2xl font-bold">{stats.totalOrders}</h3>
            </div>
            <ShoppingCart className="w-12 h-12 text-blue-500" />
          </div>
          <div className="mt-4 flex items-center text-sm text-gray-500">
            <Clock className="w-4 h-4 mr-1" />
            <span>{stats.pendingOrders} bekleyen sipariş</span>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-md p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-gray-500">Ortalama Sipariş</p>
              <h3 className="text-2xl font-bold">₺{stats.averageOrderValue.toLocaleString('tr-TR')}</h3>
            </div>
            <BarChart3 className="w-12 h-12 text-purple-500" />
          </div>
          <div className="mt-4 flex items-center text-sm text-purple-600">
            <TrendingUp className="w-4 h-4 mr-1" />
            <span>%8 artış</span>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-md p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-gray-500">Toplam Müşteri</p>
              <h3 className="text-2xl font-bold">{stats.totalCustomers}</h3>
            </div>
            <Users className="w-12 h-12 text-indigo-500" />
          </div>
          <div className="mt-4 flex items-center text-sm text-indigo-600">
            <TrendingUp className="w-4 h-4 mr-1" />
            <span>%15 artış</span>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-md p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-gray-500">Düşük Stok</p>
              <h3 className="text-2xl font-bold">{stats.lowStockProducts}</h3>
            </div>
            <AlertCircle className="w-12 h-12 text-red-500" />
          </div>
          <div className="mt-4 flex items-center text-sm text-red-600">
            <AlertTriangle className="w-4 h-4 mr-1" />
            <span>Stok güncelleme gerekli</span>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-md p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-gray-500">Bekleyen Siparişler</p>
              <h3 className="text-2xl font-bold">{stats.pendingOrders}</h3>
            </div>
            <Clock className="w-12 h-12 text-orange-500" />
          </div>
          <div className="mt-4 flex items-center text-sm text-orange-600">
            <AlertCircle className="w-4 h-4 mr-1" />
            <span>İşlem bekliyor</span>
          </div>
        </div>
      </div>

      {/* Recent Orders */}
      <div className="bg-white rounded-xl shadow-md p-6">
        <div className="flex justify-between items-center mb-6">
          <h3 className="text-xl font-semibold">Son Siparişler</h3>
          <button
            onClick={() => setActiveTab('orders')}
            className="text-blue-600 hover:text-blue-700 flex items-center gap-1"
          >
            Tümünü Gör
            <ChevronRight className="w-4 h-4" />
          </button>
        </div>

        <div className="overflow-x-auto">
          {orders.length > 0 ? (
            <table className="w-full">
              <thead>
                <tr className="text-left border-b">
                  <th className="pb-3">Sipariş No</th>
                  <th className="pb-3">Müşteri</th>
                  <th className="pb-3">Tutar</th>
                  <th className="pb-3">Durum</th>
                  <th className="pb-3">Tarih</th>
                </tr>
              </thead>
              <tbody>
                {orders.slice(0, 5).map(order => (
                  <tr key={order.id} className="border-b last:border-b-0">
                    <td className="py-4">#{order.id.slice(0, 8)}</td>
                    <td className="py-4">{order.user?.name || 'İsimsiz'}</td>
                    <td className="py-4">₺{order.total_amount.toLocaleString('tr-TR')}</td>
                    <td className="py-4">
                      <span className={`px-3 py-1 rounded-full text-sm ${
                        order.status === 'completed' ? 'bg-green-100 text-green-700' :
                        order.status === 'processing' ? 'bg-blue-100 text-blue-700' :
                        order.status === 'cancelled' ? 'bg-red-100 text-red-700' :
                        'bg-gray-100 text-gray-700'
                      }`}>
                        {order.status}
                      </span>
                    </td>
                    <td className="py-4">{new Date(order.created_at).toLocaleDateString('tr-TR')}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          ) : (
            <div className="text-center py-8">
              <Package className="w-16 h-16 text-gray-400 mx-auto mb-4" />
              <p className="text-gray-600">Henüz sipariş bulunmuyor.</p>
            </div>
          )}
        </div>
      
      </div>
    </div>
  );

  const renderOrders = () => (
    <div className="space-y-6">
      <div className="bg-white rounded-xl shadow-md p-6">
        <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-6">
          <h3 className="text-xl font-semibold">Siparişler</h3>
          
          <div className="flex flex-wrap gap-4">
            <div className="relative">
              <Search className="absolute left-3 top-2.5 text-gray-400 w-5 h-5" />
              <input
                type="text"
                placeholder="Sipariş Ara..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="pl-10 pr-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500"
              />
            </div>

            <select
              value={orderFilter}
              onChange={(e) => setOrderFilter(e.target.value)}
              className="px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500"
            >
              <option value="all">Tüm Durumlar</option>
              <option value="pending">Bekleyen</option>
              <option value="processing">İşlemde</option>
              <option value="completed">Tamamlanan</option>
              <option value="cancelled">İptal Edilen</option>
            </select>

            <select
              value={dateRange}
              onChange={(e) => setDateRange(e.target.value)}
              className="px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500"
            >
              <option value="today">Bugün</option>
              <option value="week">Bu Hafta</option>
              <option value="month">Bu Ay</option>
              <option value="year">Bu Yıl</option>
            </select>

            <button
              onClick={() => loadOrders()}
              className="p-2 text-gray-600 hover:text-gray-800 hover:bg-gray-100 rounded-lg"
              title="Yenile"
            >
              <RefreshCw className="w-5 h-5" />
            </button>

            <button
              onClick={() => {/* Export logic */}}
              className="p-2 text-gray-600 hover:text-gray-800 hover:bg-gray-100 rounded-lg"
              title="Dışa Aktar"
            >
              <Download className="w-5 h-5" />
            </button>

            <button
              onClick={() => {/* Print logic */}}
              className="p-2 text-gray-600 hover:text-gray-800 hover:bg-gray-100 rounded-lg"
              title="Yazdır"
            >
              <Printer className="w-5 h-5" />
            </button>
          </div>
        </div>

        <div className="overflow-x-auto">
          {orders.length > 0 ? (
            <table className="w-full">
              <thead>
                <tr className="text-left border-b">
                  <th className="pb-3">Sipariş No</th>
                  <th className="pb-3">Müşteri</th>
                  <th className="pb-3">Ürünler</th>
                  <th className="pb-3">Tutar</th>
                  <th className="pb-3">Durum</th>
                  <th className="pb-3">Tarih</th>
                  <th className="pb-3">İşlemler</th>
                </tr>
              </thead>
              <tbody>
                {orders
                  .filter(order => 
                    orderFilter === 'all' || order.status === orderFilter
                  )
                  .filter(order =>
                    order.id.includes(searchTerm) ||
                    (order.user?.name || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
                    (order.user?.email || '').toLowerCase().includes(searchTerm.toLowerCase())
                  )
                  .map(order => (
                    <tr key={order.id} className="border-b last:border-b-0">
                      <td className="py-4">#{order.id.slice(0, 8)}</td>
                      <td className="py-4">
                        <div>
                          <div className="font-medium">{order.user?.name || 'İsimsiz'}</div>
                          <div className="text-sm text-gray-500">{order.user?.email}</div>
                        </div>
                      </td>
                      <td className="py-4">
                        <div className="flex -space-x-2">
                          {order.items?.map(item => (
                            <img
                              key={item.id}
                              src={item.product?.image}
                              alt={item.product?.name}
                              className="w-8 h-8 rounded-full border-2 border-white"
                              title={`${item.product?.name} (${item.quantity} adet)`}
                            />
                          ))}
                        </div>
                      </td>
                      <td className="py-4">₺{order.total_amount.toLocaleString('tr-TR')}</td>
                      <td className="py-4">
                        <select
                          value={order.status}
                          onChange={(e) => handleUpdateOrderStatus(order.id, e.target.value)}
                          className={`px-3 py-1 rounded-lg border ${
                            order.status === 'completed' ? 'bg-green-100 text-green-800 border-green-200' :
                            order.status === 'processing' ? 'bg-blue-100 text-blue-800 border-blue-200' :
                            order.status === 'cancelled' ? 'bg-red-100 text-red-800 border-red-200' :
                            'bg-gray-100 text-gray-800 border-gray-200'
                          }`}
                        >
                          <option value="pending">Bekliyor</option>
                          <option value="processing">İşlemde</option>
                          <option value="completed">Tamamlandı</option>
                          <option value="cancelled">İptal Edildi</option>
                        </select>
                      </td>
                      <td className="py-4">{new Date(order.created_at).toLocaleDateString('tr-TR')}</td>
                      <td className="py-4">
                        <button
                          onClick={() => {/* View order details */}}
                          className="text-blue-600 hover:text-blue-700"
                        >
                          Detaylar
                        </button>
                      </td>
                    </tr>
                  ))}
              </tbody>
            </table>
          ) : (
            <div className="text-center py-8">
              <Package className="w-16 h-16 text-gray-400 mx-auto mb-4" />
              <p className="text-gray-600">Henüz sipariş bulunmuyor.</p>
            </div>
          )}
        </div>
      </div>
    </div>
  );

  const renderProducts = () => (
    <div className="space-y-6">
      <div className="bg-white rounded-xl shadow-md p-6">
        <div className="flex justify-between items-center mb-6">
          <h3 className="text-xl font-semibold">Ürünler</h3>
          <button
            onClick={() => setEditingId(null)}
            className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors flex items-center gap-2"
          >
            <PlusCircle className="w-5 h-5" />
            Yeni Ürün
          </button>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full">
            <thead>
              <tr className="text-left border-b">
                <th className="pb-3">Ürün</th>
                <th className="pb-3">Kategori</th>
                <th className="pb-3">Fiyat</th>
                <th className="pb-3">Stok</th>
                <th className="pb-3">Değerlendirme</th>
                <th className="pb-3">İşlemler</th>
              </tr>
            </thead>
            <tbody>
              {products.map(product => (
                <tr key={product.id} className="border-b last:border-b-0">
                  <td className="py-4">
                    <div className="flex items-center gap-3">
                      <img
                        src={product.image}
                        alt={product.name}
                        className="w-12 h-12 rounded-lg object-cover"
                      />
                      <div>
                        <div className="font-medium">{product.name}</div>
                        <div className="text-sm text-gray-500">{product.brand}</div>
                      </div>
                    </div>
                  </td>
                  <td className="py-4">
                    <span className="px-3 py-1 bg-gray-100 rounded-full text-sm">
                      {product.category}
                    </span>
                  </td>
                  <td className="py-4">₺{product.price.toLocaleString('tr-TR')}</td>
                  <td className="py-4">
                    <span className={`px-3 py-1 rounded-full text-sm ${
                      product.stock < 10 ? 'bg-red-100 text-red-700' : 'bg-green-100 text-green-700'
                    }`}>
                      {product.stock}
                    </span>
                  </td>
                  <td className="py-4">
                    <div className="flex items-center gap-1">
                      <Star className={`w-4 h-4 ${
                        product.rating >= 4 ? 'text-yellow-400 fill-current' : 'text-gray-300'
                      }`} />
                      <span>{product.rating}</span>
                    </div>
                  </td>
                  <td className="py-4">
                    <div className="flex items-center gap-2">
                      <button
                        onClick={() => setEditingId(product.id)}
                        className="p-2 text-blue-600 hover:bg-blue-50 rounded-lg"
                        title="Düzenle"
                      >
                        <Pencil className="w-4 h-4" />
                      </button>
                      <button
                        onClick={() => handleDeleteProduct(product.id)}
                        className="p-2 text-red-600 hover:bg-red-50 rounded-lg"
                        title="Sil"
                      >
                        <Trash2 className="w-4 h-4" />
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      {(editingId !== undefined) && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4">
          <div className="bg-white rounded-xl shadow-xl max-w-4xl w-full max-h-[90vh] overflow-y-auto">
            <div className="p-6">
              <div className="flex justify-between items-center mb-6">
                <h3 className="text-xl font-semibold">
                  {editingId ? 'Ürün Düzenle' : 'Yeni Ürün'}
                </h3>
                <button
                  onClick={() => setEditingId(undefined)}
                  className="text-gray-500 hover:text-gray-700"
                >
                  <X className="w-6 h-6" />
                </button>
              </div>
              
              {renderProductForm()}

              <div className="mt-6 flex justify-end gap-3">
                <button
                  onClick={() => setEditingId(undefined)}
                  className="px-4 py-2 text-gray-600 hover:bg-gray-100 rounded-lg"
                >
                  İptal
                </button>
                <button
                  onClick={handleSaveProduct}
                  className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
                >
                  {editingId ? 'Güncelle' : 'Ekle'}
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-white border-b">
        <div className="container mx-auto px-4">
          <div className="flex items-center justify-between h-16">
            <h1 className="text-xl font-bold">Admin Panel</h1>
            <div className="flex items-center gap-4">
              <span className="text-sm text-gray-500">Admin olarak giriş yapıldı</span>
              <Settings className="w-5 h-5 text-gray-500" />
            </div>
          </div>
        </div>
      </div>

      <div className="container mx-auto px-4 py-8">
        {message && (
          <div className={`mb-6 p-4 rounded-lg flex items-center gap-2 ${
            message.type === 'error' ? 'bg-red-100 text-red-700' : 'bg-green-100 text-green-700'
          }`}>
            {message.type === 'error' ? (
              <AlertTriangle className="w-5 h-5" />
            ) : (
              <Check className="w-5 h-5" />
            )}
            {message.text}
          </div>
        )}

        <div className="flex gap-4 mb-8">
          <button
            onClick={() => setActiveTab('dashboard')}
            className={`px-4 py-2 rounded-lg flex items-center gap-2 ${
              activeTab === 'dashboard' ? 'bg-blue-600 text-white' : 'bg-white text-gray-700 hover:bg-gray-50'
            }`}
          >
            <BarChart3 className="w-5 h-5" />
            Dashboard
          </button>
          <button
            onClick={() => setActiveTab('orders')}
            className={`px-4 py-2 rounded-lg flex items-center gap-2 ${
              activeTab === 'orders' ? 'bg-blue-600 text-white' : 'bg-white text-gray-700 hover:bg-gray-50'
            }`}
          >
            <ShoppingCart className="w-5 h-5" />
            Siparişler
          </button>
          <button
            onClick={() => setActiveTab('products')}
            className={`px-4 py-2 rounded-lg flex items-center gap-2 ${
              activeTab === 'products' ? 'bg-blue-600 text-white' : 'bg-white text-gray-700 hover:bg-gray-50'
            }`}
          >
            <Package className="w-5 h-5" />
            Ürünler
          </button>
        </div>

        {activeTab === 'dashboard' && renderDashboard()}
        {activeTab === 'orders' && renderOrders()}
        {activeTab === 'products' && renderProducts()}
      
      </div>
    </div>
  );
};

export default Admin;