/*
  # Add more products and update brand information

  1. Changes
    - Add more products for each category
    - Add brand information for existing products
    - Add technical specifications
*/

-- Add more CPUs
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand) VALUES
(
  'AMD Ryzen 7 7800X3D',
  13999.99,
  'Oyun odaklı yüksek performanslı işlemci',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '8 Çekirdek 16 Thread',
    '5.0GHz Max Boost',
    '104MB Cache',
    'PCIe 5.0',
    '120W TDP'
  ],
  4.7,
  25,
  'cpu',
  'AMD'
),
(
  'Intel Core i7-13700K',
  11999.99,
  'Yüksek performanslı gaming işlemci',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '16 Çekirdek (8P+8E)',
    '5.4GHz Turbo',
    '30MB Cache',
    'PCIe 5.0',
    'Unlocked'
  ],
  4.6,
  30,
  'cpu',
  'Intel'
);

-- Add more GPUs
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand) VALUES
(
  'GIGABYTE RTX 4070 Ti GAMING OC',
  29999.99,
  'Üçlü fanlı yüksek performanslı ekran kartı',
  'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '12GB GDDR6X',
    '2610MHz Boost',
    'WINDFORCE Cooling',
    'RGB Fusion 2.0',
    'Metal Backplate'
  ],
  4.7,
  12,
  'gpu',
  'GIGABYTE'
),
(
  'MSI RX 7900 XTX GAMING TRIO',
  34999.99,
  'AMD''nin en güçlü ekran kartı',
  'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '24GB GDDR6',
    '2500MHz Game Clock',
    'TRI FROZR 3',
    'Mystic Light',
    'Zero Frozr'
  ],
  4.6,
  8,
  'gpu',
  'MSI'
);

-- Add storage devices
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand) VALUES
(
  'Samsung 990 PRO 2TB',
  4999.99,
  'En hızlı PCIe 4.0 NVMe SSD',
  'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '7450MB/s Okuma',
    '6900MB/s Yazma',
    'PCIe 4.0 x4',
    'Samsung V-NAND',
    'Samsung Controller'
  ],
  4.9,
  40,
  'storage',
  'Samsung'
),
(
  'WD Black SN850X 1TB',
  3499.99,
  'Gaming odaklı NVMe SSD',
  'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '7300MB/s Okuma',
    '6300MB/s Yazma',
    'PCIe 4.0',
    'WD G2 Controller',
    'Game Mode 2.0'
  ],
  4.8,
  35,
  'storage',
  'Western Digital'
),
(
  'Crucial T700 2TB',
  5499.99,
  'PCIe 5.0 NVMe SSD',
  'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '12400MB/s Okuma',
    '11800MB/s Yazma',
    'PCIe 5.0 x4',
    'Micron TLC',
    'E26 Controller'
  ],
  4.7,
  20,
  'storage',
  'Crucial'
);

-- Add gaming laptops
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand) VALUES
(
  'ASUS ROG Strix SCAR 18',
  89999.99,
  'En güçlü gaming laptop',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13980HX',
    'NVIDIA RTX 4090 16GB',
    '64GB DDR5',
    '2TB NVMe RAID',
    '18" QHD+ 240Hz'
  ],
  4.9,
  5,
  'gaming-laptop',
  'ASUS ROG'
),
(
  'MSI Raider GE78 HX',
  79999.99,
  'Premium gaming laptop',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13950HX',
    'NVIDIA RTX 4080 12GB',
    '32GB DDR5',
    '2TB NVMe SSD',
    '17" QHD+ 240Hz'
  ],
  4.8,
  8,
  'gaming-laptop',
  'MSI'
);

-- Add workstations
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand) VALUES
(
  'HP Z8 G5',
  149999.99,
  'En güçlü iş istasyonu',
  'https://images.unsplash.com/photo-1547082299-de196ea013d6?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Dual Xeon Platinum',
    'NVIDIA RTX A6000',
    '256GB ECC RAM',
    '4TB NVMe RAID',
    '1600W PSU'
  ],
  4.9,
  3,
  'workstation',
  'HP'
),
(
  'Dell Precision 7960',
  129999.99,
  'Profesyonel iş istasyonu',
  'https://images.unsplash.com/photo-1547082299-de196ea013d6?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Xeon W-3400',
    'NVIDIA RTX A5000',
    '128GB ECC RAM',
    '2TB NVMe SSD',
    '1400W PSU'
  ],
  4.8,
  5,
  'workstation',
  'Dell'
);

-- Add monitors
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand) VALUES
(
  'Samsung Odyssey Neo G9',
  34999.99,
  'Ultra geniş gaming monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '49" 5120x1440',
    'Mini LED 2000 nit',
    '240Hz Refresh Rate',
    'HDR2000',
    '1000R Curve'
  ],
  4.8,
  10,
  'monitor',
  'Samsung'
),
(
  'LG UltraGear 27GR95QE',
  24999.99,
  'OLED gaming monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '27" QHD OLED',
    '240Hz Refresh Rate',
    '0.03ms Response Time',
    'G-SYNC Compatible',
    'HDR10'
  ],
  4.7,
  15,
  'monitor',
  'LG'
);