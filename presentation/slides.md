# PC Sales Website Projesi
## React ve Supabase ile Modern E-Ticaret Çözümü

### 1. Proje Özeti

Bu proje, bilgisayar parçaları satışı yapan modern bir e-ticaret web sitesidir.

**Kullanılan Teknolojiler:**
- Frontend: React + TypeScript
- Veritabanı: Supabase (PostgreSQL)
- Stil: Tailwind CSS
- Durum Yönetimi: Zustand
- Kimlik Doğrulama: Supabase Auth

### 2. Ana Özellikler

#### Kullanıcı Sistemi
- Email/şifre ile kayıt ve giriş
- Profil yönetimi (isim, adres, telefon)
- Sipariş geçmişi görüntüleme

#### Ürün Yönetimi
- Kategorilere göre ürün listeleme
- Detaylı ürün sayfaları
- Stok takibi
- Ürün değerlendirme sistemi

#### Sepet Sistemi
- Ürün ekleme/çıkarma
- Miktar güncelleme
- Toplam fiyat hesaplama
- Oturum boyunca sepet bilgisini saklama

#### Admin Paneli
- Ürün ekleme/düzenleme/silme
- Stok yönetimi
- Sipariş takibi
- Denetim günlükleri

### 3. Veritabanı Yapısı

#### Tablolar:
1. **products** - Ürün bilgileri
   - id (UUID)
   - name (metin)
   - price (sayısal)
   - description (metin)
   - image (URL)
   - specs (dizi)
   - rating (sayısal)
   - stock (tamsayı)
   - category (metin)

2. **profiles** - Kullanıcı profilleri
   - id (UUID)
   - name (metin)
   - phone (metin)
   - address (metin)

3. **orders** - Siparişler
   - id (UUID)
   - user_id (UUID)
   - status (metin)
   - total_amount (sayısal)
   - shipping_address (metin)

4. **reviews** - Ürün değerlendirmeleri
   - id (UUID)
   - product_id (UUID)
   - user_id (UUID)
   - rating (tamsayı)
   - comment (metin)

### 4. Güvenlik Önlemleri

#### Veritabanı Güvenliği
- Row Level Security (RLS) aktif
- Her tablo için özel güvenlik politikaları
- Kullanıcılar sadece kendi verilerine erişebilir
- Admin özel yetkileri

#### Denetim Sistemi
- Tüm ürün değişiklikleri kaydedilir
- Kullanıcı işlemleri takip edilir
- IP adresi ve zaman damgası tutulur

### 5. Ekran Görüntüleri

#### Ana Sayfa
![Ana Sayfa](https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&q=80&w=800)

#### Ürün Listesi
![Ürünler](https://images.unsplash.com/photo-1591405351990-4726e331f141?auto=format&fit=crop&q=80&w=800)

#### Sepet
![Sepet](https://images.unsplash.com/photo-1557821552-17105176677c?auto=format&fit=crop&q=80&w=800)

#### Admin Paneli
![Admin](https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?auto=format&fit=crop&q=80&w=800)

### 6. Sık Sorulan Sorular

1. **Kullanıcı verileri nasıl korunuyor?**
   - JWT token bazlı kimlik doğrulama
   - Şifreler güvenli şekilde hashlenip saklanıyor
   - Row Level Security ile veri izolasyonu
   - Tüm hassas veriler şifreleniyor

2. **Sepet sistemi nasıl çalışıyor?**
   - Zustand ile client-side state management
   - Oturum boyunca veri korunuyor
   - Real-time güncelleme
   - Optimistic UI updates

3. **Stok yönetimi nasıl yapılıyor?**
   - Her sipariş anında stok kontrolü
   - Otomatik stok düşümü
   - Kritik stok uyarıları
   - Admin panelinden manuel kontrol

4. **Ödeme sistemi nasıl çalışıyor?**
   - Güvenli ödeme işlemi
   - Sipariş durumu takibi
   - Otomatik stok güncellemesi
   - Email bildirimleri

### 7. Gelecek Geliştirmeler

1. **Özellikler**
   - Gelişmiş arama sistemi
   - Ürün karşılaştırma
   - Favori listesi
   - Kupon sistemi

2. **Teknik İyileştirmeler**
   - Performance optimizasyonu
   - SEO geliştirmeleri
   - Mobile app desteği
   - Analytics entegrasyonu

### 8. Proje Yönetimi

- Git ile versiyon kontrolü
- Düzenli yedekleme
- Otomatik testler
- CI/CD pipeline

### 9. Özet

Bu proje modern web teknolojilerini kullanarak:
- Güvenli
- Ölçeklenebilir
- Kullanıcı dostu
- Yönetimi kolay

bir e-ticaret çözümü sunmaktadır.