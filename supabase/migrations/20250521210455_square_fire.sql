-- First delete existing Lenovo LOQ products if they exist
DELETE FROM products WHERE name LIKE 'Lenovo LOQ%';

-- Insert Lenovo LOQ with RTX 4050
INSERT INTO products (
  name,
  price,
  description,
  image,
  specs,
  rating,
  stock,
  category,
  brand,
  technical_specs
) VALUES (
  'Lenovo LOQ 15IRH8',
  34999.99,
  'Lenovo LOQ gaming laptop, Intel Core i5-12450HX işlemci ve RTX 4050 ekran kartı ile oyun ve içerik üretimi için ideal performans sunar. 24GB DDR5 RAM ve 512GB NVMe SSD ile hızlı sistem performansı. 15.6 inç FHD 144Hz ekran ile akıcı oyun deneyimi.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1593642634315-48f5414c3ad9?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Core i5-12450HX',
    'NVIDIA GeForce RTX 4050 6GB',
    '24GB DDR5 5200MHz RAM',
    '512GB NVMe SSD',
    '15.6" FHD 144Hz IPS',
    'RGB Klavye',
    'Windows 11 Home'
  ],
  4.6,
  15,
  'gaming-laptop',
  'Lenovo',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core i5-12450HX',
      'cores', 8,
      'threads', 12,
      'base_clock', '2.4GHz',
      'boost_clock', '4.4GHz',
      'cache', '12MB'
    ),
    'gpu', jsonb_build_object(
      'model', 'NVIDIA GeForce RTX 4050',
      'vram', '6GB',
      'type', 'GDDR6'
    ),
    'ram', jsonb_build_object(
      'size', '24GB',
      'speed', '5200MHz',
      'type', 'DDR5'
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '512GB',
        'type', 'NVMe SSD'
      )
    ),
    'display', jsonb_build_object(
      'size', '15.6 inch',
      'resolution', '1920x1080',
      'refresh_rate', 144,
      'panel', 'IPS',
      'brightness', '350 nits'
    ),
    'battery', jsonb_build_object(
      'capacity', '60Wh',
      'type', 'Li-Polymer'
    ),
    'ports', ARRAY[
      'USB 3.2 Type-A',
      'USB Type-C',
      'HDMI 2.1',
      'RJ45',
      'Audio Jack'
    ],
    'cooling', jsonb_build_object(
      'type', 'Legion Coldfront',
      'fans', 2,
      'heat_pipes', 4
    ),
    'features', ARRAY[
      'Nahimic Audio',
      'Legion AI Engine',
      'Military-Grade Durability',
      'Legion TrueStrike Keyboard'
    ]
  )
);

-- Insert Lenovo LOQ with Radeon RX A530M
INSERT INTO products (
  name,
  price,
  description,
  image,
  specs,
  rating,
  stock,
  category,
  brand,
  technical_specs
) VALUES (
  'Lenovo LOQ 15IRH8 AMD',
  29999.99,
  'Lenovo LOQ gaming laptop, Intel Core i5-12450HX işlemci ve Radeon RX A530M ekran kartı ile uygun fiyatlı gaming deneyimi sunar. 8GB DDR5 RAM ve 512GB NVMe SSD ile dengeli sistem performansı. 15.6 inç FHD 144Hz ekran ile akıcı oyun deneyimi.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1593642634315-48f5414c3ad9?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Core i5-12450HX',
    'AMD Radeon RX A530M 4GB',
    '8GB DDR5 5200MHz RAM',
    '512GB NVMe SSD',
    '15.6" FHD 144Hz IPS',
    'RGB Klavye',
    'Windows 11 Home'
  ],
  4.4,
  20,
  'gaming-laptop',
  'Lenovo',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core i5-12450HX',
      'cores', 8,
      'threads', 12,
      'base_clock', '2.4GHz',
      'boost_clock', '4.4GHz',
      'cache', '12MB'
    ),
    'gpu', jsonb_build_object(
      'model', 'AMD Radeon RX A530M',
      'vram', '4GB',
      'type', 'GDDR6'
    ),
    'ram', jsonb_build_object(
      'size', '8GB',
      'speed', '5200MHz',
      'type', 'DDR5'
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '512GB',
        'type', 'NVMe SSD'
      )
    ),
    'display', jsonb_build_object(
      'size', '15.6 inch',
      'resolution', '1920x1080',
      'refresh_rate', 144,
      'panel', 'IPS',
      'brightness', '350 nits'
    ),
    'battery', jsonb_build_object(
      'capacity', '60Wh',
      'type', 'Li-Polymer'
    ),
    'ports', ARRAY[
      'USB 3.2 Type-A',
      'USB Type-C',
      'HDMI 2.0',
      'RJ45',
      'Audio Jack'
    ],
    'cooling', jsonb_build_object(
      'type', 'Legion Coldfront',
      'fans', 2,
      'heat_pipes', 4
    ),
    'features', ARRAY[
      'Nahimic Audio',
      'Legion AI Engine',
      'Military-Grade Durability',
      'Legion TrueStrike Keyboard'
    ]
  )
);