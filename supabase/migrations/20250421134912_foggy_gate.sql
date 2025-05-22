/*
  # Add more branded products

  1. Changes
    - Add more products for existing brands
    - Add new products for gaming peripherals
    - Add monitors from different brands
*/

-- Add more gaming PCs
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand) VALUES
(
  'MSI MPG Trident AS',
  35999.99,
  'Kompakt tasarımlı MSI gaming PC',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i7-13700KF',
    'NVIDIA RTX 4070 Ti',
    '32GB DDR5',
    '1TB NVMe SSD',
    'MSI Silent Storm Cooling'
  ],
  4.7,
  15,
  'gaming-pc',
  'MSI'
),
(
  'ASUS ROG G22CH',
  42999.99,
  'Kompakt ve güçlü ASUS gaming PC',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13900K',
    'NVIDIA RTX 4080',
    '32GB DDR5',
    '2TB NVMe SSD',
    'ROG Liquid Cooling'
  ],
  4.8,
  10,
  'gaming-pc',
  'ASUS ROG'
);

-- Add more laptops
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand) VALUES
(
  'MacBook Pro 14"',
  44999.99,
  'M2 Pro çipli MacBook Pro',
  'https://images.unsplash.com/photo-1517336714731-489689fd1ca4?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Apple M2 Pro',
    '16GB Unified Memory',
    '512GB SSD',
    '14" Liquid Retina XDR',
    '18 Saat Pil Ömrü'
  ],
  4.8,
  20,
  'ultrabook',
  'Apple'
),
(
  'Dell XPS 13 Plus',
  34999.99,
  'Modern tasarımlı premium ultrabook',
  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i7-1360P',
    'Intel Iris Xe Graphics',
    '16GB LPDDR5',
    '512GB NVMe SSD',
    '13.4" 4K OLED'
  ],
  4.7,
  25,
  'ultrabook',
  'Dell'
);

-- Add monitors
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand) VALUES
(
  'ASUS ROG Swift PG32UQX',
  39999.99,
  'Premium 4K HDR gaming monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '32" 4K IPS',
    'Mini LED Backlight',
    'HDR 1400',
    '144Hz G-SYNC Ultimate',
    'Quantum Dot'
  ],
  4.9,
  5,
  'monitor',
  'ASUS ROG'
),
(
  'MSI Optix MPG321UR-QD',
  29999.99,
  'Profesyonel gaming monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '32" 4K IPS',
    'Quantum Dot',
    'HDR 600',
    '144Hz Refresh Rate',
    'KVM Switch'
  ],
  4.8,
  8,
  'monitor',
  'MSI'
);

-- Add gaming peripherals
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand) VALUES
(
  'Razer BlackWidow V3 Pro',
  3499.99,
  'Kablosuz mekanik gaming klavye',
  'https://images.unsplash.com/photo-1595225476474-87563907a212?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Razer Green Switch',
    'Chroma RGB',
    'Wireless + Bluetooth',
    'Multimedia Controls',
    'Wrist Rest'
  ],
  4.7,
  20,
  'gaming-keyboard',
  'Razer'
),
(
  'Logitech G915 TKL',
  3299.99,
  'Low profile kablosuz gaming klavye',
  'https://images.unsplash.com/photo-1595225476474-87563907a212?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'GL Tactile Switch',
    'LIGHTSPEED Wireless',
    'RGB Lighting',
    'Aircraft-Grade Aluminum',
    '40 Saat Pil'
  ],
  4.8,
  15,
  'gaming-keyboard',
  'Logitech'
),
(
  'Razer Kraken V3 Pro',
  2999.99,
  'Kablosuz gaming kulaklık',
  'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'THX Spatial Audio',
    'HyperSense Haptic',
    'TriForce Titanium 50mm',
    'Chroma RGB',
    'Noise Cancelling Mic'
  ],
  4.7,
  30,
  'gaming-headset',
  'Razer'
),
(
  'Logitech G Pro X Wireless',
  2799.99,
  'Profesyonel gaming kulaklık',
  'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'PRO-G 50mm',
    'DTS Headphone:X 2.0',
    'Blue VO!CE Technology',
    '20 Saat Pil',
    'Memory Foam'
  ],
  4.8,
  25,
  'gaming-headset',
  'Logitech'
);