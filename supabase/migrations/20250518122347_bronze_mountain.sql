/*
  # Add detailed gaming PC products

  1. Changes
    - Add high-end gaming PCs with detailed specifications
    - Include technical details in both specs array and JSON format
    - Add comprehensive product descriptions
*/

-- Add high-end gaming PCs
INSERT INTO products (name, price, description, image, specs, rating, stock, category, brand, technical_specs) VALUES
(
  'MSI MEG Aegis Ti5',
  119999.99,
  'En üst segment gaming PC, 4K ve ray tracing oyunlar için optimize edilmiş. Intel 13. nesil işlemci ve NVIDIA RTX 4090 ile maksimum performans.',
  'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i9-13900KS 6.0GHz 24-Core',
    'NVIDIA GeForce RTX 4090 24GB GDDR6X',
    '64GB DDR5-6400MHz RGB RAM',
    '4TB PCIe Gen4 NVMe SSD + 4TB HDD',
    '1300W 80+ Titanium PSU',
    'MSI MEG Silent Gale P12 360mm AIO',
    'Wi-Fi 6E + 2.5G LAN',
    'Windows 11 Pro'
  ],
  4.9,
  5,
  'gaming-pc-high',
  'MSI',
  '{"cpu": {"model": "i9-13900KS", "cores": 24, "threads": 32, "base_clock": "3.2GHz", "boost_clock": "6.0GHz", "cache": "36MB"}, "gpu": {"model": "RTX 4090", "vram": "24GB", "type": "GDDR6X"}, "ram": {"size": "64GB", "speed": "6400MHz", "type": "DDR5"}, "storage": {"primary": "4TB NVMe Gen4", "secondary": "4TB HDD"}, "motherboard": "MSI MEG Z790 ACE", "cooling": "360mm AIO"}'
),
(
  'ASUS ROG GT501 Gaming PC',
  89999.99,
  'AMD Ryzen işlemci ve RTX 4080 ekran kartı ile üst düzey gaming deneyimi. PCIe Gen4 SSD ve DDR5 RAM ile yüksek performans.',
  'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Ryzen 9 7950X3D 5.7GHz 16-Core',
    'ASUS ROG STRIX RTX 4080 16GB OC',
    '32GB DDR5-6000MHz RGB RAM',
    '2TB PCIe Gen4 NVMe SSD + 2TB HDD',
    '1000W 80+ Platinum PSU',
    'ROG RYUO III 360mm AIO',
    'Wi-Fi 6 + 2.5G LAN',
    'Windows 11 Pro'
  ],
  4.8,
  8,
  'gaming-pc-high',
  'ASUS ROG',
  '{"cpu": {"model": "Ryzen 9 7950X3D", "cores": 16, "threads": 32, "base_clock": "4.2GHz", "boost_clock": "5.7GHz", "cache": "144MB"}, "gpu": {"model": "RTX 4080", "vram": "16GB", "type": "GDDR6X"}, "ram": {"size": "32GB", "speed": "6000MHz", "type": "DDR5"}, "storage": {"primary": "2TB NVMe Gen4", "secondary": "2TB HDD"}, "motherboard": "ROG STRIX X670E-E", "cooling": "360mm AIO"}'
),
(
  'Corsair ONE i300',
  79999.99,
  'Kompakt tasarımda maksimum performans. Özel sıvı soğutma sistemi ile sessiz çalışma ve yüksek performans.',
  'https://images.unsplash.com/photo-1587831991559-20c1ba52a5df?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i7-13700K 5.4GHz 16-Core',
    'NVIDIA RTX 4070 Ti 12GB GDDR6X',
    '32GB DDR5-5600MHz RAM',
    '2TB PCIe Gen4 NVMe SSD',
    '750W 80+ Platinum SFX PSU',
    'Custom Liquid Cooling',
    'Wi-Fi 6E + 2.5G LAN',
    'Windows 11 Home'
  ],
  4.7,
  12,
  'gaming-pc-mid',
  'Corsair',
  '{"cpu": {"model": "i7-13700K", "cores": 16, "threads": 24, "base_clock": "3.4GHz", "boost_clock": "5.4GHz", "cache": "30MB"}, "gpu": {"model": "RTX 4070 Ti", "vram": "12GB", "type": "GDDR6X"}, "ram": {"size": "32GB", "speed": "5600MHz", "type": "DDR5"}, "storage": {"primary": "2TB NVMe Gen4"}, "motherboard": "Corsair B660i", "cooling": "Custom Loop"}'
),
(
  'NZXT H5 Flow Gaming PC',
  49999.99,
  'Orta segment gaming PC, modern oyunları 1440p çözünürlükte akıcı çalıştırır. Gelecek güncellemeler için upgrade imkanı.',
  'https://images.unsplash.com/photo-1593640495253-23196b27a87f?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'AMD Ryzen 7 7800X3D 5.0GHz',
    'NVIDIA RTX 4070 12GB GDDR6X',
    '32GB DDR5-5200MHz RAM',
    '1TB PCIe Gen4 NVMe SSD + 2TB HDD',
    '750W 80+ Gold PSU',
    'NZXT Kraken 240mm AIO',
    'Wi-Fi 6 + 2.5G LAN',
    'Windows 11 Home'
  ],
  4.6,
  15,
  'gaming-pc-mid',
  'NZXT',
  '{"cpu": {"model": "Ryzen 7 7800X3D", "cores": 8, "threads": 16, "base_clock": "4.2GHz", "boost_clock": "5.0GHz", "cache": "104MB"}, "gpu": {"model": "RTX 4070", "vram": "12GB", "type": "GDDR6X"}, "ram": {"size": "32GB", "speed": "5200MHz", "type": "DDR5"}, "storage": {"primary": "1TB NVMe Gen4", "secondary": "2TB HDD"}, "motherboard": "NZXT N7 B650E", "cooling": "240mm AIO"}'
),
(
  'HP Omen 45L',
  44999.99,
  'Cryo Chamber teknolojisi ile gelişmiş soğutma. RTX 4060 Ti ile 1440p oyun deneyimi.',
  'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?auto=format&fit=crop&q=80&w=1920',
  ARRAY[
    'Intel Core i5-13600KF 5.1GHz',
    'NVIDIA RTX 4060 Ti 8GB GDDR6',
    '16GB DDR5-4800MHz RAM',
    '1TB PCIe Gen4 NVMe SSD',
    '700W 80+ Gold PSU',
    'Cryo Chamber Cooling',
    'Wi-Fi 6 + 1G LAN',
    'Windows 11 Home'
  ],
  4.5,
  20,
  'gaming-pc-entry',
  'HP',
  '{"cpu": {"model": "i5-13600KF", "cores": 14, "threads": 20, "base_clock": "3.5GHz", "boost_clock": "5.1GHz", "cache": "24MB"}, "gpu": {"model": "RTX 4060 Ti", "vram": "8GB", "type": "GDDR6"}, "ram": {"size": "16GB", "speed": "4800MHz", "type": "DDR5"}, "storage": {"primary": "1TB NVMe Gen4"}, "motherboard": "HP Z690", "cooling": "Cryo Chamber"}'
);