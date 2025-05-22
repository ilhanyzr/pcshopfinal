/*
  # Add products for Components category

  1. Changes
    - Add products for each component subcategory
    - Include detailed specifications and pricing
    - Add technical details in JSON format
*/

-- Power Supplies - High End
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'be quiet! Dark Power Pro 13',
  8999.99,
  'Ultra premium güç kaynağı',
  'https://images.unsplash.com/photo-1624705002806-5d72df19c3ad?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '1300W',
    '80+ Titanium',
    'Fully Digital',
    'Silent Wings Fan',
    'Fluid Dynamic Bearing',
    'Full Bridge LLC'
  ],
  4.9,
  10,
  'psu-titanium',
  'be quiet!',
  '{"wattage": "1300W", "efficiency": "Titanium", "modular": true, "fan": "Silent Wings", "protection": "Full Suite", "warranty": "10 years"}'
),
(
  'Seasonic PRIME TX-1600',
  9999.99,
  'Server grade güç kaynağı',
  'https://images.unsplash.com/photo-1624705002806-5d72df19c3ad?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '1600W',
    '80+ Titanium',
    'Fully Modular',
    'Hybrid Fan Control',
    'Multi-GPU Ready',
    'Micro Tolerance'
  ],
  4.8,
  8,
  'psu-titanium',
  'Seasonic',
  '{"wattage": "1600W", "efficiency": "Titanium", "modular": true, "fan_control": "Hybrid", "protection": "Full Suite", "warranty": "12 years"}'
);

-- Cooling - Air Cooling
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Noctua NH-D15 chromax.black',
  2499.99,
  'En iyi hava soğutma',
  'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Çift Kule Tasarım',
    '2x 140mm Fan',
    'SecuFirm2 Montaj',
    '1500 RPM',
    'Termal Macun Dahil',
    'Siyah Kaplama'
  ],
  4.9,
  25,
  'cooling-air',
  'Noctua',
  '{"type": "Dual Tower", "fans": "2x 140mm", "noise": "24.6 dBA", "height": "165mm", "tdp": "220W", "socket": "Universal"}'
),
(
  'be quiet! Dark Rock Pro 4',
  2299.99,
  'Sessiz hava soğutma',
  'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Çift Kule Tasarım',
    '1x 135mm + 1x 120mm Fan',
    'Silent Wings Fan',
    '1500 RPM',
    'Termal Macun Dahil',
    'Siyah Kaplama'
  ],
  4.8,
  30,
  'cooling-air',
  'be quiet!',
  '{"type": "Dual Tower", "fans": "135mm + 120mm", "noise": "24.3 dBA", "height": "163mm", "tdp": "250W", "socket": "Universal"}'
);

-- Cooling - Water Cooling
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'ARCTIC Liquid Freezer II 420',
  3499.99,
  'Yüksek performanslı AIO',
  'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '420mm Radyatör',
    '3x 140mm P14 Fan',
    'VRM Soğutma Fanı',
    'Offset Montaj',
    'Intel/AMD Uyumlu',
    'PWM Kontrol'
  ],
  4.9,
  20,
  'cooling-water',
  'ARCTIC',
  '{"radiator": "420mm", "fans": "3x 140mm", "pump": "Custom", "vrm_fan": true, "noise": "22.5 dBA", "warranty": "6 years"}'
),
(
  'EK-AIO Elite 360 D-RGB',
  4299.99,
  'Premium RGB AIO',
  'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '360mm Radyatör',
    '6x EK-Vardar Fan',
    'EK-Velocity Pump',
    'D-RGB Aydınlatma',
    'SplitFlow Tasarım',
    'Nuke Soğutucu'
  ],
  4.8,
  15,
  'cooling-water',
  'EK',
  '{"radiator": "360mm", "fans": "6x 120mm", "pump": "EK-Velocity", "rgb": true, "noise": "24.5 dBA", "warranty": "5 years"}'
);

