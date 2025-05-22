/*
  # Add segmented products for each category

  1. Changes
    - Add gaming PCs for different segments (high, mid, entry)
    - Add workstations for different use cases
    - Add laptops for different segments
    - Include detailed specifications and pricing
*/

-- Gaming PCs - High End
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'MSI Infinite X Elite',
  119999.99,
  'Ultra premium gaming sistemi, 4K çözünürlükte maksimum FPS',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13900KS',
    'NVIDIA RTX 4090 24GB',
    '64GB DDR5 6400MHz',
    '4TB NVMe Gen4 RAID',
    '1300W 80+ Platinum',
    'MSI MEG PROSPECT 700R'
  ],
  4.9,
  3,
  'gaming-pc-high',
  'MSI',
  '{"cpu": "Intel Core i9-13900KS", "gpu": "RTX 4090", "ram": "64GB DDR5", "storage": "4TB NVMe RAID", "motherboard": "MSI MEG Z790 ACE", "cooling": "360mm AIO"}'
),
(
  'ASUS ROG Strix GT90',
  109999.99,
  'En üst segment gaming PC, özel soğutma sistemi',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13900K',
    'ROG STRIX RTX 4090 OC',
    '64GB DDR5 6000MHz',
    '2TB NVMe + 4TB SSD',
    '1200W 80+ Titanium',
    'ROG Helios II'
  ],
  4.8,
  5,
  'gaming-pc-high',
  'ASUS ROG',
  '{"cpu": "Intel Core i9-13900K", "gpu": "ROG STRIX RTX 4090", "ram": "64GB DDR5", "storage": "6TB Total", "motherboard": "ROG MAXIMUS Z790 HERO", "cooling": "Custom Loop"}'
);

-- Gaming PCs - Mid Range
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'MSI Vector GL66',
  59999.99,
  'Orta-üst segment gaming sistemi, 1440p oyun deneyimi',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i7-13700K',
    'NVIDIA RTX 4070 Ti 12GB',
    '32GB DDR5 5600MHz',
    '2TB NVMe Gen4',
    '850W 80+ Gold',
    'MSI MPG GUNGNIR 110R'
  ],
  4.7,
  12,
  'gaming-pc-mid',
  'MSI',
  '{"cpu": "Intel Core i7-13700K", "gpu": "RTX 4070 Ti", "ram": "32GB DDR5", "storage": "2TB NVMe", "motherboard": "MSI MPG Z790", "cooling": "240mm AIO"}'
),
(
  'ASUS TUF Gaming A5',
  49999.99,
  'Performans odaklı orta segment sistem',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Ryzen 7 7800X3D',
    'TUF RTX 4070 12GB',
    '32GB DDR5 5200MHz',
    '1TB NVMe + 2TB SSD',
    '750W 80+ Gold',
    'TUF GT301'
  ],
  4.6,
  15,
  'gaming-pc-mid',
  'ASUS',
  '{"cpu": "Ryzen 7 7800X3D", "gpu": "TUF RTX 4070", "ram": "32GB DDR5", "storage": "3TB Total", "motherboard": "TUF GAMING B650-PLUS", "cooling": "Air Cooling"}'
);

-- Gaming PCs - Entry Level
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'MSI Katana GF66',
  34999.99,
  'Giriş seviyesi gaming PC, 1080p oyun deneyimi',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i5-13600KF',
    'NVIDIA RTX 4060 Ti 8GB',
    '16GB DDR5 4800MHz',
    '1TB NVMe Gen4',
    '650W 80+ Bronze',
    'MSI MAG FORGE 100M'
  ],
  4.5,
  20,
  'gaming-pc-entry',
  'MSI',
  '{"cpu": "Intel Core i5-13600KF", "gpu": "RTX 4060 Ti", "ram": "16GB DDR5", "storage": "1TB NVMe", "motherboard": "MSI PRO B760", "cooling": "Air Cooling"}'
),
(
  'ASUS TUF Gaming F15',
  29999.99,
  'Ekonomik gaming sistemi',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i5-13400F',
    'TUF RTX 4060 8GB',
    '16GB DDR5 4800MHz',
    '512GB NVMe + 1TB HDD',
    '600W 80+ Bronze',
    'TUF Gaming GT301'
  ],
  4.4,
  25,
  'gaming-pc-entry',
  'ASUS',
  '{"cpu": "Intel Core i5-13400F", "gpu": "TUF RTX 4060", "ram": "16GB DDR5", "storage": "1.5TB Total", "motherboard": "TUF GAMING B760M-PLUS", "cooling": "Air Cooling"}'
);

