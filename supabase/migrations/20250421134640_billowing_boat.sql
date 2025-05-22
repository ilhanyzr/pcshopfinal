/*
  # Add brands and update product categories

  1. Changes
    - Add brand column to products table
    - Update category constraints
    - Add sample products for major brands

  2. Categories
    - Gaming PCs by brand (MSI, ASUS ROG, etc.)
    - Laptops by brand (Apple, Dell, HP, etc.)
    - Components by brand (Intel, AMD, NVIDIA, etc.)
*/

-- Add brand column
ALTER TABLE products
ADD COLUMN brand text;

-- Update existing products with brands
UPDATE products SET brand = 'MSI' WHERE category = 'gaming-pc' AND id = (SELECT id FROM products WHERE category = 'gaming-pc' LIMIT 1);
UPDATE products SET brand = 'Dell' WHERE category = 'workstation' AND id = (SELECT id FROM products WHERE category = 'workstation' LIMIT 1);
UPDATE products SET brand = 'ASUS ROG' WHERE category = 'gaming-laptop' AND id = (SELECT id FROM products WHERE category = 'gaming-laptop' LIMIT 1);
UPDATE products SET brand = 'Apple' WHERE category = 'ultrabook' AND id = (SELECT id FROM products WHERE category = 'ultrabook' LIMIT 1);

-- Insert new products with brands
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand) VALUES
-- Gaming PCs
(
  'MSI MEG Infinite X',
  55999.99,
  'MSI''nin en güçlü gaming PC''si',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13900KF',
    'NVIDIA RTX 4090 24GB',
    '64GB DDR5 6000MHz',
    '2TB NVMe Gen4',
    '1000W PSU'
  ],
  4.9,
  5,
  'gaming-pc',
  'MSI'
),
(
  'ASUS ROG Strix GT35',
  49999.99,
  'ASUS ROG serisi gaming bilgisayar',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Ryzen 9 7950X',
    'NVIDIA RTX 4080 16GB',
    '32GB DDR5',
    '1TB NVMe Gen4',
    'ROG Cooling'
  ],
  4.8,
  8,
  'gaming-pc',
  'ASUS ROG'
),

-- Laptops
(
  'MacBook Pro 16"',
  64999.99,
  'Apple M2 Max işlemcili profesyonel laptop',
  'https://images.unsplash.com/photo-1517336714731-489689fd1ca4?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Apple M2 Max',
    '32GB Unified Memory',
    '1TB SSD',
    '16" Liquid Retina XDR',
    '22 Saat Pil Ömrü'
  ],
  4.9,
  10,
  'ultrabook',
  'Apple'
),
(
  'Dell XPS 15',
  44999.99,
  'Premium iş laptopu',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13900H',
    'NVIDIA RTX 4070',
    '32GB DDR5',
    '1TB NVMe SSD',
    '15.6" 4K OLED'
  ],
  4.8,
  12,
  'ultrabook',
  'Dell'
),

-- Components
(
  'Intel Core i9-13900KS',
  19999.99,
  'Intel''in en güçlü masaüstü işlemcisi',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '24 Çekirdek (8P+16E)',
    '6.0GHz Max Turbo',
    '36MB Cache',
    'PCIe 5.0',
    'Unlocked'
  ],
  4.9,
  15,
  'cpu',
  'Intel'
),
(
  'AMD Ryzen 9 7950X3D',
  17999.99,
  'AMD''nin oyuncu odaklı en güçlü işlemcisi',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '16 Çekirdek',
    '5.7GHz Boost',
    '144MB Cache',
    'PCIe 5.0',
    '3D V-Cache'
  ],
  4.8,
  20,
  'cpu',
  'AMD'
),

-- GPUs
(
  'ASUS ROG STRIX RTX 4090 OC',
  52999.99,
  'En güçlü ASUS ROG ekran kartı',
  'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '24GB GDDR6X',
    '2640MHz Boost',
    'ROG Cooling',
    '3.5 Slot Design',
    'RGB Lighting'
  ],
  4.9,
  3,
  'gpu',
  'ASUS ROG'
),
(
  'MSI SUPRIM X RTX 4080',
  39999.99,
  'MSI''nin premium RTX 4080 modeli',
  'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '16GB GDDR6X',
    '2625MHz Boost',
    'SUPRIM Cooling',
    'Mystic Light',
    'Zero Frozr'
  ],
  4.8,
  7,
  'gpu',
  'MSI'
);

-- Add gaming peripherals with brands
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand) VALUES
(
  'Razer Basilisk V3 Pro',
  2499.99,
  'Razer''ın en gelişmiş gaming mouse''u',
  'https://images.unsplash.com/photo-1527814050087-3793815479db?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '30K DPI Sensör',
    '10+1 Programlanabilir Tuş',
    'Wireless + Bluetooth',
    'Chroma RGB',
    'Focus Pro Sensör'
  ],
  4.8,
  25,
  'gaming-mouse',
  'Razer'
),
(
  'Logitech G Pro X Superlight',
  2299.99,
  'Ultra hafif profesyonel gaming mouse',
  'https://images.unsplash.com/photo-1527814050087-3793815479db?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'HERO 25K Sensör',
    '63g Ağırlık',
    'Wireless',
    '70 Saat Pil',
    'Zero Additive'
  ],
  4.9,
  30,
  'gaming-mouse',
  'Logitech'
);