-- First delete existing product if it exists
DELETE FROM products WHERE name = 'Dell Precision T7960';

-- Insert new product with multiple images
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
  'Dell Precision T7960',
  199999.99,
  'Dell Precision T7960, profesyonel iş istasyonu. Intel Xeon W7-3465X işlemci, 64GB DDR5 ECC RAM ve 512GB NVMe SSD ile maksimum performans sunar. NVIDIA RTX A4000 ekran kartı ile profesyonel grafik uygulamalarında üstün performans. Çift kanal DDR5 bellek desteği ve PCIe Gen 4 teknolojisi ile geleceğe hazır. Dell Reliable Memory Technology Pro ve Dell Optimizer for Precision ile güvenilir ve optimize edilmiş çalışma deneyimi.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1547082299-de196ea013d6?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1547082298-11a3c07b62e5?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1547082299-5a35ae78f452?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Xeon W7-3465X 3.8GHz 16-Core',
    'NVIDIA RTX A4000 16GB GDDR6',
    '64GB DDR5 ECC RAM',
    '512GB NVMe PCIe Gen4 SSD',
    '1400W 80+ Platinum PSU',
    'Dell Reliable Memory Pro',
    'Windows 11 Pro for Workstations',
    'Dell Optimizer for Precision'
  ],
  4.9,
  5,
  'workstation',
  'Dell',
  jsonb_build_object(
    'cpu', jsonb_build_object(
      'model', 'Intel Xeon W7-3465X',
      'series', 'Intel Xeon W-3000',
      'family', 'Xeon W7',
      'manufacturer', 'Intel',
      'socket', 'LGA 4677',
      'base_clock', '3.8 GHz',
      'cores', 16,
      'max_boost_clock', '4.8 GHz',
      'threads', 32,
      'l3_cache', '45MB',
      'process', '10nm Intel 7',
      'tdp', '350W'
    ),
    'gpu', jsonb_build_object(
      'model', 'NVIDIA RTX A4000',
      'vram', '16GB',
      'type', 'GDDR6',
      'memory_bus', '256-bit',
      'cuda_cores', 6144,
      'rt_cores', '2nd Gen',
      'tensor_cores', '3rd Gen',
      'power_consumption', '140W'
    ),
    'ram', jsonb_build_object(
      'size', '64GB',
      'speed', '4800MHz',
      'type', 'DDR5 ECC',
      'channels', 'Eight Channel',
      'timings', 'CL40-39-39-76',
      'voltage', '1.1V',
      'ecc', true
    ),
    'storage', jsonb_build_object(
      'primary', jsonb_build_object(
        'capacity', '512GB',
        'type', 'NVMe PCIe Gen4 SSD',
        'read_speed', '7000 MB/s',
        'write_speed', '5300 MB/s',
        'form_factor', 'M.2 2280'
      )
    ),
    'motherboard', jsonb_build_object(
      'model', 'Dell Proprietary WX690',
      'chipset', 'Intel W690',
      'form_factor', 'EEB',
      'memory_slots', 8,
      'max_memory', '2TB',
      'pcie_slots', jsonb_build_object(
        'x16', 4,
        'x8', 2,
        'x4', 1
      ),
      'features', ARRAY[
        'PCIe 4.0',
        'DDR5 ECC',
        'TPM 2.0',
        'IPMI',
        'Remote Management'
      ]
    ),
    'cooling', jsonb_build_object(
      'type', 'Active Thermal Management',
      'fan_count', 4,
      'fan_size', '120mm',
      'multi_zone', true,
      'noise_level', '25-45 dBA'
    ),
    'psu', jsonb_build_object(
      'wattage', '1400W',
      'efficiency', '80+ Platinum',
      'modularity', 'Fixed',
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
      'type', 'Tower Workstation',
      'material', ARRAY['Steel', 'Aluminum'],
      'fans_included', 4,
      'max_gpu_length', '400mm',
      'max_cpu_cooler', '185mm',
      'tool_less', true,
      'security', ARRAY[
        'Chassis Intrusion Switch',
        'Padlock Ring',
        'Kensington Lock'
      ],
      'dimensions', jsonb_build_object(
        'height', '433mm',
        'width', '218mm',
        'depth', '566mm'
      )
    ),
    'certifications', ARRAY[
      'ISV Certified',
      'Energy Star',
      'EPEAT Gold',
      'TCO Certified',
      'MIL-STD 810G'
    ],
    'management', jsonb_build_object(
      'dell_optimizer', true,
      'reliable_memory_pro', true,
      'remote_management', true,
      'security_features', ARRAY[
        'TPM 2.0',
        'Secure Boot',
        'System Guard'
      ]
    )
  )
);