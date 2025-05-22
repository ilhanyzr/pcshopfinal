-- First delete existing Monster products if they exist
DELETE FROM products WHERE brand = 'Monster';

-- Insert Monster Abra A5 V20.2
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
  'Monster Abra A5 V20.2',
  29999.99,
  'Monster Abra A5 V20.2, Intel Core i5-12450H işlemci ve RTX 4050 ekran kartı ile oyun ve günlük kullanım için ideal performans sunar. 16GB DDR5 RAM ve 512GB NVMe SSD ile hızlı sistem performansı. 15.6 inç 144Hz ekran ile akıcı oyun deneyimi.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1593642634315-48f5414c3ad9?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Core i5-12450H',
    'NVIDIA GeForce RTX 4050 6GB',
    '16GB DDR5 4800MHz RAM',
    '512GB NVMe SSD',
    '15.6" FHD 144Hz',
    'RGB Klavye',
    'Windows 11 Home'
  ],
  4.5,
  20,
  'gaming-laptop',
  'Monster',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core i5-12450H',
      'cores', 8,
      'threads', 12,
      'base_clock', '2.0GHz',
      'boost_clock', '4.4GHz',
      'cache', '12MB'
    ),
    'gpu', jsonb_build_object(
      'model', 'NVIDIA GeForce RTX 4050',
      'vram', '6GB',
      'type', 'GDDR6'
    ),
    'ram', jsonb_build_object(
      'size', '16GB',
      'speed', '4800MHz',
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
      'panel', 'IPS'
    ),
    'battery', jsonb_build_object(
      'capacity', '70Wh',
      'type', 'Li-Ion'
    ),
    'ports', ARRAY[
      'USB 3.2 Type-A',
      'USB Type-C',
      'HDMI',
      'RJ45',
      'Audio Jack'
    ]
  )
);

-- Insert Monster Tulpar T7 V26.2.5
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
  'Monster Tulpar T7 V26.2.5',
  59999.99,
  'Monster Tulpar T7 V26.2.5, Intel Core i9-13900HX işlemci ve RTX 4080 ekran kartı ile maksimum oyun performansı sunar. 32GB DDR5 RAM ve 2TB NVMe SSD ile üst düzey sistem performansı. 17.3 inç QHD 240Hz ekran ile ultra akıcı oyun deneyimi.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1593642634315-48f5414c3ad9?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Core i9-13900HX',
    'NVIDIA GeForce RTX 4080 12GB',
    '32GB DDR5 5600MHz RAM',
    '2TB NVMe SSD',
    '17.3" QHD 240Hz',
    'Per-Key RGB Klavye',
    'Windows 11 Pro'
  ],
  4.8,
  10,
  'gaming-laptop',
  'Monster',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core i9-13900HX',
      'cores', 24,
      'threads', 32,
      'base_clock', '2.2GHz',
      'boost_clock', '5.4GHz',
      'cache', '36MB'
    ),
    'gpu', jsonb_build_object(
      'model', 'NVIDIA GeForce RTX 4080',
      'vram', '12GB',
      'type', 'GDDR6X'
    ),
    'ram', jsonb_build_object(
      'size', '32GB',
      'speed', '5600MHz',
      'type', 'DDR5'
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '2TB',
        'type', 'NVMe SSD'
      )
    ),
    'display', jsonb_build_object(
      'size', '17.3 inch',
      'resolution', '2560x1440',
      'refresh_rate', 240,
      'panel', 'IPS'
    ),
    'battery', jsonb_build_object(
      'capacity', '90Wh',
      'type', 'Li-Ion'
    ),
    'ports', ARRAY[
      'Thunderbolt 4',
      'USB 3.2 Type-A',
      'USB Type-C',
      'HDMI 2.1',
      'RJ45',
      'Audio Jack'
    ]
  )
);

