/*
  # Add detailed technical specifications for all products

  1. Changes
    - Update all products with detailed technical specifications
    - Add comprehensive product descriptions
    - Include detailed component information
*/

-- Update Gaming PCs with detailed specs
UPDATE products 
SET technical_specs = jsonb_build_object(
  'cpu', jsonb_build_object(
    'model', 'Intel Core i9-13900KS',
    'series', 'Intel Core 13th Gen',
    'family', 'Core i9',
    'manufacturer', 'Intel',
    'socket', 'LGA 1700',
    'base_clock', '3.2 GHz',
    'cores', 24,
    'max_boost_clock', '6.0 GHz',
    'threads', 32,
    'l3_cache', '36MB',
    'process', '10nm Intel 7',
    'tdp', '150W'
  ),
  'gpu', jsonb_build_object(
    'model', 'NVIDIA GeForce RTX 4090',
    'vram', '24GB',
    'type', 'GDDR6X',
    'boost_clock', '2.52 GHz',
    'memory_bus', '384-bit',
    'cuda_cores', 16384,
    'rt_cores', '3rd Gen',
    'tensor_cores', '4th Gen',
    'power_consumption', '450W'
  ),
  'ram', jsonb_build_object(
    'size', '64GB',
    'speed', '6400MHz',
    'type', 'DDR5',
    'channels', 'Dual Channel',
    'timings', 'CL32-39-39-102',
    'voltage', '1.4V'
  ),
  'storage', jsonb_build_object(
    'primary', jsonb_build_object(
      'capacity', '4TB',
      'type', 'NVMe PCIe Gen4 SSD',
      'read_speed', '7000 MB/s',
      'write_speed', '6600 MB/s',
      'form_factor', 'M.2 2280'
    ),
    'secondary', jsonb_build_object(
      'capacity', '4TB',
      'type', 'SATA III SSD',
      'read_speed', '560 MB/s',
      'write_speed', '530 MB/s',
      'form_factor', '2.5 inch'
    )
  ),
  'motherboard', jsonb_build_object(
    'model', 'MSI MEG Z790 ACE',
    'chipset', 'Intel Z790',
    'form_factor', 'ATX',
    'memory_slots', 4,
    'max_memory', '128GB',
    'pcie_slots', jsonb_build_object(
      'x16', 2,
      'x8', 1,
      'x4', 1,
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
    'pump_speed', '2800 RPM',
    'noise_level', '20-35 dBA'
  ),
  'psu', jsonb_build_object(
    'wattage', '1300W',
    'efficiency', '80+ Titanium',
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
    'model', 'MSI MPG GUNGNIR 110R',
    'type', 'Mid Tower',
    'material', ARRAY['Steel', 'Tempered Glass'],
    'fans_included', 4,
    'max_gpu_length', '380mm',
    'max_cpu_cooler', '170mm',
    'dimensions', jsonb_build_object(
      'height', '495mm',
      'width', '215mm',
      'depth', '431mm'
    )
  )
)
WHERE category = 'gaming-pc-high';

-- Update CPUs with detailed specs
UPDATE products 
SET technical_specs = jsonb_build_object(
  'model', 'AMD Ryzen 9 7950X3D',
  'series', 'Ryzen 7000 Series',
  'family', 'Ryzen 9',
  'manufacturer', 'AMD',
  'socket', 'AM5',
  'base_clock', '4.2 GHz',
  'max_boost_clock', '5.7 GHz',
  'cores', 16,
  'threads', 32,
  'l1_cache', '1MB',
  'l2_cache', '16MB',
  'l3_cache', '128MB',
  'v_cache', '64MB 3D V-Cache',
  'process', '5nm TSMC',
  'tdp', '120W',
  'memory_support', jsonb_build_object(
    'type', 'DDR5',
    'channels', 2,
    'max_speed', '5200MHz',
    'max_capacity', '128GB'
  ),
  'features', ARRAY[
    'AMD 3D V-Cache',
    'PCIe 5.0',
    'AMD EXPO',
    'Precision Boost 2',
    'Precision Boost Overdrive'
  ],
  'integrated_graphics', jsonb_build_object(
    'model', 'AMD Radeon Graphics',
    'cores', 2,
    'frequency', '2200MHz',
    'features', ARRAY[
      'DirectX 12',
      'Vulkan',
      'FreeSync'
    ]
  )
)
WHERE category = 'cpu' AND brand = 'AMD';

-- Update GPUs with detailed specs
UPDATE products 
SET technical_specs = jsonb_build_object(
  'model', 'NVIDIA GeForce RTX 4090',
  'architecture', 'Ada Lovelace',
  'manufacturing_process', '4nm TSMC',
  'cuda_cores', 16384,
  'rt_cores', '3rd Generation',
  'tensor_cores', '4th Generation',
  'base_clock', '2.23 GHz',
  'boost_clock', '2.52 GHz',
  'memory', jsonb_build_object(
    'size', '24GB',
    'type', 'GDDR6X',
    'speed', '21 Gbps',
    'bus_width', '384-bit',
    'bandwidth', '1008 GB/s'
  ),
  'power', jsonb_build_object(
    'tdp', '450W',
    'recommended_psu', '850W',
    'power_connectors', '1x 16-pin'
  ),
  'display_outputs', jsonb_build_object(
    'hdmi', jsonb_build_object(
      'version', '2.1',
      'max_resolution', '4K@240Hz'
    ),
    'displayport', jsonb_build_object(
      'version', '1.4a',
      'max_resolution', '8K@60Hz'
    )
  ),
  'features', ARRAY[
    'DLSS 3',
    'Ray Tracing',
    'NVIDIA Reflex',
    'NVIDIA Broadcast',
    'G-SYNC'
  ],
  'cooling', jsonb_build_object(
    'type', 'Triple Fan',
    'heatsink', 'Vapor Chamber',
    'fan_size', '100mm',
    'zero_rpm_mode', true
  ),
  'dimensions', jsonb_build_object(
    'length', '304mm',
    'height', '137mm',
    'width', '61mm'
  )
)
WHERE category = 'gpu' AND brand = 'NVIDIA';

-- Update Storage devices with detailed specs
UPDATE products 
SET technical_specs = jsonb_build_object(
  'type', 'NVMe SSD',
  'interface', 'PCIe 4.0 x4',
  'form_factor', 'M.2 2280',
  'controller', 'Phison E18',
  'nand_type', '176-layer Micron TLC',
  'performance', jsonb_build_object(
    'sequential_read', '7300 MB/s',
    'sequential_write', '6900 MB/s',
    'random_read_iops', '1000000',
    'random_write_iops', '1000000',
    'latency', '0.03ms'
  ),
  'endurance', jsonb_build_object(
    'tbw', '1400TB',
    'mtbf', '1.6M hours',
    'warranty', '5 years'
  ),
  'features', ARRAY[
    'TRIM',
    'S.M.A.R.T.',
    'LDPC ECC',
    'Dynamic SLC Cache',
    'AES 256-bit Encryption'
  ],
  'power', jsonb_build_object(
    'active', '6.5W',
    'idle', '0.05W',
    'sleep', '0.005W'
  )
)
WHERE category = 'storage' AND name LIKE '%NVMe%';

-- Update Monitors with detailed specs
UPDATE products 
SET technical_specs = jsonb_build_object(
  'panel', jsonb_build_object(
    'type', 'Mini LED',
    'size', '32 inches',
    'resolution', '3840x2160',
    'refresh_rate', 144,
    'response_time', '1ms GtG',
    'contrast_ratio', jsonb_build_object(
      'static', '1000:1',
      'dynamic', '1000000:1'
    ),
    'brightness', jsonb_build_object(
      'typical', '400 nits',
      'hdr_peak', '1400 nits'
    ),
    'viewing_angles', jsonb_build_object(
      'horizontal', 178,
      'vertical', 178
    )
  ),
  'color', jsonb_build_object(
    'gamut', jsonb_build_object(
      'srgb', '100%',
      'adobe_rgb', '99%',
      'dci_p3', '98%'
    ),
    'depth', '10-bit (1.07B colors)',
    'calibration', jsonb_build_object(
      'delta_e', '<2',
      'factory_calibrated', true
    )
  ),
  'hdr', jsonb_build_object(
    'format', ARRAY['HDR10', 'HLG'],
    'certification', 'VESA DisplayHDR 1400',
    'local_dimming_zones', 1152
  ),
  'connectivity', jsonb_build_object(
    'displayport', jsonb_build_object(
      'version', '1.4',
      'ports', 1
    ),
    'hdmi', jsonb_build_object(
      'version', '2.1',
      'ports', 2
    ),
    'usb', jsonb_build_object(
      'hub', true,
      'ports', 4,
      'version', '3.2'
    )
  ),
  'features', ARRAY[
    'G-SYNC Ultimate',
    'FreeSync Premium Pro',
    'KVM Switch',
    'PiP/PbP',
    'Blue Light Filter'
  ],
  'ergonomics', jsonb_build_object(
    'height_adjustment', '120mm',
    'tilt', '-5° to 20°',
    'swivel', '-30° to 30°',
    'pivot', '90°',
    'vesa_mount', '100x100mm'
  ),
  'power', jsonb_build_object(
    'consumption', jsonb_build_object(
      'typical', '55W',
      'maximum', '180W',
      'standby', '<0.5W'
    ),
    'psu', 'Internal'
  )
)
WHERE category = 'monitor' AND price > 20000;

-- Update product descriptions with more detail
UPDATE products 
SET description = CASE 
  WHEN category = 'gaming-pc-high' THEN
    'Ultra premium gaming sistemi, en zorlu oyun ve içerik üretimi ihtiyaçlarınız için tasarlandı. Intel Core i9-13900KS işlemcisi 6.0GHz''e varan boost hızı ve 24 çekirdeği ile maksimum performans sunar. NVIDIA RTX 4090 ekran kartı, 24GB GDDR6X bellek ve gelişmiş ray tracing özellikleriyle en yüksek grafik ayarlarında bile akıcı oyun deneyimi sağlar. 64GB DDR5-6400MHz RAM ile çoklu görev performansında sınır tanımaz. 4TB NVMe PCIe Gen4 SSD ve 4TB SATA SSD ile devasa depolama alanı ve yüksek veri transfer hızları sunar. MSI MEG Z790 ACE anakart, PCIe 5.0, WiFi 6E ve Thunderbolt 4 gibi en son teknolojileri destekler. 360mm sıvı soğutma sistemi ile yüksek performansı sürdürülebilir kılar. 1300W 80+ Titanium güç kaynağı ile güvenilir ve verimli güç sağlar.'
  WHEN category = 'cpu' AND brand = 'AMD' THEN
    'AMD''nin en güçlü masaüstü işlemcisi, 3D V-Cache teknolojisi ile oyun performansında çığır açıyor. 16 çekirdek ve 32 thread ile multi-tasking performansında rakipsiz. 5.7GHz''e varan boost hızı ve toplam 144MB önbellek ile gecikmeleri minimuma indirir. AM5 soket yapısı ile gelecek nesil anakartlarla uyumludur. DDR5 bellek desteği ve PCIe 5.0 ile geleceğe hazır bir işlemci. 120W TDP değeri ile verimli güç tüketimi sağlar. Entegre Radeon grafikleri ile ekran kartı olmadan da temel görüntü işleme özelliklerini destekler.'
  WHEN category = 'gpu' AND brand = 'NVIDIA' THEN
    'NVIDIA''nın amiral gemisi ekran kartı, Ada Lovelace mimarisi ile oyun ve yapay zeka performansında devrim yaratıyor. 16384 CUDA çekirdeği, 24GB GDDR6X bellek ve 1008 GB/s bant genişliği ile en zorlu görevlerin üstesinden gelir. DLSS 3 teknolojisi ile FPS değerlerini katlayarak artırır. 3. nesil RT çekirdekleri ile gerçekçi ışın izleme efektleri sunar. 4. nesil Tensor çekirdekleri yapay zeka işlemlerinde maksimum performans sağlar. Gelişmiş soğutma sistemi ile yüksek performansı sürdürülebilir kılar.'
  WHEN category = 'monitor' THEN
    'Professional grade Mini LED monitör, içerik üreticileri ve profesyoneller için tasarlandı. 4K çözünürlük ve 144Hz yenileme hızı ile keskin ve akıcı görüntü sunar. 1400 nit tepe parlaklığı ve 1152 lokal karartma bölgesi ile HDR içeriklerde olağanüstü kontrast ve parlaklık seviyesi sağlar. %98 DCI-P3 renk gamı ve fabrika kalibrasyonu ile hassas renk doğruluğu sunar. G-SYNC Ultimate ve FreeSync Premium Pro desteği ile oyunlarda tearing sorununu ortadan kaldırır. KVM switch özelliği ile birden fazla cihazı tek set klavye ve mouse ile kontrol edebilirsiniz.'
  ELSE description
END
WHERE category IN ('gaming-pc-high', 'cpu', 'gpu', 'monitor');