-- Workstations - Professional
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'HP Z8 Fury G5',
  199999.99,
  'En üst segment profesyonel iş istasyonu',
  'https://images.unsplash.com/photo-1547082299-de196ea013d6?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Dual Intel Xeon Platinum 8490H',
    'NVIDIA RTX A6000 48GB',
    '512GB DDR5 ECC',
    '8TB NVMe RAID',
    '1800W Titanium',
    'HP Z8 Tower'
  ],
  4.9,
  2,
  'workstation-pro',
  'HP',
  '{"cpu": "Dual Xeon Platinum 8490H", "gpu": "RTX A6000", "ram": "512GB ECC", "storage": "8TB RAID", "motherboard": "HP Z8 G5", "cooling": "Liquid Cooling"}'
);

-- Workstations - Design
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Dell Precision 7960',
  149999.99,
  'Tasarım odaklı profesyonel iş istasyonu',
  'https://images.unsplash.com/photo-1547082299-de196ea013d6?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Xeon W-3495X',
    'NVIDIA RTX A5000 24GB',
    '256GB DDR5 ECC',
    '4TB NVMe RAID',
    '1600W Platinum',
    'Precision Tower'
  ],
  4.8,
  4,
  'workstation-design',
  'Dell',
  '{"cpu": "Xeon W-3495X", "gpu": "RTX A5000", "ram": "256GB ECC", "storage": "4TB RAID", "motherboard": "Dell WS", "cooling": "Active Thermal"}'
);

-- Workstations - Render
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Lenovo ThinkStation P920',
  129999.99,
  'Render ve simülasyon odaklı iş istasyonu',
  'https://images.unsplash.com/photo-1547082299-de196ea013d6?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Threadripper PRO 7995WX',
    'NVIDIA RTX A4500 20GB',
    '128GB DDR5 ECC',
    '2TB NVMe + 8TB SSD',
    '1400W Platinum',
    'ThinkStation Tower'
  ],
  4.7,
  6,
  'workstation-render',
  'Lenovo',
  '{"cpu": "Threadripper PRO 7995WX", "gpu": "RTX A4500", "ram": "128GB ECC", "storage": "10TB Total", "motherboard": "WRX80", "cooling": "Tri-Channel"}'
);

-- Gaming Laptops - High End
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'MSI Titan GT77 HX',
  89999.99,
  'En güçlü gaming laptop',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13980HX',
    'NVIDIA RTX 4090 16GB',
    '64GB DDR5 5600MHz',
    '4TB NVMe RAID',
    '17.3" 4K 144Hz Mini LED',
    'Titan Cooling'
  ],
  4.9,
  3,
  'gaming-laptop-high',
  'MSI',
  '{"cpu": "Core i9-13980HX", "gpu": "RTX 4090", "ram": "64GB DDR5", "storage": "4TB RAID", "display": "4K Mini LED", "battery": "99.9WHr"}'
);

-- Gaming Laptops - Mid Range
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'ASUS ROG Strix G15',
  54999.99,
  'Performans odaklı gaming laptop',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Ryzen 9 7945HX',
    'NVIDIA RTX 4070 8GB',
    '32GB DDR5 5200MHz',
    '1TB NVMe Gen4',
    '15.6" QHD 240Hz',
    'ROG Intelligent Cooling'
  ],
  4.7,
  8,
  'gaming-laptop-mid',
  'ASUS ROG',
  '{"cpu": "Ryzen 9 7945HX", "gpu": "RTX 4070", "ram": "32GB DDR5", "storage": "1TB NVMe", "display": "QHD 240Hz", "battery": "90WHr"}'
);

-- Gaming Laptops - Entry Level
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Lenovo IdeaPad Gaming 3',
  29999.99,
  'Ekonomik gaming laptop',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Ryzen 5 7640HS',
    'NVIDIA RTX 4050 6GB',
    '16GB DDR5 4800MHz',
    '512GB NVMe',
    '15.6" FHD 120Hz',
    'Q Control Cooling'
  ],
  4.5,
  15,
  'gaming-laptop-entry',
  'Lenovo',
  '{"cpu": "Ryzen 5 7640HS", "gpu": "RTX 4050", "ram": "16GB DDR5", "storage": "512GB NVMe", "display": "FHD 120Hz", "battery": "60WHr"}'
);