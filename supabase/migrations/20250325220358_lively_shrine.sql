/*
  # Add sample products for each category

  1. Changes
    - Insert sample products for all categories
    - Include detailed specifications and descriptions
    - Set initial stock and ratings

  2. Categories covered:
    - Hazır Sistemler (Prebuilt PCs)
    - Laptoplar
    - Gaming Ekipmanları
    - Yayıncı Ekipmanları
    - Monitörler
    - İşlemciler
    - Depolama
    - Ekran Kartları
*/

-- Hazır Sistemler
INSERT INTO products (name, price, description, image, specs, rating, stock, category) VALUES
(
  'Pro Gaming PC RTX 4080',
  45999.99,
  'Ultra performans gaming sistemi, en zorlu oyunları bile akıcı çalıştırır',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13900K',
    'NVIDIA RTX 4080 16GB',
    '32GB DDR5 RAM',
    '2TB NVMe SSD',
    '850W Gold PSU'
  ],
  4.8,
  10,
  'gaming-pc'
),
(
  'İş İstasyonu Workstation',
  38999.99,
  'Profesyonel iş istasyonu, render ve tasarım işleri için optimize edilmiş',
  'https://images.unsplash.com/photo-1547082299-de196ea013d6?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Ryzen 9 7950X',
    'NVIDIA RTX A4000',
    '64GB ECC RAM',
    '4TB NVMe SSD',
    '1000W Platinum PSU'
  ],
  4.9,
  5,
  'workstation'
);

-- Laptoplar
INSERT INTO products (name, price, description, image, specs, rating, stock, category) VALUES
(
  'Gaming Laptop Pro',
  39999.99,
  'Taşınabilir gaming performansı, RTX 4070 ekran kartı ile maksimum FPS',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '17.3" 240Hz QHD Ekran',
    'Intel Core i7-13700H',
    'RTX 4070 8GB',
    '32GB DDR5',
    '1TB NVMe SSD'
  ],
  4.7,
  15,
  'gaming-laptop'
),
(
  'Ultrabook Elite',
  29999.99,
  'Ultra ince ve hafif, tüm gün pil ömrü',
  'https://images.unsplash.com/photo-1593642634367-d91a135587b5?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '14" 2.8K OLED Ekran',
    'Intel Core i7-1360P',
    'Intel Iris Xe Graphics',
    '16GB LPDDR5',
    '512GB NVMe SSD'
  ],
  4.6,
  20,
  'ultrabook'
);

-- Gaming Ekipmanları
INSERT INTO products (name, price, description, image, specs, rating, stock, category) VALUES
(
  'Pro Gaming Mouse',
  1299.99,
  'Profesyonel oyuncular için tasarlandı, 26000 DPI sensör',
  'https://images.unsplash.com/photo-1527814050087-3793815479db?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '26000 DPI Optik Sensör',
    '1000Hz Polling Rate',
    '8 Programlanabilir Tuş',
    'RGB Aydınlatma',
    '82g Ağırlık'
  ],
  4.8,
  50,
  'gaming-mouse'
),
(
  'Mekanik Gaming Klavye',
  2499.99,
  'RGB aydınlatmalı mekanik gaming klavye',
  'https://images.unsplash.com/photo-1595225476474-87563907a212?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Cherry MX Red Switch',
    'Per-Key RGB',
    'Alüminyum Gövde',
    'USB Pass-through',
    'Tam Boyut'
  ],
  4.7,
  30,
  'gaming-keyboard'
);

-- Yayıncı Ekipmanları
INSERT INTO products (name, price, description, image, specs, rating, stock, category) VALUES
(
  'Profesyonel Yayıncı Mikrofonu',
  3999.99,
  'Stüdyo kalitesinde ses kaydı için profesyonel mikrofon',
  'https://images.unsplash.com/photo-1590602847861-f357a9332bbc?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Kardiyoid Polar Pattern',
    '24-bit/96kHz',
    'Sıfır Latency Monitoring',
    'USB-C Bağlantı',
    'Masa Standı Dahil'
  ],
  4.9,
  25,
  'microphone'
),
(
  'Stream Deck XL',
  4499.99,
  'Yayıncılar için 32 tuşlu kontrol paneli',
  'https://images.unsplash.com/photo-1561883088-039e53143d73?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '32 LCD Tuş',
    'Özelleştirilebilir Profiller',
    'Canlı Önizleme',
    'Multi-Action',
    'Yazılım Dahil'
  ],
  4.8,
  15,
  'stream-deck'
);

-- Monitörler
INSERT INTO products (name, price, description, image, specs, rating, stock, category) VALUES
(
  'Gaming Monitor 360Hz',
  12999.99,
  'Ultra hızlı gaming monitör, 360Hz yenileme hızı',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '24.5" FHD IPS',
    '360Hz Yenileme Hızı',
    '1ms GTG',
    'G-SYNC',
    'HDR400'
  ],
  4.7,
  20,
  'monitor'
),
(
  '4K HDR Profesyonel Monitör',
  14999.99,
  'Profesyonel içerik üreticileri için 4K HDR monitör',
  'https://images.unsplash.com/photo-1527443195645-1133f7f28990?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '27" 4K IPS',
    'HDR1000',
    '99% Adobe RGB',
    'USB-C Hub',
    'KVM Switch'
  ],
  4.9,
  10,
  'monitor'
);

-- İşlemciler
INSERT INTO products (name, price, description, image, specs, rating, stock, category) VALUES
(
  'Intel Core i9-13900K',
  12999.99,
  '13. Nesil Intel Core i9 işlemci, maksimum performans',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '24 Çekirdek (8P+16E)',
    '5.8GHz Turbo',
    '36MB Cache',
    'PCIe 5.0',
    'DDR5'
  ],
  4.9,
  25,
  'cpu'
),
(
  'AMD Ryzen 9 7950X',
  11999.99,
  'AMD''nin en güçlü masaüstü işlemcisi',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '16 Çekirdek',
    '5.7GHz Boost',
    '64MB Cache',
    'PCIe 5.0',
    'AM5 Soket'
  ],
  4.8,
  30,
  'cpu'
);

-- Depolama
INSERT INTO products (name, price, description, image, specs, rating, stock, category) VALUES
(
  'NVMe SSD 2TB',
  3999.99,
  'Ultra hızlı PCIe 4.0 NVMe SSD',
  'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '7000MB/s Okuma',
    '6500MB/s Yazma',
    'PCIe 4.0 x4',
    '2TB Kapasite',
    'TLC NAND'
  ],
  4.8,
  40,
  'storage'
),
(
  'Gaming SSD 1TB',
  1999.99,
  'Oyuncular için optimize edilmiş SATA SSD',
  'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '560MB/s Okuma',
    '530MB/s Yazma',
    'SATA III',
    '1TB Kapasite',
    'QLC NAND'
  ],
  4.6,
  60,
  'storage'
);

-- Ekran Kartları
INSERT INTO products (name, price, description, image, specs, rating, stock, category) VALUES
(
  'RTX 4090 Gaming OC',
  49999.99,
  'En güçlü gaming ekran kartı',
  'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '24GB GDDR6X',
    '2625MHz Boost',
    'DLSS 3.0',
    'Ray Tracing',
    '450W TDP'
  ],
  4.9,
  5,
  'gpu'
),
(
  'RTX 4070 Ti',
  29999.99,
  'Yüksek performanslı gaming ekran kartı',
  'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '12GB GDDR6X',
    '2610MHz Boost',
    'DLSS 3.0',
    'Ray Tracing',
    '285W TDP'
  ],
  4.8,
  15,
  'gpu'
);