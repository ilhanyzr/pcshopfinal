-- First delete existing products if they exist
DELETE FROM products WHERE name LIKE 'Turbox%';

-- Insert Turbox TX3617
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
  'Turbox TX3617',
  12999.99,
  'Ev ve ofis kullanımı için ideal masaüstü bilgisayar. Intel Core i7-2600 işlemci, 16GB RAM ve 512GB SSD ile günlük işleriniz için yeterli performans sunar. 23.8 inç monitör ile geniş çalışma alanı sağlar. Kompakt tasarımı ve beyaz renk seçeneği ile her ortama uyum sağlar.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1593640495253-23196b27a87f?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Core i7-2600 3.4GHz',
    '16GB DDR3 RAM',
    '512GB SSD',
    '23.8" Full HD Monitör',
    'Intel HD Graphics 2000',
    'USB 3.0',
    'FreeDOS'
  ],
  4.2,
  25,
  'home-office',
  'Turbox',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core i7-2600',
      'cores', 4,
      'threads', 8,
      'base_clock', '3.4GHz',
      'boost_clock', '3.8GHz',
      'cache', '8MB'
    ),
    'ram', jsonb_build_object(
      'size', '16GB',
      'type', 'DDR3',
      'speed', '1333MHz'
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '512GB',
        'type', 'SATA SSD',
        'read_speed', '550 MB/s',
        'write_speed', '520 MB/s'
      )
    ),
    'display', jsonb_build_object(
      'size', '23.8 inch',
      'resolution', '1920x1080',
      'panel', 'IPS',
      'refresh_rate', 60
    ),
    'graphics', jsonb_build_object(
      'model', 'Intel HD Graphics 2000',
      'type', 'Integrated',
      'memory', 'Shared'
    ),
    'connectivity', ARRAY[
      'USB 3.0',
      'USB 2.0',
      'VGA',
      'HDMI',
      'Audio Jack'
    ],
    'case', jsonb_build_object(
      'color', 'White',
      'form_factor', 'Mini Tower',
      'material', ARRAY['Plastic', 'Metal']
    )
  )
);

-- Insert Turbox TX5244
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
  'Turbox TX5244',
  9999.99,
  'Ekonomik ofis bilgisayarı, Intel Core i5-3470 işlemci ve 8GB RAM ile ofis uygulamalarında akıcı performans sunar. 256GB SSD depolama ile hızlı açılış ve dosya transferi. 19.5 inç monitör ile kompakt çalışma alanı. Güvenilir ve uygun fiyatlı ofis çözümü.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1593640495253-23196b27a87f?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Core i5-3470 3.2GHz',
    '8GB DDR3 RAM',
    '256GB SSD',
    '19.5" HD+ Monitör',
    'Intel HD Graphics 2500',
    'USB 3.0',
    'FreeDOS'
  ],
  4.0,
  30,
  'home-office',
  'Turbox',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core i5-3470',
      'cores', 4,
      'threads', 4,
      'base_clock', '3.2GHz',
      'boost_clock', '3.6GHz',
      'cache', '6MB'
    ),
    'ram', jsonb_build_object(
      'size', '8GB',
      'type', 'DDR3',
      'speed', '1333MHz'
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '256GB',
        'type', 'SATA SSD',
        'read_speed', '550 MB/s',
        'write_speed', '520 MB/s'
      )
    ),
    'display', jsonb_build_object(
      'size', '19.5 inch',
      'resolution', '1600x900',
      'panel', 'TN',
      'refresh_rate', 60
    ),
    'graphics', jsonb_build_object(
      'model', 'Intel HD Graphics 2500',
      'type', 'Integrated',
      'memory', 'Shared'
    ),
    'connectivity', ARRAY[
      'USB 3.0',
      'USB 2.0',
      'VGA',
      'HDMI',
      'Audio Jack'
    ],
    'case', jsonb_build_object(
      'color', 'Black',
      'form_factor', 'Mini Tower',
      'material', ARRAY['Plastic', 'Metal']
    )
  )
);