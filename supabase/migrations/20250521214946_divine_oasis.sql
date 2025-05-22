/*
  # Add new graphics cards

  1. Changes
    - Add MSI RTX 5070, RTX 4060 Ti, RTX 3060
    - Add XFX RX 9070 XT, RX 7600
    - Add ASUS RX 6600
    - Include detailed specifications
*/

-- First delete existing products if they exist
DELETE FROM products WHERE name IN (
  'MSI GeForce RTX 5070 SHADOW 3X OC',
  'MSI GeForce RTX 4060 Ti VENTUS 2X BLACK OC',
  'MSI GeForce RTX 3060 VENTUS 3X OC',
  'XFX SWIFT Radeon RX 9070 XT WHITE',
  'XFX SPEEDSTER QICK Radeon RX 7600',
  'ASUS Radeon RX 6600 DUAL V2'
);

-- Insert MSI RTX 5070
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
  'MSI GeForce RTX 5070 SHADOW 3X OC',
  29999.99,
  'MSI GeForce RTX 5070, DLSS 4 teknolojisi ve gelişmiş ray tracing özellikleri ile üst düzey oyun performansı sunar. 12GB GDDR7 bellek ve 192-bit bellek arayüzü ile yüksek grafik performansı. MSI SHADOW 3X soğutma sistemi ile optimum sıcaklık kontrolü.',
  'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '12GB GDDR7 Bellek',
    'DLSS 4 Teknolojisi',
    '192-bit Bellek Arayüzü',
    'PCIe 5.0',
    'SHADOW 3X Soğutma',
    '3x DisplayPort 2.1, 1x HDMI 2.1'
  ],
  4.9,
  15,
  'gpu',
  'MSI',
  jsonb_build_object(
    'model', 'GeForce RTX 5070',
    'memory', jsonb_build_object(
      'size', '12GB',
      'type', 'GDDR7',
      'interface', '192-bit',
      'speed', '24 Gbps'
    ),
    'core_clock', jsonb_build_object(
      'base', '2310 MHz',
      'boost', '2850 MHz'
    ),
    'cuda_cores', 8448,
    'rt_cores', '4th Gen',
    'tensor_cores', '5th Gen',
    'power', jsonb_build_object(
      'tdp', '220W',
      'recommended_psu', '650W',
      'power_connector', '8-pin + 8-pin'
    ),
    'features', ARRAY[
      'DLSS 4',
      'Ray Tracing',
      'NVIDIA Reflex',
      'NVIDIA Broadcast',
      'G-SYNC'
    ],
    'cooling', jsonb_build_object(
      'type', 'Triple Fan',
      'technology', 'SHADOW 3X',
      'zero_frozr', true
    ),
    'ports', ARRAY[
      '3x DisplayPort 2.1',
      '1x HDMI 2.1'
    ],
    'dimensions', jsonb_build_object(
      'length', '320mm',
      'height', '130mm',
      'width', '58mm'
    )
  )
);

-- Insert MSI RTX 4060 Ti
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
  'MSI GeForce RTX 4060 Ti VENTUS 2X BLACK OC',
  19999.99,
  'MSI GeForce RTX 4060 Ti, DLSS 3 teknolojisi ve ray tracing özellikleri ile 1440p oyun deneyimi sunar. 8GB GDDR6 bellek ve kompakt VENTUS 2X tasarımı ile ideal performans/boyut oranı. MSI Afterburner desteği ile özelleştirilebilir performans.',
  'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '8GB GDDR6 Bellek',
    'DLSS 3 Teknolojisi',
    '128-bit Bellek Arayüzü',
    'PCIe 4.0',
    'VENTUS 2X Soğutma',
    '3x DisplayPort 1.4, 1x HDMI 2.1'
  ],
  4.7,
  25,
  'gpu',
  'MSI',
  jsonb_build_object(
    'model', 'GeForce RTX 4060 Ti',
    'memory', jsonb_build_object(
      'size', '8GB',
      'type', 'GDDR6',
      'interface', '128-bit',
      'speed', '18 Gbps'
    ),
    'core_clock', jsonb_build_object(
      'base', '2310 MHz',
      'boost', '2655 MHz'
    ),
    'cuda_cores', 4352,
    'rt_cores', '3rd Gen',
    'tensor_cores', '4th Gen',
    'power', jsonb_build_object(
      'tdp', '160W',
      'recommended_psu', '550W',
      'power_connector', '8-pin'
    ),
    'features', ARRAY[
      'DLSS 3',
      'Ray Tracing',
      'NVIDIA Reflex',
      'NVIDIA Broadcast',
      'G-SYNC'
    ],
    'cooling', jsonb_build_object(
      'type', 'Dual Fan',
      'technology', 'VENTUS 2X',
      'zero_frozr', true
    ),
    'ports', ARRAY[
      '3x DisplayPort 1.4',
      '1x HDMI 2.1'
    ],
    'dimensions', jsonb_build_object(
      'length', '250mm',
      'height', '120mm',
      'width', '42mm'
    )
  )
);

