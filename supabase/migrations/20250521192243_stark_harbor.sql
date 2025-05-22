/*
  # Add ASUS ROG G700TF Ultra Gaming PC

  1. Changes
    - Add new high-end gaming PC product
    - Include detailed technical specifications
    - Match product specifications from itopya.com
*/

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
  'ASUS ROG G700TF Ultra',
  149999.99,
  'En üst segment ASUS ROG gaming bilgisayarı, Intel Core i9-285K işlemci ve RTX 5080 ekran kartı ile maksimum oyun performansı sunar. 64GB DDR5-7200MHz RAM ve 2TB NVMe SSD ile yüksek hızlı depolama ve çoklu görev performansı sağlar. ROG Liquid Cooling III 360mm sıvı soğutma sistemi ile üstün termal performans ve 850W 80+ Gold güç kaynağı ile güvenilir güç sunar. PCIe Gen5, WiFi 6E ve 2.5G LAN gibi en son teknolojileri destekler.',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-285K 6.2GHz 32-Core',
    'NVIDIA GeForce RTX 5080 16GB GDDR7',
    '64GB DDR5-7200MHz RGB RAM',
    '2TB PCIe Gen5 NVMe SSD',
    '850W 80+ Gold PSU',
    'ROG Liquid Cooling III 360mm',
    'WiFi 6E + 2.5G LAN',
    'ROG Strix Helios Kasa'
  ],
  5.0,
  3,
  'gaming-pc-high',
  'ASUS ROG',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Core i9-285K',
      'series', 'Intel Core 14th Gen',
      'family', 'Core i9',
      'manufacturer', 'Intel',
      'socket', 'LGA 1851',
      'base_clock', '3.8 GHz',
      'cores', 32,
      'max_boost_clock', '6.2 GHz',
      'threads', 64,
      'l3_cache', '48MB',
      'process', '7nm Intel',
      'tdp', '125W'
    ),
    'gpu', jsonb_build_object(
      'model', 'NVIDIA GeForce RTX 5080',
      'vram', '16GB',
      'type', 'GDDR7',
      'boost_clock', '3.0 GHz',
      'memory_bus', '512-bit',
      'cuda_cores', 18432,
      'rt_cores', '4th Gen',
      'tensor_cores', '5th Gen',
      'power_consumption', '400W'
    ),
    'ram', jsonb_build_object(
      'size', '64GB',
      'speed', '7200MHz',
      'type', 'DDR5',
      'channels', 'Quad Channel',
      'timings', 'CL30-38-38-96',
      'voltage', '1.4V'
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '2TB',
        'type', 'NVMe PCIe Gen5 SSD',
        'read_speed', '12000 MB/s',
        'write_speed', '11000 MB/s',
        'form_factor', 'M.2 2280'
      )
    ),
    'motherboard', jsonb_build_object(
      'model', 'ROG MAXIMUS Z890 EXTREME',
      'chipset', 'Intel Z890',
      'form_factor', 'E-ATX',
      'memory_slots', 4,
      'max_memory', '192GB',
      'pcie_slots', jsonb_build_object(
        'x16', 3,
        'x8', 1,
        'x4', 2,
        'x1', 2
      ),
      'features', ARRAY[
        'PCIe 5.0',
        'DDR5',
        'WiFi 6E',
        '2.5GbE LAN',
        'Thunderbolt 4'
      ]
    ),
    'cooling', jsonb_build_object(
      'type', 'Liquid Cooling',
      'radiator_size', '360mm',
      'fan_count', 3,
      'fan_size', '120mm',
      'pump_speed', '3600 RPM',
      'noise_level', '15-30 dBA'
    ),
    'psu', jsonb_build_object(
      'wattage', '850W',
      'efficiency', '80+ Gold',
      'modularity', 'Full Modular',
      'fan_size', '135mm',
      'protection', ARRAY[
        'OVP',
        'UVP',
        'OCP',
        'OPP',
        'SCP',
        'OTP'
      ]
    ),
    'case', jsonb_build_object(
      'model', 'ROG Strix Helios',
      'type', 'Full Tower',
      'material', ARRAY['Aluminum', 'Steel', 'Tempered Glass'],
      'fans_included', 4,
      'max_gpu_length', '450mm',
      'max_cpu_cooler', '190mm',
      'dimensions', jsonb_build_object(
        'height', '591mm',
        'width', '250mm',
        'depth', '565mm'
      )
    )
  )
);