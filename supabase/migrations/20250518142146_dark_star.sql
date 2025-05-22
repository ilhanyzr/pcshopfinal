-- Add detailed technical specifications for products
UPDATE products 
SET technical_specs = jsonb_build_object(
  'cpu', jsonb_build_object(
    'model', 'Ryzen 9 9900X',
    'series', 'Ryzen 9000 Series',
    'family', 'Ryzen 9',
    'manufacturer', 'AMD',
    'socket', 'AM5',
    'base_clock', '4.4 GHz',
    'cores', 12,
    'max_boost_clock', '5.0 GHz',
    'threads', 24,
    'core_family', 'Ryzen',
    'l3_cache', '64MB',
    'process', '4nm',
    'tdp', '120W',
    'processor_type', 'Desktop Processors',
    'integrated_graphics', 'AMD Radeon Graphics',
    'graphics_frequency', '2100 MHz'
  )
)
WHERE category = 'cpu' AND brand = 'AMD';

-- Add detailed specifications for gaming PCs
UPDATE products 
SET technical_specs = jsonb_build_object(
  'cpu', jsonb_build_object(
    'model', 'i9-13900KS',
    'cores', 24,
    'threads', 32,
    'base_clock', '3.2GHz',
    'boost_clock', '6.0GHz',
    'cache', '36MB'
  ),
  'gpu', jsonb_build_object(
    'model', 'RTX 4090',
    'vram', '24GB',
    'type', 'GDDR6X',
    'boost_clock', '2.52GHz'
  ),
  'ram', jsonb_build_object(
    'size', '64GB',
    'speed', '6400MHz',
    'type', 'DDR5'
  ),
  'storage', jsonb_build_object(
    'primary', '4TB NVMe Gen4',
    'secondary', '4TB HDD'
  ),
  'motherboard', 'MSI MEG Z790 ACE',
  'cooling', '360mm AIO'
)
WHERE category LIKE 'gaming-pc%';

-- Update product descriptions with more detail
UPDATE products 
SET description = 
CASE 
  WHEN category = 'cpu' AND brand = 'AMD' THEN
    'AMD Ryzen 9 9900X, en son 4nm üretim teknolojisi ile üretilen yüksek performanslı bir masaüstü işlemcidir. 12 çekirdek ve 24 thread sayesinde hem oyun hem de içerik üretimi gibi yoğun işlemlerde üstün performans sunar. 4.4GHz temel frekans ve 5.0GHz''e kadar boost frekansı ile güçlü bir oyun deneyimi sağlar. 64MB L3 önbellek kapasitesi ile veri işleme hızını maksimuma çıkarır. Entegre AMD Radeon Graphics ile ekran kartı olmadan da temel görüntü işleme özelliklerini destekler. AM5 soket yapısı ile gelecek nesil anakartlarla uyumludur. PCIe 5.0 desteği ve DDR5 RAM uyumluluğu ile geleceğe hazır bir işlemcidir.'
  WHEN category LIKE 'gaming-pc%' THEN
    'En üst segment gaming PC, 4K ve ray tracing oyunlar için özel olarak tasarlandı. Intel Core i9-13900KS işlemci ve NVIDIA RTX 4090 ekran kartı ile maksimum oyun performansı sunar. 64GB DDR5-6400MHz RAM ile çoklu görevlerde mükemmel performans sağlar. 4TB NVMe PCIe Gen4 SSD ve 4TB HDD ile geniş depolama alanı sunar. MSI MEG Z790 ACE anakart ve 360mm sıvı soğutma sistemi ile yüksek performansı sürdürülebilir kılar. Wi-Fi 6E ve 2.5G LAN ile kesintisiz ağ bağlantısı sağlar. Windows 11 Pro işletim sistemi ile profesyonel kullanıma hazırdır.'
  ELSE description
END
WHERE category IN ('cpu', 'gaming-pc-high', 'gaming-pc-mid', 'gaming-pc-entry');