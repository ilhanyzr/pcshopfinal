/*
  # Add products for PC components

  1. New Products
    - RAM (DDR5, DDR4, Server)
    - CPUs (Gaming, Workstation)
    - Motherboards (Gaming, Workstation, Server)
    - Power Supplies (Gold, Platinum, Titanium)

  2. Categories covered:
    - All component subcategories
    - Detailed specifications
    - Technical details in JSON format
*/

-- RAM - DDR5
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'G.SKILL Trident Z5 RGB',
  4999.99,
  'Ultra hızlı DDR5 gaming RAM',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '32GB (2x16GB)',
    'DDR5-6400',
    'CL32-39-39-102',
    'RGB Lighting',
    'XMP 3.0',
    'Samsung B-die'
  ],
  4.9,
  20,
  'memory-ddr5',
  'G.SKILL',
  '{"capacity": "32GB", "speed": "6400MHz", "timings": "32-39-39-102", "voltage": "1.4V", "rgb": true, "xmp": "3.0"}'
),
(
  'Corsair Dominator Platinum RGB',
  5999.99,
  'Premium DDR5 RAM',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '64GB (2x32GB)',
    'DDR5-6000',
    'CL30-36-36-96',
    'Capellix LED',
    'iCUE Support',
    'DHX Cooling'
  ],
  4.8,
  15,
  'memory-ddr5',
  'Corsair',
  '{"capacity": "64GB", "speed": "6000MHz", "timings": "30-36-36-96", "voltage": "1.35V", "rgb": true, "cooling": "DHX"}'
);

-- RAM - DDR4
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Crucial Ballistix MAX',
  2999.99,
  'Yüksek performanslı DDR4 RAM',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '32GB (2x16GB)',
    'DDR4-4400',
    'CL19-19-19-46',
    'Micron E-die',
    'Aluminum Heat Spreader',
    'XMP 2.0'
  ],
  4.7,
  25,
  'memory-ddr4',
  'Crucial',
  '{"capacity": "32GB", "speed": "4400MHz", "timings": "19-19-19-46", "voltage": "1.4V", "rgb": false, "xmp": "2.0"}'
),
(
  'Kingston Fury Renegade RGB',
  2499.99,
  'RGB gaming DDR4 RAM',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '32GB (2x16GB)',
    'DDR4-3600',
    'CL16-19-19-39',
    'Infrared Sync',
    'Aluminum Heat Spreader',
    'XMP 2.0'
  ],
  4.6,
  30,
  'memory-ddr4',
  'Kingston',
  '{"capacity": "32GB", "speed": "3600MHz", "timings": "16-19-19-39", "voltage": "1.35V", "rgb": true, "xmp": "2.0"}'
);

-- RAM - Server
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Samsung DDR5 ECC RDIMM',
  8999.99,
  'Enterprise sınıfı sunucu RAM',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '64GB RDIMM',
    'DDR5-4800',
    'ECC Support',
    'Server Certified',
    'RAS Features',
    'Temperature Sensor'
  ],
  4.9,
  10,
  'memory-server',
  'Samsung',
  '{"capacity": "64GB", "speed": "4800MHz", "ecc": true, "type": "RDIMM", "features": "RAS", "certification": "Enterprise"}'
),
(
  'Micron DDR5 LRDIMM',
  12999.99,
  'Yüksek kapasiteli sunucu RAM',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '128GB LRDIMM',
    'DDR5-4800',
    'ECC Support',
    'Load Reduced',
    'Data Buffer',
    'Server Optimized'
  ],
  4.8,
  8,
  'memory-server',
  'Micron',
  '{"capacity": "128GB", "speed": "4800MHz", "ecc": true, "type": "LRDIMM", "features": "Load Reduced", "certification": "Enterprise"}'
);

