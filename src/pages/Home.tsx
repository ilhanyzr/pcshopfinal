import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { 
  Monitor, 
  Cpu, 
  HardDrive, 
  CpuIcon as Gpu, 
  Package, 
  Laptop, 
  Gamepad, 
  Mic, 
  X, 
  Star,
  ChevronRight,
  ShoppingCart,
  TrendingUp,
  Clock,
  Shield,
  Truck,
  DollarSign
} from 'lucide-react';

const Home = () => {
  const navigate = useNavigate();
  const [currentSlide, setCurrentSlide] = useState(0);
  const [selectedCategory, setSelectedCategory] = useState<string | null>(null);

  const slogans = [
    {
      text: "Gücünüzü Maksimuma Çıkarın",
      subtext: "En son teknoloji parçalarla sisteminizi yükseltin",
      image: "https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920",
      cta: "Hemen Keşfet"
    },
    {
      text: "Oyuncu Ruhu, Profesyonel Performans",
      subtext: "Premium gaming ekipmanlarıyla rekabette bir adım önde olun",
      image: "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920",
      cta: "Gaming Ürünleri"
    },
    {
      text: "İş İstasyonunuzu Dönüştürün",
      subtext: "Verimlilik odaklı donanım çözümleri",
      image: "https://images.unsplash.com/photo-1547082299-de196ea013d6?auto=format&fit=crop&q=80&w=1920",
      cta: "Workstation Çözümleri"
    }
  ];

  useEffect(() => {
    const timer = setInterval(() => {
      setCurrentSlide((prev) => (prev + 1) % slogans.length);
    }, 5000);
    return () => clearInterval(timer);
  }, []);

  const handleCategoryClick = (category: string) => {
    navigate(`/products?category=${category}`);
  };

  const features = [
    { icon: Truck, title: "Ücretsiz Kargo", text: "2000₺ üzeri siparişlerde" },
    { icon: Shield, title: "2 Yıl Garanti", text: "Tüm ürünlerde geçerli" },
    { icon: DollarSign, title: "Taksit İmkanı", text: "12 aya varan taksit seçenekleri" },
    { icon: Clock, title: "7/24 Destek", text: "Teknik destek ve satış sonrası" }
  ];

  const trendingProducts = [
    {
      id: 1,
      name: "RTX 4090 Gaming PC",
      image: "https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=800",
      price: 89999.99,
      rating: 4.9,
      category: "gaming-pc"
    },
    {
      id: 2,
      name: "ROG Strix Gaming Laptop",
      image: "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=800",
      price: 54999.99,
      rating: 4.8,
      category: "gaming-laptop"
    },
    {
      id: 3,
      name: "Pro Workstation",
      image: "https://images.unsplash.com/photo-1547082299-de196ea013d6?auto=format&fit=crop&q=80&w=800",
      price: 129999.99,
      rating: 4.9,
      category: "workstation"
    }
  ];

  const mainCategories = [
    {
      title: "Hazır Sistemler",
      description: "Profesyonel olarak hazırlanmış bilgisayar sistemleri",
      icon: Package,
      category: "prebuilt",
      image: "https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=800",
      subcategories: [
        { name: "Gaming PC", category: "gaming-pc" },
        { name: "İş İstasyonları", category: "workstation" },
        { name: "Ev/Ofis Sistemleri", category: "home-office" }
      ]
    },
    {
      title: "Laptoplar",
      description: "Her ihtiyaca uygun notebook modelleri",
      icon: Laptop,
      category: "laptop",
      image: "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=800",
      subcategories: [
        { name: "Gaming Laptop", category: "gaming-laptop" },
        { name: "Ultrabook", category: "ultrabook" },
        { name: "İş Laptopları", category: "business-laptop" }
      ]
    },
    {
      title: "Bileşenler",
      description: "Yüksek performanslı donanım parçaları",
      icon: Cpu,
      category: "components",
      image: "https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=800",
      subcategories: [
        { name: "İşlemciler", category: "cpu" },
        { name: "Ekran Kartları", category: "gpu" },
        { name: "Anakartlar", category: "motherboard" }
      ]
    },
    {
      title: "Monitörler",
      description: "Gaming ve profesyonel monitörler",
      icon: Monitor,
      category: "monitors",
      image: "https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=800",
      subcategories: [
        { name: "Gaming Monitör", category: "gaming-monitor" },
        { name: "4K Monitör", category: "4k-monitor" },
        { name: "Ultrawide", category: "ultrawide" }
      ]
    }
  ];

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero Carousel */}
      <div className="relative h-[600px] overflow-hidden">
        {slogans.map((slogan, index) => (
          <div
            key={index}
            className={`absolute inset-0 transition-opacity duration-1000 ${
              index === currentSlide ? 'opacity-100' : 'opacity-0'
            }`}
          >
            <div className="absolute inset-0 bg-gradient-to-r from-black/70 to-black/30" />
            <img
              src={slogan.image}
              alt={slogan.text}
              className="w-full h-full object-cover"
            />
            <div className="absolute inset-0 flex flex-col justify-center px-8 sm:px-16 max-w-7xl mx-auto">
              <h1 className="text-4xl sm:text-6xl font-bold text-white mb-4 animate-fade-in">
                {slogan.text}
              </h1>
              <p className="text-xl sm:text-2xl text-gray-200 mb-8">
                {slogan.subtext}
              </p>
              <button
                onClick={() => navigate('/products')}
                className="bg-blue-600 text-white px-8 py-3 rounded-lg hover:bg-blue-700 transition-colors w-fit flex items-center gap-2 group"
              >
                {slogan.cta}
                <ChevronRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
              </button>
            </div>
          </div>
        ))}
        
        {/* Carousel Indicators */}
        <div className="absolute bottom-8 left-1/2 transform -translate-x-1/2 flex space-x-3">
          {slogans.map((_, index) => (
            <button
              key={index}
              onClick={() => setCurrentSlide(index)}
              className={`w-3 h-3 rounded-full transition-colors ${
                index === currentSlide ? 'bg-blue-600' : 'bg-white/50 hover:bg-white/75'
              }`}
            />
          ))}
        </div>
      </div>

      {/* Features */}
      <div className="max-w-7xl mx-auto px-4 py-12">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          {features.map((feature, index) => (
            <div key={index} className="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-shadow">
              <div className="flex items-center gap-4">
                <div className="p-3 bg-blue-100 rounded-lg">
                  <feature.icon className="w-6 h-6 text-blue-600" />
                </div>
                <div>
                  <h3 className="font-semibold text-gray-900">{feature.title}</h3>
                  <p className="text-sm text-gray-600">{feature.text}</p>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Trending Products */}
      <div className="max-w-7xl mx-auto px-4 py-12">
        <div className="flex items-center justify-between mb-8">
          <div>
            <h2 className="text-3xl font-bold text-gray-900">Öne Çıkan Ürünler</h2>
            <p className="text-gray-600 mt-2">En çok tercih edilen ürünlerimiz</p>
          </div>
          <button
            onClick={() => navigate('/products')}
            className="text-blue-600 hover:text-blue-700 flex items-center gap-1 group"
          >
            Tümünü Gör
            <ChevronRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
          </button>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {trendingProducts.map((product) => (
            <div
              key={product.id}
              className="bg-white rounded-xl shadow-lg overflow-hidden hover:shadow-xl transition-shadow cursor-pointer group"
              onClick={() => navigate(`/products?category=${product.category}`)}
            >
              <div className="relative">
                <img
                  src={product.image}
                  alt={product.name}
                  className="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-300"
                  loading="lazy"
                />
                <div className="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-20 transition-opacity duration-300" />
              </div>
              <div className="p-6">
                <h3 className="text-xl font-semibold text-gray-900 mb-2">{product.name}</h3>
                <div className="flex items-center justify-between">
                  <span className="text-2xl font-bold text-blue-600">
                    ₺{product.price.toLocaleString('tr-TR')}
                  </span>
                  <div className="flex items-center gap-1">
                    <Star className="w-5 h-5 text-yellow-400 fill-current" />
                    <span className="font-medium">{product.rating}</span>
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Main Categories */}
      <div className="max-w-7xl mx-auto px-4 py-12">
        <h2 className="text-3xl font-bold text-gray-900 mb-8">Kategoriler</h2>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          {mainCategories.map((category, index) => (
            <div
              key={index}
              className="relative group cursor-pointer"
              onClick={() => handleCategoryClick(category.category)}
            >
              <div className="relative h-96 rounded-xl overflow-hidden">
                <img
                  src={category.image}
                  alt={category.title}
                  className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                  loading="lazy"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/50 to-transparent" />
                <div className="absolute bottom-0 left-0 right-0 p-6">
                  <div className="flex items-center gap-3 mb-3">
                    <category.icon className="w-8 h-8 text-blue-400" />
                    <h3 className="text-2xl font-bold text-white">{category.title}</h3>
                  </div>
                  <p className="text-gray-300 mb-4">{category.description}</p>
                  <div className="space-y-2">
                    {category.subcategories.map((sub, idx) => (
                      <div
                        key={idx}
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
      </div>

      {/* CTA Section */}
      <div className="bg-blue-600 py-16 mt-12">
        <div className="max-w-7xl mx-auto px-4 text-center">
          <h2 className="text-3xl sm:text-4xl font-bold text-white mb-4">
            Hayalinizdeki Sistemi Birlikte Oluşturalım
          </h2>
          <p className="text-xl text-blue-100 mb-8">
            Uzman ekibimiz size özel çözümler için hazır
          </p>
          <button
            onClick={() => navigate('/products')}
            className="bg-white text-blue-600 px-8 py-3 rounded-lg hover:bg-blue-50 transition-colors text-lg font-medium"
          >
            Hemen Başla
          </button>
        </div>
      </div>
    </div>
  );
};

export default Home;