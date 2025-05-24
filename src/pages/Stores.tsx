import React from 'react';
import { MapPin, Phone, Clock, ChevronRight } from 'lucide-react';

const stores = [
  {
    id: 1,
    name: 'PC Store Ayancık',
    address: 'Ayancık Meslek Yüksekokulu, Yeni Mahalle, 57400 Ayancık/Sinop',
    phone: '+90 546 861 7237',
    hours: 'Pazartesi - Cumartesi: 10:00 - 20:00',
    image: 'https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&q=80&w=1200',
    maps: 'https://www.google.com/maps/dir/?api=1&origin=My+Location&destination=Ayancık+Meslek+Yüksekokulu,+Yeni+Mahalle,+57400+Ayancık/Sinop'

  }
];

const Stores = () => {
  return (
    <div className="max-w-7xl mx-auto px-4 py-12">
      <div className="text-center mb-12">
        <h1 className="text-4xl font-bold text-gray-900 mb-4">
          Mağazamız
        </h1>
        <p className="text-xl text-gray-600">
          Ayancık'taki mağazamızı ziyaret edin
        </p>
      </div>

      <div className="grid grid-cols-1 gap-8">
        {stores.map((store) => (
          <div
            key={store.id}
            className="bg-white rounded-xl shadow-lg overflow-hidden group"
          >
            <div className="relative h-48">
              <img
                src={store.image}
                alt={store.name}
                className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black/50 to-transparent"></div>
              <h2 className="absolute bottom-4 left-4 text-2xl font-bold text-white">
                {store.name}
              </h2>
            </div>
            
            <div className="p-6 space-y-4">
              <div className="flex items-start gap-3">
                <MapPin className="w-5 h-5 text-blue-600 flex-shrink-0 mt-1" />
                <div>
                  <h3 className="font-medium text-gray-900">Adres</h3>
                  <p className="text-gray-600">{store.address}</p>
                </div>
              </div>

              <div className="flex items-start gap-3">
                <Phone className="w-5 h-5 text-blue-600 flex-shrink-0 mt-1" />
                <div>
                  <h3 className="font-medium text-gray-900">Telefon</h3>
                  <a
                    href={`tel:${store.phone}`}
                    className="text-gray-600 hover:text-blue-600"
                  >
                    {store.phone}
                  </a>
                </div>
              </div>

              <div className="flex items-start gap-3">
                <Clock className="w-5 h-5 text-blue-600 flex-shrink-0 mt-1" />
                <div>
                  <h3 className="font-medium text-gray-900">Çalışma Saatleri</h3>
                  <p className="text-gray-600">{store.hours}</p>
                </div>
              </div>

              <a
                href={store.maps}
                target="_blank"
                rel="noopener noreferrer"
                className="mt-6 inline-flex items-center gap-2 text-blue-600 hover:text-blue-700 group"
              >
                <span>Yol Tarifi Al</span>
                <ChevronRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
              </a>
            </div>
          </div>
        ))}
      </div>

      {/* Store Features */}
      <div className="mt-16 grid grid-cols-1 md:grid-cols-3 gap-8">
        <div className="bg-white p-6 rounded-xl shadow-lg text-center">
          <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <Clock className="w-8 h-8 text-blue-600" />
          </div>
          <h3 className="text-xl font-semibold mb-2">Uzun Çalışma Saatleri</h3>
          <p className="text-gray-600">
            Haftanın her günü sizlere hizmet vermek için buradayız.
          </p>
        </div>

        <div className="bg-white p-6 rounded-xl shadow-lg text-center">
          <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <MapPin className="w-8 h-8 text-blue-600" />
          </div>
          <h3 className="text-xl font-semibold mb-2">Merkezi Konum</h3>
          <p className="text-gray-600">
            Ayancık Meslek Yüksekokulu içerisinde, ulaşımı kolay lokasyon.
          </p>
        </div>

        <div className="bg-white p-6 rounded-xl shadow-lg text-center">
          <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <Phone className="w-8 h-8 text-blue-600" />
          </div>
          <h3 className="text-xl font-semibold mb-2">Teknik Destek</h3>
          <p className="text-gray-600">
            Uzman ekibimiz mağazamızda hizmetinizde.
          </p>
        </div>
      </div>

      {/* Map */}
      <div className="mt-12">
        <h2 className="text-2xl font-semibold mb-6">Mağaza Konumu</h2>
        <div className="bg-white rounded-xl shadow-lg overflow-hidden h-[400px]">
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2967.8910563459893!2d34.58216611744385!3d41.94861110000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x409d2b8f8e000001%3A0x8e00f5cbc5e6a7a0!2zU2lub3Agw5xuaXZlcnNpdGVzaSBBeWFuY8SxayBNZXNsZWsgWcO8a3Nla29rdWx1!5e0!3m2!1str!2str!4v1683900000000!5m2!1str!2str"
            width="100%"
            height="100%"
            style={{ border: 0 }}
            allowFullScreen
            loading="lazy"
            referrerPolicy="no-referrer-when-downgrade"
          />
        </div>
      </div>
    </div>
  );
};

export default Stores;
