import React from 'react';
import { Link } from 'react-router-dom';
import { 
  Facebook, 
  Twitter, 
  Instagram, 
  Youtube,
  MapPin,
  Phone,
  Mail,
  Clock,
  Truck,
  Shield,
  CreditCard,
  HeadphonesIcon
} from 'lucide-react';

const Footer = () => {
  return (
    <footer className="bg-gray-900 text-gray-300">
      <div className="max-w-7xl mx-auto px-4 py-12">
        {/* Features */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8 pb-12 border-b border-gray-700">
          <div className="flex items-center gap-4">
            <Truck className="w-12 h-12 text-blue-500" />
            <div>
              <h4 className="font-semibold text-white">Ücretsiz Kargo</h4>
              <p className="text-sm">2000₺ üzeri siparişlerde</p>
            </div>
          </div>
          <div className="flex items-center gap-4">
            <Shield className="w-12 h-12 text-blue-500" />
            <div>
              <h4 className="font-semibold text-white">2 Yıl Garanti</h4>
              <p className="text-sm">Tüm ürünlerde geçerli</p>
            </div>
          </div>
          <div className="flex items-center gap-4">
            <CreditCard className="w-12 h-12 text-blue-500" />
            <div>
              <h4 className="font-semibold text-white">Güvenli Ödeme</h4>
              <p className="text-sm">256-bit SSL koruması</p>
            </div>
          </div>
          <div className="flex items-center gap-4">
            <HeadphonesIcon className="w-12 h-12 text-blue-500" />
            <div>
              <h4 className="font-semibold text-white">7/24 Destek</h4>
              <p className="text-sm">Her zaman yanınızdayız</p>
            </div>
          </div>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-4 gap-12 py-12">
          {/* Kurumsal */}
          <div>
            <h3 className="text-lg font-semibold text-white mb-6">Kurumsal</h3>
            <ul className="space-y-4">
              <li>
                <Link to="/about" className="hover:text-white transition-colors">
                  Hakkımızda
                </Link>
              </li>
              <li>
                <Link to="/contact" className="hover:text-white transition-colors">
                  İletişim
                </Link>
              </li>
              <li>
                <Link to="/stores" className="hover:text-white transition-colors">
                  Mağazamız
                </Link>
              </li>
              <li>
                <Link to="/careers" className="hover:text-white transition-colors">
                  Kariyer
                </Link>
              </li>
            </ul>
          </div>

          {/* Müşteri Hizmetleri */}
          <div>
            <h3 className="text-lg font-semibold text-white mb-6">Müşteri Hizmetleri</h3>
            <ul className="space-y-4">
              <li>
                <Link to="/faq" className="hover:text-white transition-colors">
                  Sıkça Sorulan Sorular
                </Link>
              </li>
              <li>
                <Link to="/shipping" className="hover:text-white transition-colors">
                  Kargo ve Teslimat
                </Link>
              </li>
              <li>
                <Link to="/return" className="hover:text-white transition-colors">
                  İade ve Değişim
                </Link>
              </li>
              <li>
                <Link to="/warranty" className="hover:text-white transition-colors">
                  Garanti Şartları
                </Link>
              </li>
            </ul>
          </div>

          {/* İletişim */}
          <div>
            <h3 className="text-lg font-semibold text-white mb-6">İletişim</h3>
            <ul className="space-y-4">
              <li className="flex items-center gap-2">
                <Phone className="w-5 h-5 text-blue-500" />
                <a href="tel:+905468617237" className="hover:text-white transition-colors">
                  +90 546 861 7237
                </a>
              </li>
              <li className="flex items-center gap-2">
                <Mail className="w-5 h-5 text-blue-500" />
                <a href="mailto:baysade00@gmail.com" className="hover:text-white transition-colors">
                  baysade00@gmail.com
                </a>
              </li>
              <li className="flex items-start gap-2">
                <MapPin className="w-5 h-5 text-blue-500" />
                <address className="not-italic">
                  Ayancık Meslek Yüksekokulu<br />
                  Yeni Mahalle, 57400<br />
                  Ayancık/Sinop
                </address>
              </li>
              <li className="flex items-center gap-2">
                <Clock className="w-5 h-5 text-blue-500" />
                <span>09:00 - 18:00 (Hafta içi)</span>
              </li>
            </ul>
          </div>

          {/* Sosyal Medya */}
          <div>
            <h3 className="text-lg font-semibold text-white mb-6">Bizi Takip Edin</h3>
            <div className="flex gap-4">
             
              <a
                href="https://x.com/ilhanyuzer0"
                target="_blank"
                rel="noopener noreferrer"
                className="w-10 h-10 bg-gray-800 rounded-full flex items-center justify-center hover:bg-blue-400 transition-colors"
              >
                <Twitter className="w-5 h-5" />
              </a>
              <a
                href="https://www.instagram.com/baysade.i/"
                target="_blank"
                rel="noopener noreferrer"
                className="w-10 h-10 bg-gray-800 rounded-full flex items-center justify-center hover:bg-pink-600 transition-colors"
              >
                <Instagram className="w-5 h-5" />
              </a>
              <a
                href="https://www.youtube.com/@ilhany%C3%BCzer"
                target="_blank"
                rel="noopener noreferrer"
                className="w-10 h-10 bg-gray-800 rounded-full flex items-center justify-center hover:bg-red-600 transition-colors"
              >
                <Youtube className="w-5 h-5" />
              </a>
            </div>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="pt-8 border-t border-gray-700 text-sm">
          <div className="flex flex-col md:flex-row justify-between items-center gap-4">
            <p>© 2025 PC Store. Tüm hakları saklıdır.</p>
            <div className="flex gap-4">
              <Link to="/privacy" className="hover:text-white transition-colors">
                Gizlilik Politikası
              </Link>
              <Link to="/terms" className="hover:text-white transition-colors">
                Kullanım Şartları
              </Link>
              <Link to="/kvkk" className="hover:text-white transition-colors">
                KVKK
              </Link>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
