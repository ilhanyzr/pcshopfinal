-- First delete existing products if they exist
DELETE FROM products WHERE name IN ('Intel Core i5-12400F', 'AMD Ryzen 7 7800X3D', 'AMD Ryzen 9 7950X');

-- Insert Intel Core i5-12400F
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
  'Intel Core i5-12400F',
  4399.99,
  'Intel Core i5-12400F işlemci, 6 çekirdek ve 12 thread ile oyun ve günlük kullanım için ideal performans sunar. 4.4GHz boost hızı ve 18MB önbellek ile hızlı işlem gücü. LGA1700 soket ile uyumlu anakartlarda kullanılabilir.',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '6 Çekirdek 12 Thread',
    '4.4GHz Max Turbo',
    '18MB Önbellek',
    'LGA1700 Soket',
    '65W TDP',
    'PCIe 5.0 Desteği'
  ],
  4.7,
  50,
  'cpu',
  'Intel',
  jsonb_build_object(
    'model', 'Intel Core i5-12400F',
    'cores', 6,
    'threads', 12,
    'base_clock', '2.5GHz',
    'boost_clock', '4.4GHz',
    'cache', '18MB'
  )
);

-- Insert AMD Ryzen 7 7800X3D
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
  'AMD Ryzen 7 7800X3D',
  13999.99,
  'AMD Ryzen 7 7800X3D işlemci, 8 çekirdek, 16 thread ve 104MB toplam önbellek ile oyunlarda maksimum performans sunar. 3D V-Cache teknolojisi ile oyun performansında çığır açar. 5.0GHz boost hızı ve AM5 soket desteği ile geleceğe hazır.',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '8 Çekirdek 16 Thread',
    '5.0GHz Max Boost',
    '104MB Toplam Önbellek',
    'AM5 Soket',
    '120W TDP',
    '3D V-Cache Teknolojisi'
  ],
  4.9,
  30,
  'cpu',
  'AMD',
  jsonb_build_object(
    'model', 'AMD Ryzen 7 7800X3D',
    'cores', 8,
    'threads', 16,
    'base_clock', '4.2GHz',
    'boost_clock', '5.0GHz',
    'cache', '104MB'
  )
);

-- Insert AMD Ryzen 9 7950X
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
  'AMD Ryzen 9 7950X',
  19999.99,
  'AMD Ryzen 9 7950X işlemci, 16 çekirdek ve 32 thread ile profesyonel iş istasyonu performansı sunar. 5.7GHz boost hızı ve 80MB önbellek ile maksimum çoklu görev performansı. AM5 soket ve PCIe 5.0 desteği ile geleceğe hazır.',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '16 Çekirdek 32 Thread',
    '5.7GHz Max Boost',
    '80MB Toplam Önbellek',
    'AM5 Soket',
    '170W TDP',
    'PCIe 5.0 Desteği'
  ],
  4.8,
  20,
  'cpu',
  'AMD',
  jsonb_build_object(
    'model', 'AMD Ryzen 9 7950X',
    'cores', 16,
    'threads', 32,
    'base_clock', '4.5GHz',
    'boost_clock', '5.7GHz',
    'cache', '80MB'
  )
);