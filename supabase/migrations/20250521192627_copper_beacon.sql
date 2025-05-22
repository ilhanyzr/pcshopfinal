-- First delete existing product if it exists
DELETE FROM products WHERE name = 'IT Spring V1';

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
  'IT Spring V1',
  39999.99,
  'Orta segment gaming bilgisayarı, AMD Ryzen 5 7600 işlemci ve RTX 5070 ekran kartı ile 1440p oyun deneyimi sunar. 16GB DDR5 RAM ve 1TB NVMe SSD ile akıcı sistem performansı ve hızlı depolama sağlar. Özel tasarım kasa ve RGB aydınlatma ile göz alıcı bir görünüm sunar.',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Ryzen 5 7600 4.7GHz 6-Core',
    'ASUS GeForce RTX 5070 12GB GDDR7',
    '16GB DDR5-5200MHz RAM',
    '1TB PCIe Gen4 NVMe SSD',
    '750W 80+ Bronze PSU',
    'RGB Aydınlatmalı Kasa',
    'WiFi 6 + 1G LAN',
    'Windows 11 Home'
  ],
  4.7,
  10,
  'gaming-pc-mid',
  'IT Spring',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'AMD Ryzen 5 7600',
      'series', 'Ryzen 7000 Series',
      'family', 'Ryzen 5',
      'manufacturer', 'AMD',
      'socket', 'AM5',
      'base_clock', '3.8 GHz',
      'cores', 6,
      'max_boost_clock', '4.7 GHz',
      'threads', 12,
      'l3_cache', '32MB',
      'process', '5nm TSMC',
      'tdp', '105W'
    ),
    'gpu', jsonb_build_object(
      'model', 'ASUS GeForce RTX 5070',
      'vram', '12GB',
      'type', 'GDDR7',
      'boost_clock', '2.8 GHz',
      'memory_bus', '192-bit',
      'cuda_cores', 12288,
      'rt_cores', '4th Gen',
      'tensor_cores', '5th Gen',
      'power_consumption', '290W'
    ),
    'ram', jsonb_build_object(
      'size', '16GB',
      'speed', '5200MHz',
      'type', 'DDR5',
      'channels', 'Dual Channel',
      'timings', 'CL36-36-36-96',
      'voltage', '1.25V'
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '1TB',
        'type', 'NVMe PCIe Gen4 SSD',
        'read_speed', '7000 MB/s',
        'write_speed', '6000 MB/s',
        'form_factor', 'M.2 2280'
      )
    ),
    'motherboard', jsonb_build_object(
      'model', 'ASUS B650 Gaming',
      'chipset', 'AMD B650',
      'form_factor', 'ATX',
      'memory_slots', 4,
      'max_memory', '128GB',
      'pcie_slots', jsonb_build_object(
        'x16', 2,
        'x4', 1,
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
      'type', 'Air Cooling',
      'cpu_cooler', 'AMD Wraith',
      'case_fans', 4,
      'fan_size', '120mm',
      'rgb', true
    ),
    'psu', jsonb_build_object(
      'wattage', '750W',
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
      'fans_included', 4,
      'max_gpu_length', '380mm',
      'max_cpu_cooler', '160mm',
      'rgb', true,
      'dimensions', jsonb_build_object(
        'height', '450mm',
        'width', '210mm',
        'depth', '400mm'
      )
    )
  )
);