import React, { useState, useEffect, useRef } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { 
  ShoppingCart, 
  User, 
  Laptop, 
  LogOut, 
  Settings, 
  Search, 
  X, 
  MessageCircle,
  Store,
  Phone,
  Info,
  Home
} from 'lucide-react';
import { useCartStore } from '../store/cartStore';
import { supabase } from '../lib/supabase';

interface SearchResult {
  id: string;
  name: string;
  price: number;
  category: string;
  image: string;
}

const Navbar = () => {
  const cartItems = useCartStore((state) => state.items);
  const navigate = useNavigate();
  const [user, setUser] = useState<any>(null);
  const [isAdmin, setIsAdmin] = useState(false);
  const [searchTerm, setSearchTerm] = useState('');
  const [searchResults, setSearchResults] = useState<SearchResult[]>([]);
  const [isSearching, setIsSearching] = useState(false);
  const searchRef = useRef<HTMLDivElement>(null);

  const contactInfo = {
    whatsapp: '+905468617237'
  };

  const openWhatsApp = () => {
    window.open(`https://wa.me/${contactInfo.whatsapp}`, '_blank');
  };

  useEffect(() => {
    // Check current auth status
    supabase.auth.getUser().then(({ data: { user } }) => {
      setUser(user);
      setIsAdmin(user?.email === 'admin@example.com');
    });

    // Listen for auth changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null);
      setIsAdmin(session?.user?.email === 'admin@example.com');
    });

    // Add click outside listener
    const handleClickOutside = (event: MouseEvent) => {
      if (searchRef.current && !searchRef.current.contains(event.target as Node)) {
        setIsSearching(false);
      }
    };

    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      subscription.unsubscribe();
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  useEffect(() => {
    const searchProducts = async () => {
      if (searchTerm.length < 2) {
        setSearchResults([]);
        return;
      }

      const { data, error } = await supabase
        .from('products')
        .select('id, name, price, category, image')
        .ilike('name', `%${searchTerm}%`)
        .limit(5);

      if (!error && data) {
        setSearchResults(data);
      }
    };

    const debounce = setTimeout(searchProducts, 300);
    return () => clearTimeout(debounce);
  }, [searchTerm]);

  const handleLogout = async () => {
    await supabase.auth.signOut();
    navigate('/');
  };

  const handleSearchSelect = (id: string) => {
    setSearchTerm('');
    setIsSearching(false);
    navigate(`/product/${id}`);
  };

  return (
    <nav className="bg-white shadow-lg">
      <div className="container mx-auto px-4">
        <div className="flex justify-between items-center h-16">
          <div className="flex items-center space-x-8">
            <Link to="/" className="flex items-center space-x-2">
              <Laptop className="h-8 w-8 text-blue-600" />
              <span className="text-xl font-bold">PC Store</span>
            </Link>

            <div className="relative" ref={searchRef}>
              <div className="relative">
                <input
                  type="text"
                  placeholder="Ürün ara..."
                  value={searchTerm}
                  onChange={(e) => {
                    setSearchTerm(e.target.value);
                    setIsSearching(true);
                  }}
                  onFocus={() => setIsSearching(true)}
                  className="pl-10 pr-4 py-2 w-64 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
                <Search className="absolute left-3 top-2.5 text-gray-400 w-5 h-5" />
                {searchTerm && (
                  <button
                    onClick={() => {
                      setSearchTerm('');
                      setSearchResults([]);
                    }}
                    className="absolute right-3 top-2.5 text-gray-400 hover:text-gray-600"
                  >
                    <X className="w-5 h-5" />
                  </button>
                )}
              </div>

              {isSearching && searchResults.length > 0 && (
                <div className="absolute top-full left-0 right-0 mt-1 bg-white rounded-lg shadow-lg border z-50">
                  {searchResults.map((result) => (
                    <button
                      key={result.id}
                      onClick={() => handleSearchSelect(result.id)}
                      className="w-full px-4 py-2 hover:bg-gray-50 flex items-center space-x-3 text-left"
                    >
                      <img
                        src={result.image}
                        alt={result.name}
                        className="w-10 h-10 object-cover rounded"
                      />
                      <div>
                        <div className="font-medium">{result.name}</div>
                        <div className="text-sm text-gray-500">
                          ₺{result.price.toLocaleString('tr-TR')}
                        </div>
                      </div>
                    </button>
                  ))}
                </div>
              )}

              {isSearching && searchTerm.length >= 2 && searchResults.length === 0 && (
                <div className="absolute top-full left-0 right-0 mt-1 bg-white rounded-lg shadow-lg border p-4 text-center text-gray-500 z-50">
                  Ürün bulunamadı
                </div>
              )}
            </div>
          </div>
          
          <div className="flex items-center space-x-6">
            <Link to="/" className="hover:text-blue-600 flex items-center gap-2">
              <Home className="w-5 h-5" />
              <span>Ana Sayfa</span>
            </Link>

            <Link to="/products" className="hover:text-blue-600 flex items-center gap-2">
              <Laptop className="w-5 h-5" />
              <span>Ürünler</span>
            </Link>

            <Link to="/stores" className="hover:text-blue-600 flex items-center gap-2">
              <Store className="w-5 h-5" />
              <span>Mağazalar</span>
            </Link>

            <Link to="/about" className="hover:text-blue-600 flex items-center gap-2">
              <Info className="w-5 h-5" />
              <span>Hakkımızda</span>
            </Link>

            <Link to="/contact" className="hover:text-blue-600 flex items-center gap-2">
              <Phone className="w-5 h-5" />
              <span>İletişim</span>
            </Link>

            <button
              onClick={openWhatsApp}
              className="text-green-600 hover:text-green-700 flex items-center gap-2"
            >
              <MessageCircle className="w-5 h-5" />
              <span>WhatsApp</span>
            </button>

            <Link to="/cart" className="relative hover:text-blue-600">
              <ShoppingCart className="h-6 w-6" />
              {cartItems.length > 0 && (
                <span className="absolute -top-2 -right-2 bg-red-500 text-white rounded-full w-5 h-5 flex items-center justify-center text-xs">
                  {cartItems.length}
                </span>
              )}
            </Link>
            
            {user ? (
              <div className="flex items-center space-x-4">
                {isAdmin && (
                  <Link 
                    to="/admin" 
                    className="flex items-center space-x-1 text-gray-600 hover:text-blue-600"
                  >
                    <Settings className="h-5 w-5" />
                    <span>Admin Panel</span>
                  </Link>
                )}
                <Link to="/profile" className="hover:text-blue-600">
                  <User className="h-6 w-6" />
                </Link>
                <button
                  onClick={handleLogout}
                  className="flex items-center space-x-1 text-gray-600 hover:text-blue-600"
                >
                  <LogOut className="h-5 w-5" />
                  <span>Çıkış</span>
                </button>
              </div>
            ) : (
              <div className="flex items-center space-x-4">
                <Link
                  to="/login"
                  className="text-gray-600 hover:text-blue-600"
                >
                  Giriş
                </Link>
                <Link
                  to="/register"
                  className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors"
                >
                  Kayıt Ol
                </Link>
              </div>
            )}
          </div>
        </div>
      </div>
    </nav>
  );
};

export default Navbar;