-- CPUs - Gaming
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'AMD Ryzen 9 7950X3D',
  17999.99,
  'En iyi gaming işlemci',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '16 Çekirdek 32 Thread',
    '5.7GHz Boost',
    '144MB Cache',
    '120W TDP',
    'PCIe 5.0',
    '3D V-Cache'
  ],
  4.9,
  15,
  'cpu-gaming',
  'AMD',
  '{"cores": 16, "threads": 32, "base_clock": "4.2GHz", "boost_clock": "5.7GHz", "cache": "144MB", "socket": "AM5"}'
),
(
  'Intel Core i9-13900KS',
  19999.99,
  'En yüksek frekanslı gaming CPU',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '24 Çekirdek (8P+16E)',
    '6.0GHz Boost',
    '36MB Cache',
    '150W TDP',
    'PCIe 5.0',
    'Intel UHD 770'
  ],
  4.8,
  12,
  'cpu-gaming',
  'Intel',
  '{"cores": "24 (8P+16E)", "threads": 32, "base_clock": "3.2GHz", "boost_clock": "6.0GHz", "cache": "36MB", "socket": "LGA1700"}'
);

-- CPUs - Workstation
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'AMD Threadripper PRO 7995WX',
  89999.99,
  'Ultra yüksek performanslı iş istasyonu CPU',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '96 Çekirdek 192 Thread',
    '5.1GHz Boost',
    '384MB Cache',
    '350W TDP',
    'PCIe 5.0',
    'Eight Channel DDR5'
  ],
  4.9,
  5,
  'cpu-workstation',
  'AMD',
  '{"cores": 96, "threads": 192, "base_clock": "2.5GHz", "boost_clock": "5.1GHz", "cache": "384MB", "socket": "sWRX9"}'
),
(
  'Intel Xeon W9-3495X',
  79999.99,
  'Profesyonel iş istasyonu CPU',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '56 Çekirdek 112 Thread',
    '4.8GHz Boost',
    '105MB Cache',
    '350W TDP',
    'PCIe 5.0',
    'Eight Channel DDR5'
  ],
  4.8,
  8,
  'cpu-workstation',
  'Intel',
  '{"cores": 56, "threads": 112, "base_clock": "2.4GHz", "boost_clock": "4.8GHz", "cache": "105MB", "socket": "LGA4677"}'
);

-- Motherboards - Gaming
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'ASUS ROG Maximus Z790 Hero',
  12999.99,
  'Premium Intel gaming anakart',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Z790 Chipset',
    'DDR5-7800+',
    'PCIe 5.0',
    'Thunderbolt 4',
    'WiFi 6E',
    'ROG SupremeFX'
  ],
  4.9,
  15,
  'mb-gaming',
  'ASUS ROG',
  '{"socket": "LGA1700", "form_factor": "ATX", "memory_slots": 4, "m2_slots": 5, "wifi": "6E", "rgb": true}'
),
(
  'MSI MEG X670E ACE',
  11999.99,
  'High-end AMD gaming anakart',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD X670E Chipset',
    'DDR5-6666+',
    'PCIe 5.0',
    'USB4',
    'WiFi 6E',
    'Audio Boost 5'
  ],
  4.8,
  12,
  'mb-gaming',
  'MSI',
  '{"socket": "AM5", "form_factor": "E-ATX", "memory_slots": 4, "m2_slots": 4, "wifi": "6E", "rgb": true}'
);

-- Motherboards - Workstation
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'ASUS Pro WS WRX80E-SAGE SE WIFI',
  29999.99,
  'Profesyonel iş istasyonu anakart',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD WRX80 Chipset',
    'Eight Channel DDR4',
    'PCIe 4.0',
    '10G LAN',
    'BMC Management',
    'ECC Support'
  ],
  4.9,
  8,
  'mb-workstation',
  'ASUS',
  '{"socket": "sWRX8", "form_factor": "EEB", "memory_slots": 8, "m2_slots": 3, "lan": "10GbE", "management": "BMC"}'
),
(
  'Supermicro M12SWA-TF',
  24999.99,
  'Server grade workstation anakart',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD WRX80 Chipset',
    'Eight Channel DDR4',
    'PCIe 4.0',
    'IPMI',
    'Dual 10G LAN',
    'Remote Management'
  ],
  4.8,
  6,
  'mb-workstation',
  'Supermicro',
  '{"socket": "sWRX8", "form_factor": "EEB", "memory_slots": 8, "m2_slots": 2, "lan": "Dual 10GbE", "management": "IPMI"}'
);

