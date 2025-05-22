/*
  # Add products for remaining categories

  1. Changes
    - Add storage products (NVMe, SATA, HDD)
    - Add peripherals (mice, keyboards, headsets)
    - Add streaming equipment (microphones, cameras)
    - Add monitors for different use cases
*/

-- Storage - NVMe SSDs
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Samsung 990 PRO 4TB',
  9999.99,
  'En yüksek performanslı PCIe 4.0 NVMe SSD',
  'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '7450MB/s Okuma',
    '6900MB/s Yazma',
    'PCIe 4.0 x4',
    'Samsung V-NAND',
    'Samsung Controller',
    'AES 256-bit'
  ],
  4.9,
  20,
  'storage-nvme',
  'Samsung',
  '{"read_speed": "7450MB/s", "write_speed": "6900MB/s", "interface": "PCIe 4.0", "form_factor": "M.2 2280", "nand_type": "V-NAND", "endurance": "2400TBW"}'
),
(
  'WD Black SN850X 2TB',
  5999.99,
  'Gaming odaklı NVMe SSD',
  'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '7300MB/s Okuma',
    '6600MB/s Yazma',
    'PCIe 4.0 x4',
    'WD G2 Controller',
    'Game Mode 2.0',
    'Heatsink'
  ],
  4.8,
  25,
  'storage-nvme',
  'Western Digital',
  '{"read_speed": "7300MB/s", "write_speed": "6600MB/s", "interface": "PCIe 4.0", "form_factor": "M.2 2280", "nand_type": "BiCS5", "endurance": "1200TBW"}'
);

-- Storage - SATA SSDs
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Samsung 870 EVO 4TB',
  4999.99,
  'Yüksek kapasiteli SATA SSD',
  'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '560MB/s Okuma',
    '530MB/s Yazma',
    'SATA III',
    'Samsung MKX',
    '2.5 inch',
    'AES 256-bit'
  ],
  4.8,
  30,
  'storage-sata',
  'Samsung',
  '{"read_speed": "560MB/s", "write_speed": "530MB/s", "interface": "SATA III", "form_factor": "2.5 inch", "nand_type": "V-NAND", "endurance": "2400TBW"}'
),
(
  'Crucial MX500 2TB',
  2999.99,
  'Güvenilir SATA SSD',
  'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '560MB/s Okuma',
    '510MB/s Yazma',
    'SATA III',
    'Micron 3D NAND',
    '2.5 inch',
    'AES 256-bit'
  ],
  4.7,
  35,
  'storage-sata',
  'Crucial',
  '{"read_speed": "560MB/s", "write_speed": "510MB/s", "interface": "SATA III", "form_factor": "2.5 inch", "nand_type": "3D NAND", "endurance": "700TBW"}'
);

-- Storage - HDDs
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Seagate IronWolf Pro 20TB',
  7999.99,
  'NAS ve sunucu odaklı hard disk',
  'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '285MB/s Transfer',
    '7200 RPM',
    'CMR Technology',
    '256MB Cache',
    '3.5 inch',
    'NAS Optimized'
  ],
  4.7,
  15,
  'storage-hdd',
  'Seagate',
  '{"capacity": "20TB", "rpm": "7200", "cache": "256MB", "interface": "SATA III", "form_factor": "3.5 inch", "workload": "300TB/year"}'
),
(
  'WD Gold 18TB',
  6999.99,
  'Enterprise sınıfı hard disk',
  'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '272MB/s Transfer',
    '7200 RPM',
    'CMR Technology',
    '512MB Cache',
    '3.5 inch',
    'Enterprise Class'
  ],
  4.8,
  20,
  'storage-hdd',
  'Western Digital',
  '{"capacity": "18TB", "rpm": "7200", "cache": "512MB", "interface": "SATA III", "form_factor": "3.5 inch", "workload": "550TB/year"}'
);