-- Insert MSI RTX 3060
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
  'MSI GeForce RTX 3060 VENTUS 3X OC',
  14999.99,
  'MSI GeForce RTX 3060, DLSS teknolojisi ve ray tracing özellikleri ile 1080p oyun deneyimi sunar. 12GB GDDR6 bellek ve VENTUS 3X soğutma sistemi ile dengeli performans. LHR madencilik sınırlaması ile oyuncular için optimize edilmiş.',
  'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '12GB GDDR6 Bellek',
    'DLSS Teknolojisi',
    '192-bit Bellek Arayüzü',
    'PCIe 4.0',
    'VENTUS 3X Soğutma',
    'LHR Sürümü'
  ],
  4.6,
  30,
  'gpu',
  'MSI',
  jsonb_build_object(
    'model', 'GeForce RTX 3060',
    'memory', jsonb_build_object(
      'size', '12GB',
      'type', 'GDDR6',
      'interface', '192-bit',
      'speed', '15 Gbps'
    ),
    'core_clock', jsonb_build_object(
      'base', '1320 MHz',
      'boost', '1807 MHz'
    ),
    'cuda_cores', 3584,
    'rt_cores', '2nd Gen',
    'tensor_cores', '3rd Gen',
    'power', jsonb_build_object(
      'tdp', '170W',
      'recommended_psu', '550W',
      'power_connector', '8-pin'
    ),
    'features', ARRAY[
      'DLSS',
      'Ray Tracing',
      'NVIDIA Reflex',
      'NVIDIA Broadcast',
      'G-SYNC'
    ],
    'cooling', jsonb_build_object(
      'type', 'Triple Fan',
      'technology', 'VENTUS 3X',
      'zero_frozr', true
    ),
    'ports', ARRAY[
      '3x DisplayPort 1.4',
      '1x HDMI 2.1'
    ],
    'dimensions', jsonb_build_object(
      'length', '305mm',
      'height', '120mm',
      'width', '45mm'
    )
  )
);

-- Insert XFX RX 9070 XT
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
  'XFX SWIFT Radeon RX 9070 XT WHITE',
  27999.99,
  'XFX SWIFT Radeon RX 9070 XT, FSR 3 teknolojisi ve gelişmiş ray tracing özellikleri ile üst düzey oyun performansı sunar. 16GB GDDR6 bellek ve 256-bit bellek arayüzü ile yüksek grafik performansı. Beyaz renk seçeneği ile özel tasarım.',
  'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '16GB GDDR6 Bellek',
    'FSR 3 Teknolojisi',
    '256-bit Bellek Arayüzü',
    'PCIe 5.0',
    'SWIFT Soğutma',
    '3x DisplayPort 2.1, 1x HDMI 2.1'
  ],
  4.8,
  12,
  'gpu',
  'XFX',
  jsonb_build_object(
    'model', 'Radeon RX 9070 XT',
    'memory', jsonb_build_object(
      'size', '16GB',
      'type', 'GDDR6',
      'interface', '256-bit',
      'speed', '20 Gbps'
    ),
    'core_clock', jsonb_build_object(
      'base', '2210 MHz',
      'boost', '2750 MHz'
    ),
    'stream_processors', 7680,
    'ray_accelerators', '3rd Gen',
    'ai_accelerators', '2nd Gen',
    'power', jsonb_build_object(
      'tdp', '230W',
      'recommended_psu', '650W',
      'power_connector', '8-pin + 8-pin'
    ),
    'features', ARRAY[
      'FSR 3',
      'Ray Tracing',
      'AMD FreeSync Premium Pro',
      'AMD Smart Access Memory',
      'AMD Noise Suppression'
    ],
    'cooling', jsonb_build_object(
      'type', 'Triple Fan',
      'technology', 'SWIFT',
      'zero_db', true
    ),
    'ports', ARRAY[
      '3x DisplayPort 2.1',
      '1x HDMI 2.1'
    ],
    'dimensions', jsonb_build_object(
      'length', '330mm',
      'height', '140mm',
      'width', '56mm'
    )
  )
);

