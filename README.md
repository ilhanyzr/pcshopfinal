# PC Store

Modern e-ticaret çözümü sunan, bilgisayar ve donanım satışı yapan web sitesi projesi.

## 🚀 Yapılan Geliştirmeler

### 1. Veritabanı Yapılandırması
- Supabase veritabanı kurulumu
- Detaylı tablo yapıları oluşturuldu:
  - `products`: Ürün bilgileri
  - `orders`: Sipariş yönetimi
  - `reviews`: Ürün değerlendirmeleri
  - `profiles`: Kullanıcı profilleri
  - `audit_logs`: Sistem günlükleri
- Row Level Security (RLS) politikaları
- Detaylı ürün filtreleme sistemi

### 2. Ürün Yönetimi
- Kategorilere göre ürün listeleme
  - Hazır Sistemler (Gaming PC, İş İstasyonu)
  - Laptoplar (Gaming, Ultrabook)
  - Bileşenler (CPU, GPU, Anakart)
  - Monitörler
  - Çevre Birimleri
- Detaylı ürün filtreleme
  - Marka, fiyat aralığı
  - Kategori özel filtreler (CPU çekirdek sayısı, GPU bellek tipi vb.)
- Gelişmiş arama sistemi
- Stok takibi
- Ürün değerlendirme sistemi

### 3. Kullanıcı Arayüzü
- Modern ve kullanıcı dostu tasarım
- Responsive layout
- Gelişmiş ürün görüntüleme
- Çoklu resim desteği
- Detaylı ürün özellikleri
- Filtreleme ve sıralama özellikleri

### 4. Sepet Sistemi
- Ürün ekleme/çıkarma
- Miktar güncelleme
- Toplam fiyat hesaplama
- Oturum boyunca sepet bilgisini saklama

### 5. Admin Paneli
- Ürün yönetimi (ekleme, düzenleme, silme)
- Stok kontrolü
- Sipariş takibi
- Denetim günlükleri
- İstatistikler ve raporlar

### 6. Ödeme Sistemi
- Havale/EFT ile ödeme
- Sipariş takibi
- Otomatik stok güncellemesi
- Email bildirimleri

### 7. Güvenlik
- JWT tabanlı kimlik doğrulama
- Row Level Security (RLS)
- Audit logging
- Input validation
- XSS koruması

## 🛠️ Teknoloji Stack

### Frontend
- React + TypeScript
- Vite
- Tailwind CSS
- Zustand (State Management)
- Lucide React (Icons)
- React Router

### Backend
- Supabase (Backend as a Service)
- PostgreSQL Veritabanı
- Row Level Security (RLS)
- Edge Functions

### Güvenlik
- JWT Authentication
- Row Level Security (RLS)
- Audit Logging
- Input Validation

## 📦 Veritabanı Yapısı

### Tablolar

1. **products**
   - Ürün bilgileri
   - Stok durumu
   - Fiyatlandırma
   - Kategori bilgisi
   - Teknik özellikler
   - Marka bilgisi

2. **profiles**
   - Kullanıcı profilleri
   - İletişim bilgileri
   - Adres bilgileri

3. **orders**
   - Sipariş bilgileri
   - Ödeme durumu
   - Kargo bilgileri
   - Sipariş detayları

4. **reviews**
   - Ürün değerlendirmeleri
   - Puanlamalar
   - Kullanıcı yorumları

5. **audit_logs**
   - Sistem günlükleri
   - Değişiklik takibi
   - Güvenlik kayıtları

## 🚀 Kurulum

1. Projeyi klonlayın:
```bash
git clone https://github.com/ilhanyzr/pcshopfinal
```

2. Bağımlılıkları yükleyin:
```bash
npm install
```

3. `.env.example` dosyasını `.env` olarak kopyalayın

4. `.env` dosyasını Supabase bilgilerinizle güncelleyin:
```env
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

5. Geliştirme sunucusunu başlatın:
```bash
npm run dev
```

## 🔒 Güvenlik Önlemleri

- `.env` dosyası asla GitHub'a push edilmemelidir
- Tüm hassas bilgiler `.env` dosyasında saklanmalıdır
- Row Level Security (RLS) tüm tablolarda aktiftir
- Audit logging sistemi mevcuttur
- Rate limiting uygulanmıştır
- Input validation kontrolleri mevcuttur

## 👨‍💼 Admin Erişimi

Admin paneline erişim sadece admin@example.com hesabı ile mümkündür.

## 🔜 Gelecek Özellikler

### Özellikler
- Gelişmiş arama sistemi
- Ürün karşılaştırma
- Favori listesi
- Kupon sistemi
- Çoklu dil desteği
- Bildirim sistemi

### Teknik İyileştirmeler
- Performance optimizasyonu
- SEO geliştirmeleri
- Mobile app desteği
- Analytics entegrasyonu
- Ödeme sistemi entegrasyonu
- Kargo takip sistemi

## 📝 Proje Yönetimi

- Git ile versiyon kontrolü
- Düzenli yedekleme
- Otomatik testler
- CI/CD pipeline

## 🤝 Katkıda Bulunma

1. Fork'layın
2. Feature branch oluşturun
3. Değişikliklerinizi commit edin
4. Branch'inizi push edin
5. Pull request açın

## 📄 Lisans

Bu proje MIT lisansı altında lisanslanmıştır.
