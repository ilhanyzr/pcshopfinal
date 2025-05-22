-- First delete existing products if they exist
DELETE FROM products WHERE name IN ('ASUS Zenbook UX3405CA', 'HUAWEI MateBook D14');

-- Insert ASUS Zenbook UX3405CA
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
  'ASUS Zenbook UX3405CA',
  44999.99,
  'ASUS Zenbook UX3405CA, Intel Core Ultra 7 155H işlemci ile yüksek performans ve uzun pil ömrü sunar. 32GB LPDDR5X RAM ve 1TB PCIe SSD ile hızlı sistem performansı. 14.5 inç 3K 120Hz OLED ekran ile olağanüstü görüntü kalitesi. Ultra ince ve hafif tasarımı ile maksimum taşınabilirlik.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1517336714731-489689fd1ca4?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1511385348-a52b4a160dc2?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Core Ultra 7 155H',
    'Intel Arc Graphics',
    '32GB LPDDR5X RAM',
    '1TB PCIe 4.0 SSD',
    '14.5" 3K 120Hz OLED',
    'Thunderbolt 4',
    'Windows 11 Pro'
  ],
  4.8,
  10,
  'ultrabook',
  'ASUS',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core Ultra 7 155H',
      'cores', 16,
      'threads', 22,
      'base_clock', '3.8GHz',
      'boost_clock', '4.8GHz',
      'cache', '24MB'
    ),
    'gpu', jsonb_build_object(
      'model', 'Intel Arc Graphics',
      'type', 'Integrated',
      'features', ARRAY[
        'XeSS',
        'Ray Tracing',
        'AV1 Encode/Decode'
      ]
    ),
    'ram', jsonb_build_object(
      'size', '32GB',
      'speed', '7467MHz',
      'type', 'LPDDR5X'
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '1TB',
        'type', 'PCIe 4.0 NVMe SSD',
        'read_speed', '7000 MB/s',
        'write_speed', '6000 MB/s'
      )
    ),
    'display', jsonb_build_object(
      'size', '14.5 inch',
      'resolution', '3072x1920',
      'refresh_rate', 120,
      'panel', 'OLED',
      'brightness', '600 nits',
      'hdr', true,
      'color_gamut', '100% DCI-P3'
    ),
    'battery', jsonb_build_object(
      'capacity', '75Wh',
      'type', 'Li-Polymer',
      'fast_charging', true
    ),
    'ports', ARRAY[
      'Thunderbolt 4',
      'USB 3.2 Type-A',
      'HDMI 2.1',
      'Audio Jack'
    ],
    'features', ARRAY[
      'Windows Hello',
      'Harman Kardon Audio',
      'Military Grade Durability',
      'NumberPad 2.0'
    ],
    'dimensions', jsonb_build_object(
      'height', '14.9mm',
      'width', '313.6mm',
      'depth', '220.6mm',
      'weight', '1.28kg'
    )
  )
);

-- Insert HUAWEI MateBook D14
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
  'HUAWEI MateBook D14',
  24999.99,
  'HUAWEI MateBook D14, Intel Core i5-13420H işlemci ile verimli performans sunar. 16GB RAM ve 512GB SSD ile akıcı çalışma deneyimi. 14 inç 1080p IPS ekran ile net görüntü kalitesi. İnce ve şık tasarımı ile her yere taşınabilir.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1517336714731-489689fd1ca4?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1511385348-a52b4a160dc2?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Core i5-13420H',
    'Intel Iris Xe Graphics',
    '16GB LPDDR4X RAM',
    '512GB NVMe SSD',
    '14" FHD IPS',
    'USB-C',
    'Windows 11 Home'
  ],
  4.6,
  15,
  'ultrabook',
  'HUAWEI',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core i5-13420H',
      'cores', 8,
      'threads', 12,
      'base_clock', '2.1GHz',
      'boost_clock', '4.6GHz',
      'cache', '12MB'
    ),
    'gpu', jsonb_build_object(
      'model', 'Intel Iris Xe Graphics',
      'type', 'Integrated'
    ),
    'ram', jsonb_build_object(
      'size', '16GB',
      'speed', '4266MHz',
      'type', 'LPDDR4X'
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '512GB',
        'type', 'NVMe PCIe SSD'
      )
    ),
    'display', jsonb_build_object(
      'size', '14 inch',
      'resolution', '1920x1080',
      'refresh_rate', 60,
      'panel', 'IPS',
      'brightness', '300 nits',
      'color_gamut', '100% sRGB'
    ),
    'battery', jsonb_build_object(
      'capacity', '56Wh',
      'type', 'Li-Polymer',
      'fast_charging', true
    ),
    'ports', ARRAY[
      'USB-C',
      'USB 3.2 Type-A',
      'HDMI',
      'Audio Jack'
    ],
    'features', ARRAY[
      'Fingerprint Reader',
      'Pop-up Camera',
      'Super Device',
      'Multi-screen Collaboration'
    ],
    'dimensions', jsonb_build_object(
      'height', '15.9mm',
      'width', '322.5mm',
      'depth', '214.8mm',
      'weight', '1.39kg'
    )
  )
);