-- Insert XFX RX 7600
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
  'XFX SPEEDSTER QICK Radeon RX 7600',
  11999.99,
  'XFX SPEEDSTER QICK Radeon RX 7600, FSR teknolojisi ile 1080p oyun deneyimi sunar. 8GB GDDR6 bellek ve SPEEDSTER QICK soğutma sistemi ile dengeli performans. Kompakt tasarımı ile her kasaya uyum sağlar.',
  'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '8GB GDDR6 Bellek',
    'FSR Teknolojisi',
    '128-bit Bellek Arayüzü',
    'PCIe 4.0',
    'SPEEDSTER QICK Soğutma',
    '3x DisplayPort 1.4, 1x HDMI 2.1'
  ],
  4.5,
  35,
  'gpu',
  'XFX',
  jsonb_build_object(
    'model', 'Radeon RX 7600',
    'memory', jsonb_build_object(
      'size', '8GB',
      'type', 'GDDR6',
      'interface', '128-bit',
      'speed', '18 Gbps'
    ),
    'core_clock', jsonb_build_object(
      'base', '1720 MHz',
      'boost', '2755 MHz'
    ),
    'stream_processors', 2048,
    'ray_accelerators', '2nd Gen',
    'ai_accelerators', '2nd Gen',
    'power', jsonb_build_object(
      'tdp', '165W',
      'recommended_psu', '500W',
      'power_connector', '8-pin'
    ),
    'features', ARRAY[
      'FSR',
      'Ray Tracing',
      'AMD FreeSync',
      'AMD Smart Access Memory',
      'AMD Noise Suppression'
    ],
    'cooling', jsonb_build_object(
      'type', 'Dual Fan',
      'technology', 'SPEEDSTER QICK',
      'zero_db', true
    ),
    'ports', ARRAY[
      '3x DisplayPort 1.4',
      '1x HDMI 2.1'
    ],
    'dimensions', jsonb_build_object(
      'length', '240mm',
      'height', '115mm',
      'width', '40mm'
    )
  )
);

-- Insert ASUS RX 6600
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
  'ASUS Radeon RX 6600 DUAL V2',
  9999.99,
  'ASUS Radeon RX 6600 DUAL V2, FSR teknolojisi ile 1080p oyun deneyimi sunar. 8GB GDDR6 bellek ve çift fanlı soğutma sistemi ile dengeli performans. Kompakt tasarımı ve uygun fiyatı ile ideal tercih.',
  'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '8GB GDDR6 Bellek',
    'FSR Teknolojisi',
    '128-bit Bellek Arayüzü',
    'PCIe 4.0',
    'Çift Fan Soğutma',
    '3x DisplayPort 1.4, 1x HDMI 2.1'
  ],
  4.4,
  40,
  'gpu',
  'ASUS',
  jsonb_build_object(
    'model', 'Radeon RX 6600',
    'memory', jsonb_build_object(
      'size', '8GB',
      'type', 'GDDR6',
      'interface', '128-bit',
      'speed', '14 Gbps'
    ),
    'core_clock', jsonb_build_object(
      'base', '1626 MHz',
      'boost', '2491 MHz'
    ),
    'stream_processors', 1792,
    'ray_accelerators', '1st Gen',
    'ai_accelerators', '1st Gen',
    'power', jsonb_build_object(
      'tdp', '132W',
      'recommended_psu', '450W',
      'power_connector', '8-pin'
    ),
    'features', ARRAY[
      'FSR',
      'Ray Tracing',
      'AMD FreeSync',
      'AMD Smart Access Memory',
      'AMD Noise Suppression'
    ],
    'cooling', jsonb_build_object(
      'type', 'Dual Fan',
      'technology', 'Axial-tech',
      'zero_db', true
    ),
    'ports', ARRAY[
      '3x DisplayPort 1.4',
      '1x HDMI 2.1'
    ],
    'dimensions', jsonb_build_object(
      'length', '243mm',
      'height', '134mm',
      'width', '46mm'
    )
  )
);