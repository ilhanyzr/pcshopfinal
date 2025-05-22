-- First delete existing motherboard products if they exist
DELETE FROM products WHERE category = 'motherboard';

-- Insert ASUS ROG MAXIMUS Z790 HERO
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
  'ASUS ROG MAXIMUS Z790 HERO',
  14999.99,
  'ASUS ROG MAXIMUS Z790 HERO, Intel 13. ve 14. nesil işlemciler için üst segment anakart. PCIe 5.0, DDR5 ve Thunderbolt 4 desteği ile geleceğe hazır. ROG SupremeFX ses sistemi ve AI Overclocking özelliği ile premium gaming deneyimi.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel Z790 Chipset',
    'DDR5-7800+ (OC)',
    'PCIe 5.0 x16',
    'Thunderbolt 4',
    'WiFi 6E',
    'ROG SupremeFX ALC4082'
  ],
  4.9,
  10,
  'motherboard',
  'ASUS ROG',
  jsonb_build_object(
    'socket', 'LGA 1700',
    'chipset', 'Intel Z790',
    'form_factor', 'ATX',
    'memory', jsonb_build_object(
      'type', 'DDR5',
      'slots', 4,
      'max_capacity', '128GB',
      'max_speed', '7800MHz (OC)',
      'channels', 'Dual Channel'
    ),
    'expansion_slots', jsonb_build_object(
      'pcie_5_x16', 2,
      'pcie_4_x16', 1,
      'pcie_3_x1', 1,
      'm2_slots', jsonb_build_array(
        'PCIe 5.0 x4',
        'PCIe 4.0 x4',
        'PCIe 4.0 x4',
        'PCIe 4.0 x4'
      )
    ),
    'storage', jsonb_build_object(
      'sata_6gb', 6,
      'nvme_support', true,
      'raid_support', ARRAY['0', '1', '5', '10']
    ),
    'networking', jsonb_build_object(
      'lan', '2.5 Gigabit',
      'wifi', 'WiFi 6E',
      'bluetooth', '5.3'
    ),
    'audio', jsonb_build_object(
      'codec', 'ROG SupremeFX ALC4082',
      'channels', '7.1',
      'features', ARRAY[
        'ESS SABRE9018Q2C DAC',
        'Sonic Studio III',
        'DTS Sound Unbound'
      ]
    ),
    'usb_ports', jsonb_build_object(
      'thunderbolt_4', 2,
      'usb_3_2_gen2x2', 2,
      'usb_3_2_gen2', 6,
      'usb_3_2_gen1', 4,
      'usb_2_0', 4
    ),
    'features', ARRAY[
      'AI Overclocking',
      'ASUS OptiMem III',
      'Aura Sync RGB',
      'Q-Design',
      'BIOS Flashback',
      'Clear CMOS button'
    ],
    'power', jsonb_build_object(
      'phases', '20+1',
      'connectors', ARRAY[
        '24-pin ATX',
        '8+8 pin CPU',
        '6 pin PCIe'
      ]
    ),
    'cooling', jsonb_build_object(
      'fan_headers', 8,
      'aio_headers', 1,
      'pump_headers', 1,
      'temperature_sensors', 3
    )
  )
);

-- Insert MSI MPG B650 CARBON WIFI
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
  'MSI MPG B650 CARBON WIFI',
  9999.99,
  'MSI MPG B650 CARBON WIFI, AMD Ryzen 7000 serisi işlemciler için orta-üst segment anakart. PCIe 5.0 ve DDR5 desteği ile yüksek performans. Lightning Gen 5 M.2 ve 2.5G LAN ile hızlı veri transferi.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'AMD B650 Chipset',
    'DDR5-6600+ (OC)',
    'PCIe 5.0 x16',
    'Lightning Gen 5 M.2',
    'WiFi 6E',
    'Audio Boost 5'
  ],
  4.7,
  15,
  'motherboard',
  'MSI',
  jsonb_build_object(
    'socket', 'AM5',
    'chipset', 'AMD B650',
    'form_factor', 'ATX',
    'memory', jsonb_build_object(
      'type', 'DDR5',
      'slots', 4,
      'max_capacity', '128GB',
      'max_speed', '6600MHz (OC)',
      'channels', 'Dual Channel'
    ),
    'expansion_slots', jsonb_build_object(
      'pcie_5_x16', 1,
      'pcie_4_x16', 1,
      'pcie_3_x1', 2,
      'm2_slots', jsonb_build_array(
        'PCIe 5.0 x4',
        'PCIe 4.0 x4',
        'PCIe 4.0 x4'
      )
    ),
    'storage', jsonb_build_object(
      'sata_6gb', 6,
      'nvme_support', true,
      'raid_support', ARRAY['0', '1', '10']
    ),
    'networking', jsonb_build_object(
      'lan', '2.5 Gigabit',
      'wifi', 'WiFi 6E',
      'bluetooth', '5.3'
    ),
    'audio', jsonb_build_object(
      'codec', 'Realtek ALC4080',
      'channels', '7.1',
      'features', ARRAY[
        'Audio Boost 5',
        'Nahimic Audio',
        'Sound Tune'
      ]
    ),
    'usb_ports', jsonb_build_object(
      'usb_3_2_gen2x2', 1,
      'usb_3_2_gen2', 4,
      'usb_3_2_gen1', 4,
      'usb_2_0', 6
    ),
    'features', ARRAY[
      'Memory Boost',
      'MSI Center',
      'Mystic Light',
      'Flash BIOS Button',
      'EZ Debug LED'
    ],
    'power', jsonb_build_object(
      'phases', '14+2+1',
      'connectors', ARRAY[
        '24-pin ATX',
        '8+4 pin CPU'
      ]
    ),
    'cooling', jsonb_build_object(
      'fan_headers', 6,
      'pump_headers', 1,
      'temperature_sensors', 2
    )
  )
);

