/*
  # Add products for each category

  1. Changes
    - Add products with proper categorization
    - Include detailed specifications
    - Add technical details
*/

-- Gaming PCs
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'MSI MEG Aegis Ti5',
  119999.99,
  'En üst segment gaming PC, 4K ve ray tracing oyunlar için optimize edilmiş.',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13900KS 6.0GHz',
    'NVIDIA RTX 4090 24GB',
    '64GB DDR5-6400MHz RAM',
    '4TB NVMe SSD'
  ],
  4.9,
  5,
  'gaming-pc-high',
  'MSI',
  '{"cpu": {"model": "i9-13900KS", "cores": 24}, "gpu": {"model": "RTX 4090", "vram": "24GB"}}'
);

-- Laptops
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'ASUS ROG Strix G15',
  54999.99,
  'Güçlü gaming laptop, yüksek performans ve taşınabilirlik.',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Ryzen 9 7945HX',
    'NVIDIA RTX 4070 8GB',
    '32GB DDR5 RAM',
    '1TB NVMe SSD'
  ],
  4.7,
  8,
  'gaming-laptop',
  'ASUS ROG',
  '{"cpu": {"model": "Ryzen 9 7945HX", "cores": 16}, "gpu": {"model": "RTX 4070", "vram": "8GB"}}'
);

-- Monitors
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Samsung Odyssey G9',
  34999.99,
  'Ultra geniş gaming monitör, sürükleyici oyun deneyimi.',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '49" 5120x1440',
    '240Hz Yenileme',
    'HDR1000',
    '1ms Tepki Süresi'
  ],
  4.8,
  10,
  'monitor',
  'Samsung',
  '{"panel": "VA", "refresh_rate": 240, "resolution": "5120x1440", "hdr": true}'
);

-- Components (CPU)
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'AMD Ryzen 9 7950X3D',
  17999.99,
  'En iyi gaming işlemci, 3D V-Cache teknolojisi.',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '16 Çekirdek 32 Thread',
    '5.7GHz Boost',
    '144MB Cache',
    'PCIe 5.0'
  ],
  4.9,
  15,
  'cpu',
  'AMD',
  '{"cores": 16, "threads": 32, "base_clock": "4.2GHz", "boost_clock": "5.7GHz"}'
);

-- Components (GPU)
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'NVIDIA RTX 4090',
  49999.99,
  'En güçlü ekran kartı, maksimum oyun performansı.',
  'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '24GB GDDR6X',
    '2.52GHz Boost',
    'DLSS 3.0',
    'Ray Tracing'
  ],
  4.9,
  5,
  'gpu',
  'NVIDIA',
  '{"memory": "24GB", "memory_type": "GDDR6X", "boost_clock": "2.52GHz"}'
);