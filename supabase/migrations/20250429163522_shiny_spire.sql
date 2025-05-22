-- Gaming Mouse - Wireless
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Razer Viper V3 HyperSpeed',
  1999.99,
  'Ultra hafif kablosuz gaming mouse',
  'https://images.unsplash.com/photo-1527814050087-3793815479db?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Focus Pro 30K Sensor',
    '59g Ağırlık',
    'HyperSpeed Wireless',
    '90 Saat Pil Ömrü',
    'Gen-3 Optik Switchler',
    'Ambidextrous Tasarım'
  ],
  4.8,
  30,
  'mouse-wireless',
  'Razer',
  '{"sensor": "Focus Pro 30K", "dpi": "30000", "polling_rate": "1000Hz", "battery": "90h", "weight": "59g", "switches": "Optical Gen-3"}'
),
(
  'Pulsar X2 Wireless',
  1799.99,
  'Esports odaklı kablosuz mouse',
  'https://images.unsplash.com/photo-1527814050087-3793815479db?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'PAW3395 Sensor',
    '52g Ağırlık',
    '2.4GHz Wireless',
    '70 Saat Pil Ömrü',
    'Kailh 8.0 Switchler',
    'Pure PTFE Ayaklar'
  ],
  4.7,
  25,
  'mouse-wireless',
  'Pulsar',
  '{"sensor": "PAW3395", "dpi": "26000", "polling_rate": "1000Hz", "battery": "70h", "weight": "52g", "switches": "Kailh 8.0"}'
);

-- Gaming Mouse - Wired
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Zowie EC2-C',
  999.99,
  'Profesyonel esports mouse',
  'https://images.unsplash.com/photo-1527814050087-3793815479db?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '3360 Sensor',
    '88g Ağırlık',
    'Ergonomik Tasarım',
    'Esnek Kablo',
    'Huano Switchler',
    'Ayarlanabilir DPI'
  ],
  4.9,
  40,
  'mouse-wired',
  'Zowie',
  '{"sensor": "3360", "dpi": "3200", "polling_rate": "1000Hz", "cable": "Flexible", "weight": "88g", "switches": "Huano"}'
),
(
  'Endgame Gear XM2we',
  1299.99,
  'Ultra hafif kablolu mouse',
  'https://images.unsplash.com/photo-1527814050087-3793815479db?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'PAW3395 Sensor',
    '55g Ağırlık',
    'Shoelace Kablo',
    'Kailh GM 8.0',
    'PTFE Ayaklar',
    'Simetrik Tasarım'
  ],
  4.8,
  35,
  'mouse-wired',
  'Endgame Gear',
  '{"sensor": "PAW3395", "dpi": "26000", "polling_rate": "1000Hz", "cable": "Shoelace", "weight": "55g", "switches": "Kailh GM 8.0"}'
);

-- Gaming Keyboard - Mechanical
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Varmilo VA87M',
  2499.99,
  'Premium mekanik klavye',
  'https://images.unsplash.com/photo-1595225476474-87563907a212?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Cherry MX Red',
    'PBT Keycaps',
    'Dye-Sub Baskı',
    'TKL Layout',
    'Aluminyum Kasa',
    'Çift Katmanlı PCB'
  ],
  4.9,
  20,
  'keyboard-mechanical',
  'Varmilo',
  '{"switches": "Cherry MX Red", "layout": "TKL", "keycaps": "PBT", "case": "Aluminum", "connection": "USB-C", "nkey": true}'
),
(
  'GMMK Pro',
  3499.99,
  'Özelleştirilebilir mekanik klavye',
  'https://images.unsplash.com/photo-1595225476474-87563907a212?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Hot-swap PCB',
    '75% Layout',
    'Aluminyum Kasa',
    'Gasket Mount',
    'RGB Aydınlatma',
    'Rotary Encoder'
  ],
  4.8,
  15,
  'keyboard-mechanical',
  'Glorious',
  '{"switches": "Hot-swap", "layout": "75%", "mounting": "Gasket", "case": "Aluminum", "rgb": true, "features": "Rotary Encoder"}'
);

-- Gaming Keyboard - Optical
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Razer Huntsman V3 Pro',
  3999.99,
  'Ultra hızlı optik klavye',
  'https://images.unsplash.com/photo-1595225476474-87563907a212?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Analog Optik Switchler',
    'PBT Keycaps',
    '8000Hz Polling',
    'Full Size',
    'Chroma RGB',
    'Media Controls'
  ],
  4.7,
  25,
  'keyboard-optical',
  'Razer',
  '{"switches": "Analog Optical", "layout": "Full", "polling": "8000Hz", "keycaps": "PBT", "rgb": true, "features": "Media Controls"}'
);

-- Gaming Headset - Wireless
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Arctis Nova Pro Wireless',
  5999.99,
  'Premium kablosuz gaming kulaklık',
  'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Nova Pro Sürücüler',
    '360° Spatial Audio',
    'Çift Batarya Sistemi',
    'Active Noise Cancelling',
    'Bluetooth 5.0',
    'GameDAC Gen 2'
  ],
  4.9,
  15,
  'headset-wireless',
  'SteelSeries',
  '{"drivers": "Nova Pro", "wireless": "2.4GHz + BT", "battery": "44h", "anc": true, "mic": "AI-powered", "features": "Hot-swap Battery"}'
),
(
  'ROG Delta S Wireless',
  4499.99,
  'Hi-Res kablosuz kulaklık',
  'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'ESS 9281 DAC',
    'AI Noise Cancelling',
    'Dual Wireless',
    '50 Saat Pil',
    'ROG Hybrid',
    'RGB Aydınlatma'
  ],
  4.8,
  20,
  'headset-wireless',
  'ASUS ROG',
  '{"drivers": "50mm", "wireless": "2.4GHz + BT", "battery": "50h", "dac": "ESS 9281", "mic": "AI NC", "rgb": true}'
);

-- Streaming Equipment - Microphones
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Rode NT-USB+',
  3499.99,
  'Profesyonel USB mikrofon',
  'https://images.unsplash.com/photo-1590602847861-f357a9332bbc?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Kardiyoid Pattern',
    '24-bit/48kHz',
    'Internal Pop Filter',
    'Zero-latency Monitoring',
    'Revolution Preamp',
    'USB-C Bağlantı'
  ],
  4.8,
  25,
  'mic-usb',
  'Rode',
  '{"type": "Condenser", "pattern": "Cardioid", "resolution": "24-bit/48kHz", "monitoring": "Zero-latency", "connection": "USB-C", "features": "Internal DSP"}'
),
(
  'Earthworks ICON Pro',
  8999.99,
  'Broadcast kalitesinde XLR mikrofon',
  'https://images.unsplash.com/photo-1590602847861-f357a9332bbc?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Kardiyoid Pattern',
    '20Hz-30kHz',
    'Stainless Steel Gövde',
    '-36 dBV/Pa',
    'Precision Transducer',
    'Shock Mount'
  ],
  4.9,
  10,
  'mic-condenser',
  'Earthworks',
  '{"type": "Condenser", "pattern": "Cardioid", "frequency": "20Hz-30kHz", "sensitivity": "-36 dBV/Pa", "construction": "Stainless Steel", "accessories": "Shock Mount"}'
);