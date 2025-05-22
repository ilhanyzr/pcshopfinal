/*
  # Add monitors with detailed specifications

  1. Changes
    - Add monitors with various specifications
    - Include detailed features and technical specs
*/

INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand) VALUES
(
  'ASUS ROG Swift 360Hz PG259QNR',
  14999.99,
  'Profesyonel e-spor monitörü',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '24.5" FHD IPS Panel',
    '360Hz Refresh Rate',
    '1ms GTG Response Time',
    'NVIDIA G-SYNC',
    'NVIDIA Reflex Analyzer',
    'HDR10',
    'ROG Desk Mount Kit'
  ],
  4.8,
  15,
  'monitor',
  'ASUS ROG'
),
(
  'Samsung Odyssey OLED G8',
  29999.99,
  'Ultra-geniş OLED gaming monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '34" Ultra-WQHD OLED',
    '175Hz Refresh Rate',
    '0.1ms Response Time',
    'AMD FreeSync Premium',
    'HDR True Black 400',
    'Core Lighting+'
  ],
  4.9,
  10,
  'monitor',
  'Samsung'
),
(
  'LG UltraFine 32EP950',
  39999.99,
  'Profesyonel OLED monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '31.5" 4K OLED Panel',
    '60Hz Refresh Rate',
    '1ms Response Time',
    'HDR400',
    'USB-C with 90W Power',
    'DCI-P3 99%'
  ],
  4.8,
  8,
  'monitor',
  'LG'
),
(
  'Dell Alienware AW3423DWF',
  32999.99,
  'QD-OLED gaming monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '34" Ultra-Wide QD-OLED',
    '165Hz Refresh Rate',
    '0.1ms Response Time',
    'AMD FreeSync Premium Pro',
    'HDR True Black 400',
    'AlienFX Lighting'
  ],
  4.9,
  12,
  'monitor',
  'Dell'
),
(
  'MSI MEG ARTYMIS 341 Mini LED',
  27999.99,
  'Mini LED gaming monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '34" Ultra-Wide Mini LED',
    '165Hz Refresh Rate',
    '1ms GTG Response Time',
    'NVIDIA G-SYNC Ultimate',
    'HDR1000',
    'KVM Switch'
  ],
  4.7,
  15,
  'monitor',
  'MSI'
),
(
  'ASUS ProArt PA32UCG-K',
  59999.99,
  'Profesyonel Mini LED monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '32" 4K Mini LED IPS',
    '120Hz Refresh Rate',
    'HDR1600',
    'Thunderbolt 4',
    'Delta E < 1',
    'Hardware Calibration'
  ],
  4.9,
  5,
  'monitor',
  'ASUS'
),
(
  'Samsung ViewFinity S9',
  44999.99,
  '5K profesyonel monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '27" 5K IPS Panel',
    '60Hz Refresh Rate',
    'HDR600',
    'Thunderbolt 4',
    '99% DCI-P3',
    'Built-in Color Calibration'
  ],
  4.8,
  7,
  'monitor',
  'Samsung'
),
(
  'LG UltraGear 32GQ950',
  24999.99,
  '4K Nano IPS gaming monitör',
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    '32" 4K Nano IPS',
    '144Hz Refresh Rate',
    '1ms GTG Response Time',
    'NVIDIA G-SYNC',
    'HDR1000',
    'RGB Sphere Lighting 2.0'
  ],
  4.7,
  20,
  'monitor',
  'LG'
);