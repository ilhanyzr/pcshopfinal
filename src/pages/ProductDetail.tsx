import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { 
  Star, 
  ShoppingCart, 
  Truck, 
  Shield, 
  CreditCard, 
  Package2,
  Check,
  Info,
  ChevronRight,
  Facebook,
  Twitter,
  Share2,
  AlertTriangle,
  Loader2,
  ChevronLeft
} from 'lucide-react';
import { supabase } from '../lib/supabase';
import { useCartStore } from '../store/cartStore';

interface Product {
  id: string;
  name: string;
  price: number;
  description: string;
  image: string | string[];
  specs: string[];
  rating: number;
  stock: number;
  category: string;
  technical_specs: {
    cpu?: {
      model?: string;
      cores?: number;
      threads?: number;
      base_clock?: string;
      boost_clock?: string;
      cache?: string;
    };
    gpu?: {
      model?: string;
      vram?: string;
      type?: string;
    };
    ram?: {
      size?: string;
      speed?: string;
      type?: string;
    };
    storage?: {
      primary?: string;
      secondary?: string;
    };
  };
}

const ProductDetail = () => {
  const { id } = useParams<{ id: string }>();
  const [product, setProduct] = useState<Product | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [selectedTab, setSelectedTab] = useState<'specs' | 'details'>('specs');
  const [currentImageIndex, setCurrentImageIndex] = useState(0);
  const addItem = useCartStore(state => state.addItem);

  useEffect(() => {
    const fetchProduct = async () => {
      try {
        setLoading(true);
        setError(null);
        
        const { data, error } = await supabase
          .from('products')
          .select('*')
          .eq('id', id)
          .single();

        if (error) throw error;
        if (!data) throw new Error('Product not found');

        setProduct(data);
      } catch (err) {
        setError(err instanceof Error ? err.message : 'An error occurred');
      } finally {
        setLoading(false);
      }
    };

    if (id) {
      fetchProduct();
    }
  }, [id]);

  const getImageArray = () => {
    if (!product) return [];
    return Array.isArray(product.image) ? product.image : [product.image];
  };

  const nextImage = () => {
    const images = getImageArray();
    if (images.length > 0) {
      setCurrentImageIndex((prev) => (prev + 1) % images.length);
    }
  };

  const previousImage = () => {
    const images = getImageArray();
    if (images.length > 0) {
      setCurrentImageIndex((prev) => (prev - 1 + images.length) % images.length);
    }
  };

  const selectImage = (index: number) => {
    setCurrentImageIndex(index);
  };

  const renderSpecRow = (label: string, value: unknown) => {
    if (!value) return null;

    if (typeof value === 'object' && value !== null) {
      return (
        <div className="py-2 border-b last:border-b-0">
          <div className="text-gray-600">{label}</div>
          <div className="mt-2 pl-4 space-y-1">
            {Object.entries(value).map(([key, val]) => (
              <div key={key} className="flex justify-between">
                <span className="text-gray-500 capitalize">{key.replace(/_/g, ' ')}</span>
                <span className="font-medium">{val}</span>
              </div>
            ))}
          </div>
        </div>
      );
    }

    return (
      <div className="flex justify-between py-2 border-b last:border-b-0">
        <span className="text-gray-600">{label}</span>
        <span className="font-medium">{String(value)}</span>
      </div>
    );
  };

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="flex flex-col items-center gap-4">
          <Loader2 className="w-12 h-12 text-blue-600 animate-spin" />
          <p className="text-gray-600">Loading product details...</p>
        </div>
      </div>
    );
  }

  if (error || !product) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="bg-red-50 text-red-700 p-4 rounded-lg max-w-md text-center">
          <AlertTriangle className="w-12 h-12 mx-auto mb-4" />
          <p className="text-lg font-semibold">Error Loading Product</p>
          <p className="mt-2">{error}</p>
        </div>
      </div>
    );
  }

  const images = getImageArray();

  return (
    <div className="max-w-7xl mx-auto px-4 py-8">
      {/* Breadcrumb */}
      <nav className="flex items-center gap-2 text-sm text-gray-500 mb-6">
        <a href="/" className="hover:text-blue-600">Ana Sayfa</a>
        <ChevronRight className="w-4 h-4" />
        <a href="/products" className="hover:text-blue-600">Ürünler</a>
        <ChevronRight className="w-4 h-4" />
        <span className="text-gray-900">{product.name}</span>
      </nav>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
        {/* Product Image Gallery */}
        <div>
          <div className="bg-white rounded-lg shadow-lg p-6 relative">
            <img
              src={images[currentImageIndex]}
              alt={product.name}
              className="w-full h-auto object-contain"
            />
            {images.length > 1 && (
              <>
                <button
                  onClick={previousImage}
                  className="absolute left-4 top-1/2 transform -translate-y-1/2 bg-white/80 hover:bg-white p-2 rounded-full shadow-lg"
                >
                  <ChevronLeft className="w-6 h-6 text-gray-800" />
                </button>
                <button
                  onClick={nextImage}
                  className="absolute right-4 top-1/2 transform -translate-y-1/2 bg-white/80 hover:bg-white p-2 rounded-full shadow-lg"
                >
                  <ChevronRight className="w-6 h-6 text-gray-800" />
                </button>
              </>
            )}
          </div>
          {/* Thumbnail Navigation */}
          {images.length > 1 && (
            <div className="mt-4 flex gap-2 justify-center">
              {images.map((img, index) => (
                <button
                  key={index}
                  onClick={() => selectImage(index)}
                  className={`w-20 h-20 rounded-lg overflow-hidden border-2 transition-colors ${
                    currentImageIndex === index ? 'border-blue-600' : 'border-transparent'
                  }`}
                >
                  <img
                    src={img}
                    alt={`${product.name} - View ${index + 1}`}
                    className="w-full h-full object-cover"
                  />
                </button>
              ))}
            </div>
          )}
        </div>

        {/* Product Info */}
        <div>
          <h1 className="text-3xl font-bold text-gray-900 mb-4">{product.name}</h1>
          
          {/* Rating and Share */}
          <div className="flex items-center gap-4 mb-6">
            <div className="flex items-center">
              {[...Array(5)].map((_, i) => (
                <Star
                  key={i}
                  className={`w-5 h-5 ${
                    i < Math.floor(product.rating)
                      ? 'text-yellow-400 fill-current'
                      : 'text-gray-300'
                  }`}
                />
              ))}
              <span className="ml-2 text-gray-600">{product.rating}</span>
            </div>
            <div className="flex items-center gap-2">
              <Facebook className="w-5 h-5 text-blue-600 cursor-pointer" />
              <Twitter className="w-5 h-5 text-blue-400 cursor-pointer" />
              <Share2 className="w-5 h-5 text-gray-600 cursor-pointer" />
            </div>
          </div>

          {/* Price and Add to Cart */}
          <div className="bg-white rounded-lg shadow-lg p-6 mb-6">
            <div className="flex items-center justify-between mb-4">
              <div>
                <div className="text-3xl font-bold text-blue-600">
                  ₺{product.price.toLocaleString('tr-TR')}
                </div>
                <div className="text-sm text-gray-500">KDV Dahil</div>
              </div>
              <div className={`px-4 py-2 rounded-full ${
                product.stock > 0 ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'
              }`}>
                {product.stock > 0 ? `${product.stock} Adet Stokta` : 'Tükendi'}
              </div>
            </div>

            <button
              onClick={() => addItem(product)}
              disabled={product.stock === 0}
              className="w-full bg-blue-600 text-white py-3 px-6 rounded-lg hover:bg-blue-700 transition-colors flex items-center justify-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              <ShoppingCart className="w-5 h-5" />
              Sepete Ekle
            </button>

            {product.stock <= 5 && product.stock > 0 && (
              <div className="mt-4 flex items-center gap-2 text-orange-600">
                <AlertTriangle className="w-5 h-5" />
                <span>Son {product.stock} ürün!</span>
              </div>
            )}
          </div>

          {/* Features */}
          <div className="grid grid-cols-2 gap-4 mb-6">
            <div className="bg-white rounded-lg shadow p-4 flex items-center gap-3">
              <Truck className="w-8 h-8 text-blue-600" />
              <div>
                <div className="font-medium">Ücretsiz Kargo</div>
                <div className="text-sm text-gray-500">2000₺ üzeri siparişlerde</div>
              </div>
            </div>
            <div className="bg-white rounded-lg shadow p-4 flex items-center gap-3">
              <Shield className="w-8 h-8 text-blue-600" />
              <div>
                <div className="font-medium">2 Yıl Garanti</div>
                <div className="text-sm text-gray-500">Resmi distribütör garantisi</div>
              </div>
            </div>
          </div>

          {/* Quick Specs */}
          <div className="bg-white rounded-lg shadow-lg p-6">
            <h3 className="text-lg font-semibold mb-4">Öne Çıkan Özellikler</h3>
            <div className="space-y-2">
              {product.specs?.map((spec, index) => (
                <div key={index} className="flex items-center gap-2">
                  <Check className="w-5 h-5 text-green-500" />
                  <span>{spec}</span>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>

      {/* Detailed Info Tabs */}
      <div className="mt-12">
        <div className="border-b border-gray-200">
          <nav className="flex space-x-8">
            <button
              onClick={() => setSelectedTab('specs')}
              className={`py-4 px-1 border-b-2 font-medium text-sm ${
                selectedTab === 'specs'
                  ? 'border-blue-500 text-blue-600'
                  : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
              }`}
            >
              Teknik Özellikler
            </button>
            <button
              onClick={() => setSelectedTab('details')}
              className={`py-4 px-1 border-b-2 font-medium text-sm ${
                selectedTab === 'details'
                  ? 'border-blue-500 text-blue-600'
                  : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
              }`}
            >
              Ürün Açıklaması
            </button>
          </nav>
        </div>

        <div className="py-8">
          {selectedTab === 'specs' && (
            <div className="bg-white rounded-lg shadow-lg p-6">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                {/* CPU Details */}
                {product.technical_specs?.cpu && (
                  <div>
                    <h4 className="text-lg font-semibold mb-4">İşlemci Özellikleri</h4>
                    <div className="space-y-2">
                      {renderSpecRow('Model', product.technical_specs.cpu.model)}
                      {renderSpecRow('Çekirdek Sayısı', product.technical_specs.cpu.cores)}
                      {renderSpecRow('Thread Sayısı', product.technical_specs.cpu.threads)}
                      {renderSpecRow('Temel Hız', product.technical_specs.cpu.base_clock)}
                      {renderSpecRow('Boost Hız', product.technical_specs.cpu.boost_clock)}
                      {renderSpecRow('Önbellek', product.technical_specs.cpu.cache)}
                    </div>
                  </div>
                )}

                {/* GPU Details */}
                {product.technical_specs?.gpu && (
                  <div>
                    <h4 className="text-lg font-semibold mb-4">Ekran Kartı Özellikleri</h4>
                    <div className="space-y-2">
                      {renderSpecRow('Model', product.technical_specs.gpu.model)}
                      {renderSpecRow('Bellek', product.technical_specs.gpu.vram)}
                      {renderSpecRow('Bellek Tipi', product.technical_specs.gpu.type)}
                    </div>
                  </div>
                )}

                {/* RAM Details */}
                {product.technical_specs?.ram && (
                  <div>
                    <h4 className="text-lg font-semibold mb-4">RAM Özellikleri</h4>
                    <div className="space-y-2">
                      {renderSpecRow('Kapasite', product.technical_specs.ram.size)}
                      {renderSpecRow('Hız', product.technical_specs.ram.speed)}
                      {renderSpecRow('Tip', product.technical_specs.ram.type)}
                    </div>
                  </div>
                )}

                {/* Storage Details */}
                {product.technical_specs?.storage && (
                  <div>
                    <h4 className="text-lg font-semibold mb-4">Depolama Özellikleri</h4>
                    <div className="space-y-2">
                      {renderSpecRow('Ana Depolama', product.technical_specs.storage.primary)}
                      {renderSpecRow('İkincil Depolama', product.technical_specs.storage.secondary)}
                    </div>
                  </div>
                )}
              </div>
            </div>
          )}

          {selectedTab === 'details' && (
            <div className="bg-white rounded-lg shadow-lg p-6">
              <div className="prose max-w-none">
                <div className="text-gray-600 whitespace-pre-line">
                  {product.description}
                </div>
                
                <div className="mt-8">
                  <h4 className="text-lg font-semibold mb-4">Garanti Koşulları</h4>
                  <div className="bg-gray-50 p-4 rounded-lg">
                    <p className="text-gray-600">
                      Bu ürün 2 yıl resmi distribütör garantisi altındadır. Garanti süresi boyunca oluşabilecek arızalar ücretsiz olarak tamir edilir veya ürün değişimi yapılır.
                    </p>
                  </div>
                </div>

                <div className="mt-8">
                  <h4 className="text-lg font-semibold mb-4">Teslimat Bilgileri</h4>
                  <div className="bg-gray-50 p-4 rounded-lg">
                    <p className="text-gray-600">
                      2000₺ üzeri siparişlerde kargo ücretsizdir. Siparişiniz 1-3 iş günü içerisinde kargoya verilir. Kargo takip numarası SMS ve e-posta yoluyla tarafınıza iletilir.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default ProductDetail;