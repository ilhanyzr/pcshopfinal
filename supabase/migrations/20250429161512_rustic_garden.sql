/*
  # Add products for subcategories

  1. Changes
    - Add products for each subcategory
    - Include detailed specifications
    - Add technical details
*/

-- Gaming PCs - High End Additional Products
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Corsair ONE i300',
  114999.99,
  'Kompakt tasarımlı ultra premium gaming PC',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13900K',
    'NVIDIA RTX 4090 24GB',
    '64GB DDR5 6000MHz',
    '4TB NVMe PCIe 4.0',
    '750W SFX Platinum',
    'Liquid Cooling'
  ],
  4.8,
  5,
  'gaming-pc-high',
  'Corsair',
  '{"cpu": "Core i9-13900K", "gpu": "RTX 4090", "ram": "64GB DDR5", "storage": "4TB NVMe", "cooling": "Custom Loop", "form_factor": "SFF"}'
),
(
  'Alienware Aurora R15',
  104999.99,
  'Özel tasarım yüksek performanslı gaming PC',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13900KF',
    'NVIDIA RTX 4080 16GB',
    '64GB DDR5 5600MHz',
    '2TB NVMe + 2TB SSD',
    '1000W Platinum',
    'Cryo-tech Cooling'
  ],
  4.7,
  8,
  'gaming-pc-high',
  'Alienware',
  '{"cpu": "Core i9-13900KF", "gpu": "RTX 4080", "ram": "64GB DDR5", "storage": "4TB Total", "cooling": "Cryo-tech", "lighting": "AlienFX"}'
);

-- Gaming PCs - Mid Range Additional Products
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'NZXT H5 Flow Gaming',
  54999.99,
  'Dengeli performans sunan gaming sistemi',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Ryzen 7 7800X3D',
    'NVIDIA RTX 4070 Ti 12GB',
    '32GB DDR5 5200MHz',
    '2TB NVMe PCIe 4.0',
    '850W Gold',
    'NZXT Kraken 240'
  ],
  4.6,
  12,
  'gaming-pc-mid',
  'NZXT',
  '{"cpu": "Ryzen 7 7800X3D", "gpu": "RTX 4070 Ti", "ram": "32GB DDR5", "storage": "2TB NVMe", "cooling": "240mm AIO", "case": "H5 Flow"}'
),
(
  'Acer Predator Orion 5000',
  49999.99,
  'Oyun odaklı orta segment PC',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i7-13700F',
    'NVIDIA RTX 4070 12GB',
    '32GB DDR5 4800MHz',
    '1TB NVMe + 2TB HDD',
    '750W Gold',
    'FrostBlade Cooling'
  ],
  4.5,
  15,
  'gaming-pc-mid',
  'Acer',
  '{"cpu": "Core i7-13700F", "gpu": "RTX 4070", "ram": "32GB DDR5", "storage": "3TB Total", "cooling": "Air Cooling", "lighting": "PredatorSense"}'
);

-- Gaming PCs - Entry Level Additional Products
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'HP Victus Gaming',
  32999.99,
  'Başlangıç seviyesi gaming PC',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i5-13400F',
    'NVIDIA RTX 4060 8GB',
    '16GB DDR5 4800MHz',
    '1TB NVMe PCIe 4.0',
    '600W Bronze',
    'Victus Cooling'
  ],
  4.4,
  20,
  'gaming-pc-entry',
  'HP',
  '{"cpu": "Core i5-13400F", "gpu": "RTX 4060", "ram": "16GB DDR5", "storage": "1TB NVMe", "cooling": "Air Cooling", "case": "Victus"}'
),
(
  'Lenovo Legion Tower 5',
  31999.99,
  'Ekonomik gaming sistemi',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Ryzen 5 7600',
    'NVIDIA RTX 4060 8GB',
    '16GB DDR5 4800MHz',
    '512GB NVMe + 1TB HDD',
    '550W Bronze',
    'Legion Cooling'
  ],
  4.3,
  25,
  'gaming-pc-entry',
  'Lenovo',
  '{"cpu": "Ryzen 5 7600", "gpu": "RTX 4060", "ram": "16GB DDR5", "storage": "1.5TB Total", "cooling": "Air Cooling", "lighting": "Legion RGB"}'
);

-- Workstations - Professional Additional Products
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Lenovo ThinkStation P920',
  189999.99,
  'Çift işlemcili profesyonel iş istasyonu',
  'https://images.unsplash.com/photo-1547082299-de196ea013d6?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Dual Xeon Platinum 8480+',
    'NVIDIA RTX A6000 48GB',
    '512GB DDR5 ECC',
    '8TB NVMe RAID',
    '1600W Titanium',
    'ThinkStation Cooling'
  ],
  4.9,
  3,
  'workstation-pro',
  'Lenovo',
  '{"cpu": "Dual Xeon 8480+", "gpu": "RTX A6000", "ram": "512GB ECC", "storage": "8TB RAID", "certification": "ISV", "reliability": "24/7"}'
);

