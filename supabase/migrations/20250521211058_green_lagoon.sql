-- First delete existing products if they exist
DELETE FROM products WHERE name IN ('Casper Nirvana S100', 'MSI Modern 14', 'Dell Inspiron 15');

-- Insert Casper Nirvana S100
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
  'Casper Nirvana S100',
  19999.99,
  'Casper Nirvana S100, Intel Core i5-1235U işlemci ile verimli performans sunar. 8GB RAM ve 500GB SSD ile günlük kullanım için ideal. 15.6 inç Full HD ekran ile net görüntü kalitesi. İnce tasarımı ve uzun pil ömrü ile mobil kullanım için uygun.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1517336714731-489689fd1ca4?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1511385348-a52b4a160dc2?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Core i5-1235U',
    'Intel Iris Xe Graphics',
    '8GB DDR4 RAM',
    '500GB SSD',
    '15.6" FHD IPS',
    'Windows 11 Home'
  ],
  4.3,
  25,
  'ultrabook',
  'Casper',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core i5-1235U',
      'cores', 10,
      'threads', 12,
      'base_clock', '1.3GHz',
      'boost_clock', '4.4GHz',
      'cache', '12MB'
    ),
    'gpu', jsonb_build_object(
      'model', 'Intel Iris Xe Graphics',
      'type', 'Integrated'
    ),
    'ram', jsonb_build_object(
      'size', '8GB',
      'speed', '3200MHz',
      'type', 'DDR4'
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '500GB',
        'type', 'SATA SSD'
      )
    ),
    'display', jsonb_build_object(
      'size', '15.6 inch',
      'resolution', '1920x1080',
      'refresh_rate', 60,
      'panel', 'IPS',
      'brightness', '250 nits'
    ),
    'battery', jsonb_build_object(
      'capacity', '48Wh',
      'type', 'Li-Ion'
    ),
    'ports', ARRAY[
      'USB 3.0',
      'USB 2.0',
      'HDMI',
      'Audio Jack'
    ],
    'features', ARRAY[
      'HD Webcam',
      'Stereo Speakers',
      'Numeric Keypad'
    ],
    'dimensions', jsonb_build_object(
      'height', '19.9mm',
      'width', '362mm',
      'depth', '241mm',
      'weight', '1.7kg'
    )
  )
);

-- Insert MSI Modern 14
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
  'MSI Modern 14',
  21999.99,
  'MSI Modern 14, Intel Core i5-1335U işlemci ile güçlü performans sunar. 8GB RAM ve 512GB NVMe SSD ile hızlı sistem deneyimi. 14 inç Full HD ekran ile net görüntü kalitesi. Ultra ince tasarımı ve hafif yapısı ile maksimum taşınabilirlik.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1517336714731-489689fd1ca4?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1511385348-a52b4a160dc2?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Core i5-1335U',
    'Intel Iris Xe Graphics',
    '8GB DDR4 RAM',
    '512GB NVMe SSD',
    '14" FHD IPS',
    'Windows 11 Home'
  ],
  4.5,
  20,
  'ultrabook',
  'MSI',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core i5-1335U',
      'cores', 10,
      'threads', 12,
      'base_clock', '1.3GHz',
      'boost_clock', '4.6GHz',
      'cache', '12MB'
    ),
    'gpu', jsonb_build_object(
      'model', 'Intel Iris Xe Graphics',
      'type', 'Integrated'
    ),
    'ram', jsonb_build_object(
      'size', '8GB',
      'speed', '3200MHz',
      'type', 'DDR4'
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '512GB',
        'type', 'NVMe SSD'
      )
    ),
    'display', jsonb_build_object(
      'size', '14 inch',
      'resolution', '1920x1080',
      'refresh_rate', 60,
      'panel', 'IPS',
      'brightness', '300 nits'
    ),
    'battery', jsonb_build_object(
      'capacity', '50Wh',
      'type', 'Li-Polymer'
    ),
    'ports', ARRAY[
      'USB Type-C',
      'USB 3.2',
      'HDMI',
      'Audio Jack'
    ],
    'features', ARRAY[
      'Military Grade Durability',
      'Backlit Keyboard',
      'HD Webcam',
      'Nahimic Audio'
    ],
    'dimensions', jsonb_build_object(
      'height', '16.9mm',
      'width', '319mm',
      'depth', '219mm',
      'weight', '1.4kg'
    )
  )
);

-- Insert Dell Inspiron 15
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
  'Dell Inspiron 15',
  22999.99,
  'Dell Inspiron 15, Intel Core i5-1235U işlemci ile verimli performans sunar. 8GB RAM ve 512GB NVMe SSD ile hızlı sistem deneyimi. 15.6 inç Full HD ekran ile net görüntü kalitesi. ComfortView teknolojisi ile göz yorgunluğunu azaltır.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1517336714731-489689fd1ca4?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1511385348-a52b4a160dc2?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Core i5-1235U',
    'Intel Iris Xe Graphics',
    '8GB DDR4 RAM',
    '512GB NVMe SSD',
    '15.6" FHD WVA',
    'Windows 11 Home'
  ],
  4.4,
  18,
  'ultrabook',
  'Dell',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core i5-1235U',
      'cores', 10,
      'threads', 12,
      'base_clock', '1.3GHz',
      'boost_clock', '4.4GHz',
      'cache', '12MB'
    ),
    'gpu', jsonb_build_object(
      'model', 'Intel Iris Xe Graphics',
      'type', 'Integrated'
    ),
    'ram', jsonb_build_object(
      'size', '8GB',
      'speed', '3200MHz',
      'type', 'DDR4'
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
      'refresh_rate', 60,
      'panel', 'WVA',
      'brightness', '300 nits',
      'features', ARRAY[
        'ComfortView',
        'Anti-Glare'
      ]
    ),
    'battery', jsonb_build_object(
      'capacity', '54Wh',
      'type', 'Li-Ion',
      'express_charge', true
    ),
    'ports', ARRAY[
      'USB 3.2 Type-C',
      'USB 3.2 Type-A',
      'HDMI 1.4',
      'SD Card Reader',
      'Audio Jack'
    ],
    'features', ARRAY[
      'ExpressCharge',
      'Dell Mobile Connect',
      'HD Webcam',
      'Waves MaxxAudio Pro'
    ],
    'dimensions', jsonb_build_object(
      'height', '17.9mm',
      'width', '358.5mm',
      'depth', '235.5mm',
      'weight', '1.65kg'
    )
  )
);