-- Motherboards - Server
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'ASUS Pro WS C621E SAGE',
  34999.99,
  'Dual CPU server anakart',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel C621 Chipset',
    'Dual Xeon Support',
    'PCIe 3.0',
    'IPMI',
    'Dual 10G LAN',
    'ASMB9-iKVM'
  ],
  4.9,
  5,
  'mb-server',
  'ASUS',
  '{"socket": "Dual LGA3647", "form_factor": "EEB", "memory_slots": 12, "pcie_slots": 7, "lan": "Dual 10GbE", "management": "IPMI"}'
),
(
  'Supermicro X12DPi-NT6',
  39999.99,
  'Enterprise server anakart',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel C621A Chipset',
    'Dual Ice Lake-SP',
    'PCIe 4.0',
    'IPMI 2.0',
    'Quad LAN',
    'Remote Management'
  ],
  4.8,
  4,
  'mb-server',
  'Supermicro',
  '{"socket": "Dual LGA4189", "form_factor": "E-ATX", "memory_slots": 16, "pcie_slots": 6, "lan": "Quad GbE", "management": "IPMI 2.0"}'
);

-- Power Supplies - Gold
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Corsair RM850x',
  2999.99,
  'Gold sertifikalı modüler PSU',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '850W',
    '80+ Gold',
    'Fully Modular',
    'Zero RPM Mode',
    '135mm Fan',
    'Japanese Capacitors'
  ],
  4.8,
  25,
  'psu-gold',
  'Corsair',
  '{"wattage": "850W", "efficiency": "Gold", "modular": true, "fan_size": "135mm", "protection": "OVP/UVP/OCP/OTP", "warranty": "10 years"}'
),
(
  'be quiet! Straight Power 11',
  2499.99,
  'Sessiz Gold PSU',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '750W',
    '80+ Gold',
    'Fully Modular',
    'Silent Wings Fan',
    'Wire-free Design',
    'DC-DC Conversion'
  ],
  4.7,
  30,
  'psu-gold',
  'be quiet!',
  '{"wattage": "750W", "efficiency": "Gold", "modular": true, "fan_type": "Silent Wings", "noise": "<20dBA", "warranty": "5 years"}'
);

-- Power Supplies - Platinum
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Seasonic PRIME PX-1000',
  4999.99,
  'Premium Platinum PSU',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '1000W',
    '80+ Platinum',
    'Fully Modular',
    'Hybrid Fan Control',
    'Multi GPU Ready',
    'Micro Tolerance Load'
  ],
  4.9,
  15,
  'psu-platinum',
  'Seasonic',
  '{"wattage": "1000W", "efficiency": "Platinum", "modular": true, "fan_control": "Hybrid", "protection": "Full Suite", "warranty": "12 years"}'
),
(
  'Fractal Design Ion+ 860P',
  3999.99,
  'Kompakt Platinum PSU',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '860W',
    '80+ Platinum',
    'Fully Modular',
    'UltraFlex Cables',
    'Semi-passive',
    'Compact Design'
  ],
  4.8,
  20,
  'psu-platinum',
  'Fractal Design',
  '{"wattage": "860W", "efficiency": "Platinum", "modular": true, "cable_type": "UltraFlex", "depth": "140mm", "warranty": "10 years"}'
);

-- Power Supplies - Titanium
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'Corsair AX1600i',
  7999.99,
  'Ultra premium Titanium PSU',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '1600W',
    '80+ Titanium',
    'Fully Digital',
    'Gallium Nitride',
    'iCUE Compatible',
    'Toroidal Transformer'
  ],
  4.9,
  10,
  'psu-titanium',
  'Corsair',
  '{"wattage": "1600W", "efficiency": "Titanium", "modular": true, "technology": "Digital", "monitoring": "iCUE", "warranty": "10 years"}'
),
(
  'Seasonic PRIME TX-1000',
  5999.99,
  'Server grade Titanium PSU',
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '1000W',
    '80+ Titanium',
    'Fully Modular',
    'Premium Components',
    'Hybrid Fan Control',
    'Multi-GPU Ready'
  ],
  4.8,
  12,
  'psu-titanium',
  'Seasonic',
  '{"wattage": "1000W", "efficiency": "Titanium", "modular": true, "fan_control": "Hybrid", "protection": "Full Suite", "warranty": "12 years"}'
);