-- Workstations - Design Additional Products
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'HP Z4 G5',
  139999.99,
  'Tasarım odaklı iş istasyonu',
  'https://images.unsplash.com/photo-1547082299-de196ea013d6?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Xeon W-3465',
    'NVIDIA RTX A4500 20GB',
    '128GB DDR5 ECC',
    '4TB NVMe RAID',
    '1000W Platinum',
    'Z4 Cooling'
  ],
  4.7,
  6,
  'workstation-design',
  'HP',
  '{"cpu": "Xeon W-3465", "gpu": "RTX A4500", "ram": "128GB ECC", "storage": "4TB RAID", "certification": "CAD", "security": "HP Sure"}'
);

-- Workstations - Render Additional Products
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Dell Precision 7865',
  159999.99,
  'Render ve AI odaklı iş istasyonu',
  'https://images.unsplash.com/photo-1547082299-de196ea013d6?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Threadripper PRO 7985WX',
    'NVIDIA RTX A5500 24GB',
    '256GB DDR5 ECC',
    '8TB NVMe RAID',
    '1400W Platinum',
    'Precision Cooling'
  ],
  4.8,
  4,
  'workstation-render',
  'Dell',
  '{"cpu": "TR PRO 7985WX", "gpu": "RTX A5500", "ram": "256GB ECC", "storage": "8TB RAID", "certification": "Render", "reliability": "Enterprise"}'
);

-- Gaming Laptops - High End Additional Products
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Razer Blade 18',
  84999.99,
  'Premium gaming laptop',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13950HX',
    'NVIDIA RTX 4090 16GB',
    '64GB DDR5 5600MHz',
    '2TB NVMe RAID',
    '18" QHD+ 240Hz',
    'Vapor Chamber'
  ],
  4.8,
  5,
  'gaming-laptop-high',
  'Razer',
  '{"cpu": "Core i9-13950HX", "gpu": "RTX 4090", "ram": "64GB DDR5", "storage": "2TB RAID", "display": "18 inch QHD Plus", "cooling": "Vapor Chamber"}'
);

-- Gaming Laptops - Mid Range Additional Products
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Gigabyte AORUS 15X',
  52999.99,
  'Performans odaklı gaming laptop',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i7-13700H',
    'NVIDIA RTX 4070 8GB',
    '32GB DDR5 5200MHz',
    '1TB NVMe Gen4',
    '15.6" QHD 240Hz',
    'WINDFORCE Infinity'
  ],
  4.6,
  10,
  'gaming-laptop-mid',
  'Gigabyte',
  '{"cpu": "Core i7-13700H", "gpu": "RTX 4070", "ram": "32GB DDR5", "storage": "1TB NVMe", "display": "15.6 inch QHD", "cooling": "WINDFORCE"}'
);

-- Gaming Laptops - Entry Level Additional Products
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'HP Victus 16',
  31999.99,
  'Başlangıç seviyesi gaming laptop',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Ryzen 5 7640HS',
    'NVIDIA RTX 4050 6GB',
    '16GB DDR5 4800MHz',
    '512GB NVMe',
    '16.1" FHD 144Hz',
    'Tempest Cooling'
  ],
  4.4,
  20,
  'gaming-laptop-entry',
  'HP',
  '{"cpu": "Ryzen 5 7640HS", "gpu": "RTX 4050", "ram": "16GB DDR5", "storage": "512GB NVMe", "display": "16.1 inch FHD", "cooling": "Tempest"}'
);

-- Ultrabooks - Premium Additional Products
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Dell XPS 15 OLED',
  59999.99,
  'Premium iş laptopu',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13900H',
    'NVIDIA RTX 4070 8GB',
    '32GB DDR5 5200MHz',
    '2TB NVMe PCIe 4.0',
    '15.6" 4K OLED Touch',
    'Advanced Thermal'
  ],
  4.8,
  8,
  'ultrabook-premium',
  'Dell',
  '{"cpu": "Core i9-13900H", "gpu": "RTX 4070", "ram": "32GB DDR5", "storage": "2TB NVMe", "display": "15.6 inch 4K OLED", "battery": "86WHr"}'
);

-- Ultrabooks - Business Additional Products
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Lenovo ThinkPad X1 Carbon',
  44999.99,
  'Profesyonel iş laptopu',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i7-1370P',
    'Intel Iris Xe Graphics',
    '32GB LPDDR5',
    '1TB NVMe Gen4',
    '14" 2.8K OLED',
    'Rapid Charge'
  ],
  4.7,
  12,
  'ultrabook-business',
  'Lenovo',
  '{"cpu": "Core i7-1370P", "gpu": "Iris Xe", "ram": "32GB LPDDR5", "storage": "1TB NVMe", "display": "14 inch 2.8K OLED", "security": "TPM 2.0"}'
);

-- Ultrabooks - Student Additional Products
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'ASUS ZenBook 14',
  24999.99,
  'Öğrenci dostu ultrabook',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Ryzen 5 7640U',
    'AMD Radeon Graphics',
    '16GB LPDDR5',
    '512GB NVMe',
    '14" FHD IPS',
    'NumberPad 2.0'
  ],
  4.5,
  25,
  'ultrabook-student',
  'ASUS',
  '{"cpu": "Ryzen 5 7640U", "gpu": "Radeon", "ram": "16GB LPDDR5", "storage": "512GB NVMe", "display": "14 inch FHD IPS", "battery": "67WHr"}'
);