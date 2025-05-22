import React from 'react';
import { Award, Users, Laptop, Target, ChevronRight } from 'lucide-react';

const About = () => {
  return (
    <div className="max-w-7xl mx-auto px-4 py-12">
      {/* Hero Section */}
      <div className="text-center mb-16">
        <h1 className="text-4xl font-bold text-gray-900 mb-4">
          Teknoloji Tutkunlarının Adresi
        </h1>
        <p className="text-xl text-gray-600 max-w-3xl mx-auto">
          2025 yılında kurulan PC Store, en son teknoloji ürünlerini müşterilerimizle
          buluşturarak dijital dünyanın kapılarını açıyor.
        </p>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-8 mb-16">
        <div className="bg-white p-6 rounded-xl shadow-lg text-center">
          <div className="text-3xl font-bold text-blue-600 mb-2">1+</div>
          <div className="text-gray-600">Yıllık Deneyim</div>
        </div>
        <div className="bg-white p-6 rounded-xl shadow-lg text-center">
          <div className="text-3xl font-bold text-blue-600 mb-2">1K+</div>
          <div className="text-gray-600">Mutlu Müşteri</div>
        </div>
        <div className="bg-white p-6 rounded-xl shadow-lg text-center">
          <div className="text-3xl font-bold text-blue-600 mb-2">500+</div>
          <div className="text-gray-600">Ürün Çeşidi</div>
        </div>
        <div className="bg-white p-6 rounded-xl shadow-lg text-center">
          <div className="text-3xl font-bold text-blue-600 mb-2">24/7</div>
          <div className="text-gray-600">Teknik Destek</div>
        </div>
      </div>

      {/* Story Section */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-12 items-center mb-16">
        <div>
          <h2 className="text-3xl font-bold text-gray-900 mb-6">
            Hikayemiz
          </h2>
          <p className="text-gray-600 mb-4">
            PC Store, 2025 yılında teknoloji tutkunu İlhan Yüzer tarafından kuruldu.
            Amacımız, kullanıcılarımıza en kaliteli bilgisayar bileşenlerini
            ve teknoloji ürünlerini uygun fiyatlarla sunmak.
          </p>
          <p className="text-gray-600 mb-4">
            Yeni kurulan bir şirket olarak, müşteri memnuniyeti ve kaliteli hizmet 
            anlayışımızla sektörde fark yaratmayı hedefliyoruz. Modern e-ticaret 
            altyapımız ve uzman ekibimizle müşterilerimize en iyi alışveriş 
            deneyimini sunuyoruz.
          </p>
          <p className="text-gray-600">
            Ayancık'taki mağazamız ve güçlü e-ticaret altyapımızla
            müşterilerimize hizmet veriyoruz. Genç ve dinamik ekibimizle teknoloji
            dünyasında yerimizi sağlamlaştırıyoruz.
          </p>
        </div>
        <div className="relative">
          <img
            src="https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?auto=format&fit=crop&q=80&w=1920"
            alt="PC Store Office"
            className="rounded-lg shadow-lg"
          />
          <div className="absolute inset-0 bg-blue-600 opacity-10 rounded-lg"></div>
        </div>
      </div>

      {/* Values */}
      <div className="mb-16">
        <h2 className="text-3xl font-bold text-gray-900 text-center mb-12">
          Değerlerimiz
        </h2>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          <div className="bg-white p-6 rounded-xl shadow-lg">
            <Award className="w-12 h-12 text-blue-600 mb-4" />
            <h3 className="text-xl font-semibold mb-2">Kalite</h3>
            <p className="text-gray-600">
              Sadece en kaliteli ve güvenilir markaların ürünlerini sunuyoruz.
            </p>
          </div>
          <div className="bg-white p-6 rounded-xl shadow-lg">
            <Users className="w-12 h-12 text-blue-600 mb-4" />
            <h3 className="text-xl font-semibold mb-2">Müşteri Odaklılık</h3>
            <p className="text-gray-600">
              Müşterilerimizin ihtiyaçları her zaman önceliğimizdir.
            </p>
          </div>
          <div className="bg-white p-6 rounded-xl shadow-lg">
            <Laptop className="w-12 h-12 text-blue-600 mb-4" />
            <h3 className="text-xl font-semibold mb-2">Teknoloji</h3>
            <p className="text-gray-600">
              En son teknolojileri takip eder ve sunarız.
            </p>
          </div>
          <div className="bg-white p-6 rounded-xl shadow-lg">
            <Target className="w-12 h-12 text-blue-600 mb-4" />
            <h3 className="text-xl font-semibold mb-2">Yenilikçilik</h3>
            <p className="text-gray-600">
              Sürekli gelişim ve yenilik peşindeyiz.
            </p>
          </div>
        </div>
      </div>

      {/* Founder Section */}
      <div className="mb-16">
        <h2 className="text-3xl font-bold text-gray-900 text-center mb-12">
          Kurucumuz
        </h2>
        <div className="max-w-2xl mx-auto">
          <div className="bg-white rounded-xl shadow-lg overflow-hidden">
            <img
              src="/founder.jpg"
              alt="İlhan Yüzer - Kurucu"
              className="w-full h-64 object-cover"
            />
            <div className="p-6">
              <h3 className="text-xl font-semibold mb-1">İlhan Yüzer</h3>
              <p className="text-gray-600 mb-4">Kurucu</p>
              <p className="text-gray-600">
                Teknoloji ve e-ticaret tutkusuyla PC Store'u kurarak, 
                müşterilerimize en iyi alışveriş deneyimini sunmayı hedefliyorum.
              </p>
            </div>
          </div>
        </div>
      </div>

      {/* CTA */}
      <div className="bg-blue-600 rounded-xl p-8 text-center text-white">
        <h2 className="text-3xl font-bold mb-4">
          Ailemize Katılmak İster misiniz?
        </h2>
        <p className="text-xl mb-8">
          Teknoloji tutkunu, dinamik ekibimizin bir parçası olun.
        </p>
        <button className="bg-white text-blue-600 px-8 py-3 rounded-lg font-semibold hover:bg-blue-50 transition-colors inline-flex items-center gap-2">
          Kariyer Fırsatları
          <ChevronRight className="w-5 h-5" />
        </button>
      </div>
    </div>
  );
};

export default About;