-- Gaming Mice
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Logitech G Pro X Superlight',
  2299.99,
  'Ultra hafif profesyonel gaming mouse',
  'https://images.unsplash.com/photo-1527814050087-3793815479db?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'HERO 25K Sensor',
    '63g Ağırlık',
    'Wireless',
    '70 Saat Pil',
    '5 Programlanabilir Tuş',
    'Zero Additive'
  ],
  4.9,
  30,
  'mouse-wireless',
  'Logitech',
  '{"sensor": "HERO 25K", "dpi": "25600", "polling_rate": "1000Hz", "battery_life": "70h", "weight": "63g", "buttons": "5"}'
),
(
  'Razer Viper V2 Pro',
  2199.99,
  'Esports odaklı wireless mouse',
  'https://images.unsplash.com/photo-1527814050087-3793815479db?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Focus Pro 30K',
    '58g Ağırlık',
    'HyperSpeed Wireless',
    '80 Saat Pil',
    'Gen-3 Optical Switches',
    'Zero Cut Latency'
  ],
  4.8,
  25,
  'mouse-wireless',
  'Razer',
  '{"sensor": "Focus Pro 30K", "dpi": "30000", "polling_rate": "1000Hz", "battery_life": "80h", "weight": "58g", "buttons": "5"}'
);

-- Gaming Keyboards
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Wooting 60HE',
  2999.99,
  'Analog mekanik gaming klavye',
  'https://images.unsplash.com/photo-1595225476474-87563907a212?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Lekker Switch 60g',
    'Analog Input',
    'Hot-swappable',
    'RGB Per-key',
    '60% Layout',
    'Rapid Trigger'
  ],
  4.9,
  15,
  'keyboard-mechanical',
  'Wooting',
  '{"switches": "Lekker", "layout": "60%", "features": "Analog", "rgb": true, "polling_rate": "1000Hz", "anti_ghosting": true}'
),
(
  'Keychron Q1 Pro',
  2799.99,
  'Premium wireless mekanik klavye',
  'https://images.unsplash.com/photo-1595225476474-87563907a212?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Gateron Pro Red',
    'QMK/VIA Support',
    'Aluminum Case',
    'Hot-swappable',
    '75% Layout',
    'Bluetooth 5.1'
  ],
  4.8,
  20,
  'keyboard-mechanical',
  'Keychron',
  '{"switches": "Gateron Pro Red", "layout": "75%", "features": "Wireless", "case": "Aluminum", "battery": "4000mAh", "connectivity": "Bluetooth 5.1"}'
);

-- Gaming Headsets
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Audeze Maxwell',
  4999.99,
  'Audiophile gaming kulaklık',
  'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Planar Magnetic',
    'Dolby Atmos',
    'Bluetooth 5.3 LE',
    '80 Saat Pil',
    'Boom Mikrofon',
    'AI Noise Filtering'
  ],
  4.9,
  10,
  'headset-wireless',
  'Audeze',
  '{"driver": "90mm Planar", "frequency": "10-50000Hz", "impedance": "32 ohm", "battery_life": "80h", "weight": "490g", "connectivity": "Wireless"}'
),
(
  'Sennheiser HD 660S2',
  4499.99,
  'Profesyonel açık arka kulaklık',
  'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Dynamic Driver',
    'Open Back Design',
    '104dB SPL',
    '300 ohm',
    'Detachable Cable',
    'Velour Earpads'
  ],
  4.8,
  15,
  'headset-pro',
  'Sennheiser',
  '{"driver": "38mm Dynamic", "frequency": "8-41500Hz", "impedance": "300 ohm", "sensitivity": "104dB", "weight": "260g", "type": "Open Back"}'
);