-- Insert Monster Tulpar T7 V26.2
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
  'Monster Tulpar T7 V26.2',
  49999.99,
  'Monster Tulpar T7 V26.2, Intel Core i7-13700HX işlemci ve RTX 4070 ekran kartı ile yüksek performanslı oyun deneyimi sunar. 16GB DDR5 RAM ve 1TB NVMe SSD ile hızlı sistem performansı. 17.3 inç QHD 165Hz ekran ile akıcı oyun deneyimi.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1593642634315-48f5414c3ad9?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Core i7-13700HX',
    'NVIDIA GeForce RTX 4070 8GB',
    '16GB DDR5 5200MHz RAM',
    '1TB NVMe SSD',
    '17.3" QHD 165Hz',
    'RGB Klavye',
    'Windows 11 Home'
  ],
  4.7,
  15,
  'gaming-laptop',
  'Monster',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core i7-13700HX',
      'cores', 16,
      'threads', 24,
      'base_clock', '2.1GHz',
      'boost_clock', '5.0GHz',
      'cache', '30MB'
    ),
    'gpu', jsonb_build_object(
      'model', 'NVIDIA GeForce RTX 4070',
      'vram', '8GB',
      'type', 'GDDR6'
    ),
    'ram', jsonb_build_object(
      'size', '16GB',
      'speed', '5200MHz',
      'type', 'DDR5'
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '1TB',
        'type', 'NVMe SSD'
      )
    ),
    'display', jsonb_build_object(
      'size', '17.3 inch',
      'resolution', '2560x1440',
      'refresh_rate', 165,
      'panel', 'IPS'
    ),
    'battery', jsonb_build_object(
      'capacity', '90Wh',
      'type', 'Li-Ion'
    ),
    'ports', ARRAY[
      'USB 3.2 Type-A',
      'USB Type-C',
      'HDMI 2.1',
      'RJ45',
      'Audio Jack'
    ]
  )
);

-- Insert Monster Semruk S6 V1.2.3
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
  'Monster Semruk S6 V1.2.3',
  89999.99,
  'Monster Semruk S6 V1.2.3, Intel Core i9-13980HX işlemci ve çift RTX 4090 ekran kartı ile ultra yüksek performans sunar. 64GB DDR5 RAM ve 4TB NVMe SSD ile profesyonel iş istasyonu performansı. 17.3 inç 4K 120Hz Mini LED ekran ile olağanüstü görüntü kalitesi.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1593642634315-48f5414c3ad9?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Core i9-13980HX',
    'Dual NVIDIA GeForce RTX 4090 16GB',
    '64GB DDR5 6400MHz RAM',
    '4TB NVMe SSD RAID',
    '17.3" 4K 120Hz Mini LED',
    'Per-Key RGB Klavye',
    'Windows 11 Pro'
  ],
  4.9,
  5,
  'gaming-laptop',
  'Monster',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core i9-13980HX',
      'cores', 24,
      'threads', 32,
      'base_clock', '2.2GHz',
      'boost_clock', '5.6GHz',
      'cache', '36MB'
    ),
    'gpu', jsonb_build_object(
      'model', 'Dual NVIDIA GeForce RTX 4090',
      'vram', '16GB',
      'type', 'GDDR6X'
    ),
    'ram', jsonb_build_object(
      'size', '64GB',
      'speed', '6400MHz',
      'type', 'DDR5'
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '4TB',
        'type', 'NVMe SSD RAID'
      )
    ),
    'display', jsonb_build_object(
      'size', '17.3 inch',
      'resolution', '3840x2160',
      'refresh_rate', 120,
      'panel', 'Mini LED',
      'hdr', true,
      'brightness', '1600 nits'
    ),
    'battery', jsonb_build_object(
      'capacity', '99.9Wh',
      'type', 'Li-Ion'
    ),
    'ports', ARRAY[
      'Thunderbolt 4',
      'USB 3.2 Type-A',
      'USB Type-C',
      'HDMI 2.1',
      'DisplayPort',
      'RJ45',
      'Audio Jack'
    ],
    'cooling', jsonb_build_object(
      'type', 'Advanced Cooling',
      'fans', 4,
      'heat_pipes', 8,
      'liquid_metal', true
    )
  )
);