-- Cooling - Case Fans
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Noctua NF-A12x25 PWM chromax.black',
  499.99,
  'En iyi 120mm fan',
  'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '120mm',
    'Sterrox Impeller',
    '2000 RPM PWM',
    'SSO2 Bearing',
    'Flow Optimization',
    'Ultra-Tight Tolerances'
  ],
  4.9,
  50,
  'cooling-case',
  'Noctua',
  '{"size": "120mm", "rpm": "2000", "noise": "22.6 dBA", "airflow": "102.1 m³/h", "pressure": "2.34 mmH₂O", "bearing": "SSO2"}'
),
(
  'be quiet! Silent Wings 4 Pro',
  449.99,
  'Ultra sessiz 140mm fan',
  'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '140mm',
    'Fluid Dynamic Bearing',
    '3000 RPM PWM',
    '6-Pole Motor',
    'Advanced ICR',
    'Flow-Optimized'
  ],
  4.8,
  40,
  'cooling-case',
  'be quiet!',
  '{"size": "140mm", "rpm": "3000", "noise": "21.5 dBA", "airflow": "118.2 m³/h", "pressure": "3.97 mmH₂O", "bearing": "FDB"}'
);

-- Cases - Full Tower
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Phanteks Enthoo 719',
  4999.99,
  'Dual sistem full tower kasa',
  'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Dual Sistem Desteği',
    'E-ATX Uyumlu',
    '12x 120mm Fan',
    '480mm Radyatör',
    'Tempered Glass',
    'Modüler Tasarım'
  ],
  4.9,
  10,
  'case-full',
  'Phanteks',
  '{"type": "Full Tower", "motherboard": "E-ATX", "radiator": "480mm", "fans": "12x 120mm", "material": "Steel/Glass", "weight": "14.5kg"}'
),
(
  'Lian Li V3000 Plus',
  5999.99,
  'Premium full tower kasa',
  'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Aluminyum Yapı',
    'E-ATX Uyumlu',
    '10x 140mm Fan',
    '420mm Radyatör',
    'Tempered Glass',
    'Tool-Free Tasarım'
  ],
  4.8,
  8,
  'case-full',
  'Lian Li',
  '{"type": "Full Tower", "motherboard": "E-ATX", "radiator": "420mm", "fans": "10x 140mm", "material": "Aluminum/Glass", "weight": "15.2kg"}'
);

-- Cases - Mid Tower
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Fractal Design Torrent',
  3499.99,
  'Hava akışı odaklı mid tower',
  'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'ATX Uyumlu',
    '180mm Fanlar',
    '420mm Radyatör',
    'Tempered Glass',
    'Nexus 9P Fan Hub',
    'Open Layout'
  ],
  4.9,
  20,
  'case-mid',
  'Fractal Design',
  '{"type": "Mid Tower", "motherboard": "ATX", "radiator": "420mm", "fans": "2x 180mm + 3x 140mm", "material": "Steel/Glass", "weight": "11.1kg"}'
),
(
  'be quiet! Silent Base 802',
  2999.99,
  'Sessiz mid tower kasa',
  'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'ATX Uyumlu',
    'Çift Panel Seçeneği',
    '360mm Radyatör',
    'Sound Dampening',
    'PWM Fan Hub',
    'Tool-Free'
  ],
  4.8,
  25,
  'case-mid',
  'be quiet!',
  '{"type": "Mid Tower", "motherboard": "ATX", "radiator": "360mm", "fans": "4x 140mm", "material": "Steel/Glass", "weight": "12.3kg"}'
);

-- Cases - Mini Tower
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'NR200P MAX',
  4299.99,
  'SFF gaming kasası',
  'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'ITX Uyumlu',
    '280mm AIO Dahil',
    '850W SFX PSU',
    'PCIe 4.0 Riser',
    'Tool-Free',
    'Çift Panel'
  ],
  4.9,
  15,
  'case-mini',
  'Cooler Master',
  '{"type": "Mini ITX", "motherboard": "ITX", "radiator": "280mm", "psu": "850W SFX", "volume": "18.5L", "gpu_length": "330mm"}'
),
(
  'Lian Li Dan A4-H2O',
  3299.99,
  'Kompakt ITX kasası',
  'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'ITX Uyumlu',
    '240mm AIO Desteği',
    'PCIe 4.0 Riser',
    'Aluminyum Yapı',
    'Tool-Free',
    'Minimal Tasarım'
  ],
  4.8,
  20,
  'case-mini',
  'Lian Li',
  '{"type": "Mini ITX", "motherboard": "ITX", "radiator": "240mm", "volume": "11L", "gpu_length": "320mm", "material": "Aluminum"}'
);