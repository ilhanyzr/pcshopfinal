-- First delete existing product if it exists
DELETE FROM products WHERE name = 'ASUS ROG Strix G16CHR';

-- Insert new product
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
  'ASUS ROG Strix G16CHR',
  69999.99,
  'Güçlü gaming bilgisayarı, Intel Core i7-14700F işlemci ve RTX 4070 ekran kartı ile yüksek performanslı oyun deneyimi sunar. 32GB DDR5 RAM ve 1TB NVMe SSD ile akıcı sistem performansı ve hızlı depolama sağlar. 240mm sıvı soğutma sistemi ile optimum sıcaklık kontrolü ve 700W 80+ Bronze güç kaynağı ile güvenilir güç sunar. ROG Strix serisi tasarımı ve RGB aydınlatma ile göz alıcı bir görünüm sunar.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1587831991559-20c1ba52a5df?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1593640495253-23196b27a87f?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Core i7-14700F 5.5GHz 20-Core',
    'NVIDIA GeForce RTX 4070 12GB GDDR6X',
    '32GB DDR5-5200MHz RAM',
    '1TB PCIe Gen4 NVMe SSD',
    '700W 80+ Bronze PSU',
    '240mm Sıvı Soğutma',
    'WiFi 6 + 2.5G LAN',
    'Windows 11 Home'
  ],
  4.8,
  15,
  'gaming-pc-mid',
  'ASUS ROG',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core i7-14700F',
      'series', 'Intel Core 14th Gen',
      'family', 'Core i7',
      'manufacturer', 'Intel',
      'socket', 'LGA 1700',
      'base_clock', '3.4 GHz',
      'cores', 20,
      'max_boost_clock', '5.5 GHz',
      'threads', 28,
      'l3_cache', '33MB',
      'process', '10nm Intel 7',
      'tdp', '125W'
    ),
    'gpu', jsonb_build_object(
      'model', 'NVIDIA GeForce RTX 4070',
      'vram', '12GB',
      'type', 'GDDR6X',
      'boost_clock', '2.48 GHz',
      'memory_bus', '192-bit',
      'cuda_cores', 7680,
      'rt_cores', '3rd Gen',
      'tensor_cores', '4th Gen',
      'power_consumption', '200W'
    ),
    'ram', jsonb_build_object(
      'size', '32GB',
      'speed', '5200MHz',
      'type', 'DDR5',
      'channels', 'Dual Channel',
      'timings', 'CL38-38-38-98',
      'voltage', '1.25V'
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '1TB',
        'type', 'NVMe PCIe Gen4 SSD',
        'read_speed', '7000 MB/s',
        'write_speed', '5500 MB/s',
        'form_factor', 'M.2 2280'
      )
    ),
    'motherboard', jsonb_build_object(
      'model', 'ROG STRIX B760-G GAMING WIFI',
      'chipset', 'Intel B760',
      'form_factor', 'ATX',
      'memory_slots', 4,
      'max_memory', '128GB',
      'pcie_slots', jsonb_build_object(
        'x16', 1,
        'x4', 2,
        'x1', 2
      ),
      'features', ARRAY[
        'PCIe 4.0',
        'DDR5',
        'WiFi 6',
        '2.5GbE LAN',
        'RGB Headers'
      ]
    ),
    'cooling', jsonb_build_object(
      'type', 'Liquid Cooling',
      'radiator_size', '240mm',
      'fan_count', 2,
      'fan_size', '120mm',
      'pump_speed', '2800 RPM',
      'noise_level', '20-35 dBA'
    ),
    'psu', jsonb_build_object(
      'wattage', '700W',
      'efficiency', '80+ Bronze',
      'modularity', 'Semi Modular',
      'fan_size', '120mm',
      'protection', ARRAY[
        'OVP',
        'UVP',
        'OCP',
        'SCP'
      ]
    ),
    'case', jsonb_build_object(
      'type', 'Mid Tower',
      'material', ARRAY['Steel', 'Tempered Glass'],
      'fans_included', 3,
      'max_gpu_length', '355mm',
      'max_cpu_cooler', '170mm',
      'rgb', true,
      'dimensions', jsonb_build_object(
        'height', '465mm',
        'width', '215mm',
        'depth', '410mm'
      )
    )
  )
);