-- Insert GIGABYTE B760 GAMING X
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
  'GIGABYTE B760 GAMING X',
  5999.99,
  'GIGABYTE B760 GAMING X, Intel 13. ve 14. nesil işlemciler için uygun fiyatlı gaming anakart. DDR5 desteği ve PCIe 4.0 ile dengeli performans. Q-Flash Plus ve 2.5GbE LAN ile kullanıcı dostu özellikler.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'Intel B760 Chipset',
    'DDR5-6000 (OC)',
    'PCIe 4.0 x16',
    'M.2 NVMe',
    '2.5GbE LAN',
    'HD Audio'
  ],
  4.6,
  25,
  'motherboard',
  'GIGABYTE',
  jsonb_build_object(
    'socket', 'LGA 1700',
    'chipset', 'Intel B760',
    'form_factor', 'ATX',
    'memory', jsonb_build_object(
      'type', 'DDR5',
      'slots', 4,
      'max_capacity', '128GB',
      'max_speed', '6000MHz (OC)',
      'channels', 'Dual Channel'
    ),
    'expansion_slots', jsonb_build_object(
      'pcie_4_x16', 1,
      'pcie_3_x16', 1,
      'pcie_3_x1', 2,
      'm2_slots', jsonb_build_array(
        'PCIe 4.0 x4',
        'PCIe 4.0 x4',
        'PCIe 3.0 x4'
      )
    ),
    'storage', jsonb_build_object(
      'sata_6gb', 4,
      'nvme_support', true,
      'raid_support', ARRAY['0', '1', '10']
    ),
    'networking', jsonb_build_object(
      'lan', '2.5 Gigabit'
    ),
    'audio', jsonb_build_object(
      'codec', 'Realtek ALC897',
      'channels', '7.1'
    ),
    'usb_ports', jsonb_build_object(
      'usb_3_2_gen2', 2,
      'usb_3_2_gen1', 4,
      'usb_2_0', 6
    ),
    'features', ARRAY[
      'Q-Flash Plus',
      'RGB Fusion 2.0',
      'Smart Fan 6',
      'DualBIOS'
    ],
    'power', jsonb_build_object(
      'phases', '8+1+1',
      'connectors', ARRAY[
        '24-pin ATX',
        '8 pin CPU'
      ]
    ),
    'cooling', jsonb_build_object(
      'fan_headers', 5,
      'temperature_sensors', 2
    )
  )
);

-- Insert ASRock B650M PRO RS
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
  'ASRock B650M PRO RS',
  4999.99,
  'ASRock B650M PRO RS, AMD Ryzen 7000 serisi işlemciler için ekonomik Micro-ATX anakart. DDR5 desteği ve PCIe 4.0 ile temel gaming performansı. Steel Slot koruması ve Dr. MOS güç tasarımı ile dayanıklılık.',
  jsonb_build_array(
    'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
    'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920'
  ),
  ARRAY[
    'AMD B650 Chipset',
    'DDR5-5200',
    'PCIe 4.0 x16',
    'M.2 NVMe',
    'Dragon 2.5G LAN',
    'Nahimic Audio'
  ],
  4.5,
  30,
  'motherboard',
  'ASRock',
  jsonb_build_object(
    'socket', 'AM5',
    'chipset', 'AMD B650',
    'form_factor', 'Micro-ATX',
    'memory', jsonb_build_object(
      'type', 'DDR5',
      'slots', 4,
      'max_capacity', '128GB',
      'max_speed', '5200MHz',
      'channels', 'Dual Channel'
    ),
    'expansion_slots', jsonb_build_object(
      'pcie_4_x16', 1,
      'pcie_3_x16', 1,
      'pcie_3_x1', 1,
      'm2_slots', jsonb_build_array(
        'PCIe 4.0 x4',
        'PCIe 3.0 x4'
      )
    ),
    'storage', jsonb_build_object(
      'sata_6gb', 4,
      'nvme_support', true,
      'raid_support', ARRAY['0', '1', '10']
    ),
    'networking', jsonb_build_object(
      'lan', '2.5 Gigabit'
    ),
    'audio', jsonb_build_object(
      'codec', 'Realtek ALC897',
      'channels', '7.1',
      'features', ARRAY[
        'Nahimic Audio',
        'Pure Sound'
      ]
    ),
    'usb_ports', jsonb_build_object(
      'usb_3_2_gen2', 1,
      'usb_3_2_gen1', 4,
      'usb_2_0', 6
    ),
    'features', ARRAY[
      'Dr. MOS',
      'Steel Slot',
      'Full Spike Protection',
      'BIOS Flashback'
    ],
    'power', jsonb_build_object(
      'phases', '8+2+1',
      'connectors', ARRAY[
        '24-pin ATX',
        '8 pin CPU'
      ]
    ),
    'cooling', jsonb_build_object(
      'fan_headers', 4,
      'temperature_sensors', 1
    )
  )
);