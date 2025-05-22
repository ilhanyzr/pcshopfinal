import React, { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import { 
  Laptop, 
  Cpu, 
  Monitor, 
  Package, 
  ChevronRight,
  Gamepad,
  Server,
  Keyboard,
  Mouse,
  Headphones,
  Star,
  ShoppingCart
} from 'lucide-react';
import { supabase } from '../lib/supabase';
import { useCartStore } from '../store/cartStore';

interface Product {
  id: string;
  name: string;
  price: number;
  description: string;
  image: string;
  rating: number;
  stock: number;
  category: string;
  brand: string;
}

const Products = () => {
  const navigate = useNavigate();
  const [hoveredCategory, setHoveredCategory] = useState<string | null>(null);
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);
  const [page, setPage] = useState(0);
  const addItem = useCartStore((state) => state.addItem);

  const categories = [
    {
      id: 'computers',
      title: 'Hazır Sistemler',
      description: 'Profesyonel olarak hazırlanmış bilgisayar sistemleri',
      icon: Package,
      image: 'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
      subcategories: [
        { id: 'gaming-pc', name: 'Gaming PC' },
        { id: 'workstation', name: 'İş İstasyonları' },
        { id: 'home-office', name: 'Ev/Ofis Sistemleri' }
      ]
    },
    {
      id: 'laptops',
      title: 'Laptoplar',
      description: 'Her ihtiyaca uygun notebook modelleri',
      icon: Laptop,
      image: 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
      subcategories: [
        { id: 'gaming-laptop', name: 'Gaming Laptop' },
        { id: 'ultrabook', name: 'Ultrabook' },
        { id: 'business-laptop', name: 'İş Laptopları' }
      ]
    },
    {
      id: 'components',
      title: 'Bileşenler',
      description: 'Yüksek performanslı donanım parçaları',
      icon: Cpu,
      image: 'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
      subcategories: [
        { id: 'cpu', name: 'İşlemciler' },
        { id: 'gpu', name: 'Ekran Kartları' },
        { id: 'motherboard', name: 'Anakartlar' }
      ]
    },
    {
      id: 'monitors',
      title: 'Monitörler',
      description: 'Gaming ve profesyonel monitörler',
      icon: Monitor,
      image: 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
      subcategories: [
        { id: 'gaming-monitor', name: 'Gaming Monitör' },
        { id: '4k-monitor', name: '4K Monitör' },
        { id: 'ultrawide', name: 'Ultrawide' }
      ]
    },
    {
      id: 'gaming',
      title: 'Gaming Ekipmanları',
      description: 'Oyuncu ekipmanları ve aksesuarları',
      icon: Gamepad,
      image: 'https://images.unsplash.com/photo-1542751371-adc38448a05e?auto=format&fit=crop&q=80&w=1920',
      subcategories: [
        { id: 'gaming-mouse', name: 'Gaming Mouse' },
        { id: 'gaming-keyboard', name: 'Gaming Klavye' },
        { id: 'gaming-headset', name: 'Gaming Kulaklık' }
      ]
    },
    {
      id: 'storage',
      title: 'Depolama',
      description: 'SSD ve HDD çözümleri',
      icon: Server,
      image: 'https://images.unsplash.com/photo-1601737487795-dab270904e03?auto=format&fit=crop&q=80&w=1920',
      subcategories: [
        { id: 'ssd', name: 'SSD' },
        { id: 'hdd', name: 'Harddisk' },
        { id: 'nas', name: 'NAS' }
      ]
    }
  ];

  const loadProducts = useCallback(async () => {
    if (loading || !hasMore) return;

    setLoading(true);
    const from = page * 12;
    const to = from + 11;

    try {
      const { data, error } = await supabase
        .from('products')
        .select('*')
        .range(from, to)
        .order('created_at', { ascending: false });

      if (error) throw error;

      if (data.length < 12) {
        setHasMore(false);
      }

      setProducts(prev => [...prev, ...data]);
      setPage(prev => prev + 1);
    } catch (error) {
      console.error('Error loading products:', error);
    } finally {
      setLoading(false);
    }
  }, [page, loading, hasMore]);

  useEffect(() => {
    loadProducts();
  }, []);

  useEffect(() => {
    const handleScroll = () => {
      if (
        window.innerHeight + document.documentElement.scrollTop
        === document.documentElement.offsetHeight
      ) {
        loadProducts();
      }
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, [loadProducts]);

  const handleCategoryClick = (categoryId: string) => {
    navigate(`/products/${categoryId}`);
  };

  return (
    <div className="max-w-7xl mx-auto px-4 py-12">
      <h1 className="text-3xl font-bold text-gray-900 mb-8">Kategoriler</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-16">
        {categories.map((category) => (
          <div
            key={category.id}
            className="relative group cursor-pointer"
            onMouseEnter={() => setHoveredCategory(category.id)}
            onMouseLeave={() => setHoveredCategory(null)}
          >
            <div className="relative h-96 rounded-xl overflow-hidden">
              <img
                src={category.image}
                alt={category.title}
                className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/50 to-transparent" />
              <div className="absolute bottom-0 left-0 right-0 p-6">
                <div className="flex items-center gap-3 mb-3">
                  <category.icon className="w-8 h-8 text-blue-400" />
                  <h3 className="text-2xl font-bold text-white">{category.title}</h3>
                </div>
                <p className="text-gray-300 mb-4">{category.description}</p>
                <div className="space-y-2">
                  {category.subcategories.map((sub) => (
                    <div
                      key={sub.id}
                      onClick={() => handleCategoryClick(sub.id)}
                      className="flex items-center gap-2 text-white/80 hover:text-white transition-colors"
                    >
                      <ChevronRight className="w-4 h-4" />
                      <span>{sub.name}</span>
                    </div>
                  ))}
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>

      <h2 className="text-2xl font-bold text-gray-900 mb-8">Tüm Ürünler</h2>
      
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        {products.map((product) => (
          <div 
            key={product.id}
            className="bg-white rounded-xl shadow-sm hover:shadow-lg transition-shadow duration-300 group"
          >
            <div 
              className="relative cursor-pointer"
              onClick={() => navigate(`/product/${product.id}`)}
            >
              <img
                src={product.image}
                alt={product.name}
                className="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-300"
              />
              {product.stock === 0 ? (
                <span className="absolute top-2 right-2 bg-red-500 text-white px-2 py-1 rounded-full text-sm">
                  Tükendi
                </span>
              ) : product.stock <= 10 ? (
                <span className="absolute top-2 right-2 bg-orange-500 text-white px-2 py-1 rounded-full text-sm">
                  Son {product.stock} ürün
                </span>
              ) : null}
            </div>
            
            <div className="p-4">
              <div className="mb-2">
                <h3 className="text-lg font-semibold text-gray-900 hover:text-blue-600 cursor-pointer truncate">
                  {product.name}
                </h3>
                <span className="text-sm text-gray-600">{product.brand}</span>
              </div>
              
              <div className="flex items-center gap-1 mb-3">
                {[...Array(5)].map((_, i) => (
                  <Star
                    key={i}
                    className={`w-4 h-4 ${
                      i < Math.floor(product.rating)
                        ? 'text-yellow-400 fill-current'
                        : 'text-gray-300'
                    }`}
                  />
                ))}
                <span className="text-sm text-gray-600 ml-1">{product.rating}</span>
              </div>

              <div className="flex items-center justify-between">
                <span className="text-xl font-bold text-blue-600">
                  ₺{product.price.toLocaleString('tr-TR')}
                </span>
                <button
                  onClick={() => addItem(product)}
                  disabled={product.stock === 0}
                  className={`p-2 rounded-lg transition-colors ${
                    product.stock === 0
                      ? 'text-gray-400 cursor-not-allowed'
                      : 'text-blue-600 hover:bg-blue-50'
                  }`}
                  title={product.stock === 0 ? 'Ürün tükendi' : 'Sepete Ekle'}
                >
                  <ShoppingCart className="w-5 h-5" />
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>

      {loading && (
        <div className="flex justify-center items-center mt-8">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
        </div>
      )}
    </div>
  );
};

export default Products;