-- Streaming Equipment - Microphones
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Shure SM7B',
  7999.99,
  'Profesyonel yayıncı mikrofonu',
  'https://images.unsplash.com/photo-1590602847861-f357a9332bbc?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Dinamik Kapsül',
    'Kardiyoid Pattern',
    'XLR Bağlantı',
    'Air Suspension',
    'Bass Roll-off',
    'Mid-range Boost'
  ],
  4.9,
  10,
  'mic-dynamic',
  'Shure',
  '{"type": "Dynamic", "pattern": "Cardioid", "frequency": "50-20000Hz", "impedance": "150 ohm", "connector": "XLR", "features": "Air Suspension"}'
),
(
  'Austrian Audio OC818',
  11999.99,
  'Profesyonel kondenser mikrofon',
  'https://images.unsplash.com/photo-1590602847861-f357a9332bbc?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Large Diaphragm',
    'Multi-pattern',
    'Ceramic Capsule',
    'Dual Output',
    'Remote Control',
    'Open Acoustics'
  ],
  4.8,
  5,
  'mic-condenser',
  'Austrian Audio',
  '{"type": "Condenser", "pattern": "Multi", "frequency": "20-20000Hz", "pad": "-10/-20dB", "filter": "40/80/160Hz", "features": "Dual Output"}'
);

-- Streaming Equipment - Cameras
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Sony Alpha 7 IV',
  44999.99,
  'Profesyonel hibrit kamera',
  'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '33MP Full-frame',
    '4K 60fps',
    '10-bit 4:2:2',
    'Real-time AF',
    'S-Log3',
    'Live Streaming'
  ],
  4.9,
  8,
  'camera-dslr',
  'Sony',
  '{"sensor": "33MP Full-frame", "video": "4K60p", "af_points": "759", "iso": "100-51200", "mount": "E-mount", "features": "Live Streaming"}'
),
(
  'Elgato Facecam Pro',
  4999.99,
  'Premium yayıncı kamerası',
  'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '4K 60fps',
    'Sony STARVIS',
    'f/2.0 Prime',
    'Camera Hub',
    'USB 3.0',
    'Flash Memory'
  ],
  4.8,
  20,
  'camera-webcam',
  'Elgato',
  '{"resolution": "4K", "fps": "60", "sensor": "Sony STARVIS", "lens": "f/2.0 Prime", "fov": "90 degrees", "connection": "USB 3.0"}'
);

-- Monitors - Gaming
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'ASUS ROG Swift PG27AQN',
  24999.99,
  'Esports gaming monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '27 inch 1440p',
    '360Hz Refresh',
    'IPS Panel',
    'G-SYNC',
    'HDR 600',
    'RGB Lighting'
  ],
  4.9,
  10,
  'monitor-240hz',
  'ASUS ROG',
  '{"panel": "IPS", "resolution": "2560x1440", "refresh_rate": "360Hz", "response_time": "1ms", "hdr": "HDR600", "features": "G-SYNC"}'
),
(
  'Samsung Odyssey OLED G8',
  29999.99,
  'Ultra-wide gaming monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '34 inch Ultra-wide',
    '175Hz Refresh',
    'QD-OLED',
    'AMD FreeSync',
    'HDR True Black',
    'Core Lighting'
  ],
  4.8,
  15,
  'monitor-165hz',
  'Samsung',
  '{"panel": "QD-OLED", "resolution": "3440x1440", "refresh_rate": "175Hz", "response_time": "0.1ms", "hdr": "True Black 400", "features": "FreeSync"}'
);

-- Monitors - Professional
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Apple Pro Display XDR',
  89999.99,
  'Profesyonel referans monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '32 inch 6K',
    'Mini-LED',
    'XDR Technology',
    'P3 Wide Color',
    'Reference Modes',
    'Nano-texture'
  ],
  4.9,
  5,
  'monitor-4k',
  'Apple',
  '{"panel": "Mini-LED", "resolution": "6016x3384", "brightness": "1600 nits", "contrast": "1000000:1", "color": "P3", "features": "XDR"}'
),
(
  'ASUS ProArt PA32UCG-K',
  59999.99,
  'HDR içerik üretici monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '32 inch 4K',
    'Mini-LED',
    'HDR 1600',
    'Calibration',
    'Thunderbolt 4',
    'ProArt Palette'
  ],
  4.8,
  8,
  'monitor-4k',
  'ASUS',
  '{"panel": "Mini-LED IPS", "resolution": "3840x2160", "refresh_rate": "120Hz", "brightness": "1600 nits", "color": "DCI-P3 98%", "features": "Hardware Calibration"}'
);