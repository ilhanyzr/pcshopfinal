-- Update Gaming PCs with unique images
UPDATE products 
SET image = CASE id 
  WHEN (SELECT id FROM products WHERE category = 'gaming-pc-high' LIMIT 1) 
    THEN 'https://images.unsplash.com/photo-1587831990711-23ca6441447b'
  WHEN (SELECT id FROM products WHERE category = 'gaming-pc-high' OFFSET 1 LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1593640408182-31c70c8268f5'
  WHEN (SELECT id FROM products WHERE category = 'gaming-pc-mid' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1587831991559-20c1ba52a5df'
  WHEN (SELECT id FROM products WHERE category = 'gaming-pc-mid' OFFSET 1 LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1593640495253-23196b27a87f'
  WHEN (SELECT id FROM products WHERE category = 'gaming-pc-entry' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1593640408454-54757502cbe9'
END
WHERE category LIKE 'gaming-pc-%';

-- Update Laptops with unique images
UPDATE products 
SET image = CASE id
  WHEN (SELECT id FROM products WHERE category = 'gaming-laptop' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45'
  WHEN (SELECT id FROM products WHERE category = 'gaming-laptop' OFFSET 1 LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1593642634315-48f5414c3ad9'
  WHEN (SELECT id FROM products WHERE category = 'ultrabook' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1517336714731-489689fd1ca4'
  WHEN (SELECT id FROM products WHERE category = 'ultrabook' OFFSET 1 LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1511385348-a52b4a160dc2'
END
WHERE category IN ('gaming-laptop', 'ultrabook');

-- Update Components with unique images
UPDATE products 
SET image = CASE id
  WHEN (SELECT id FROM products WHERE category = 'cpu' AND brand = 'AMD' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1555617766-c94804765aad'
  WHEN (SELECT id FROM products WHERE category = 'cpu' AND brand = 'Intel' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea'
  WHEN (SELECT id FROM products WHERE category = 'gpu' AND brand = 'NVIDIA' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1591488320449-011701bb6704'
  WHEN (SELECT id FROM products WHERE category = 'gpu' AND brand = 'AMD' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1587202372562-9e587c2c25c9'
END
WHERE category IN ('cpu', 'gpu');

-- Update Storage devices with unique images
UPDATE products 
SET image = CASE id
  WHEN (SELECT id FROM products WHERE category = 'storage' AND name LIKE '%NVMe%' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b'
  WHEN (SELECT id FROM products WHERE category = 'storage' AND name LIKE '%SSD%' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1597872200774-099bc1cc0f8f'
  WHEN (SELECT id FROM products WHERE category = 'storage' AND name LIKE '%HDD%' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1601737487795-dab270904e03'
END
WHERE category = 'storage';

-- Update Monitors with unique images
UPDATE products 
SET image = CASE id
  WHEN (SELECT id FROM products WHERE category = 'monitor' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf'
  WHEN (SELECT id FROM products WHERE category = 'monitor' OFFSET 1 LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1527443195645-1133f7f28990'
  WHEN (SELECT id FROM products WHERE category = 'monitor' OFFSET 2 LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1616588589676-62b3bd4ff6d2'
  WHEN (SELECT id FROM products WHERE category = 'monitor' OFFSET 3 LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1585792180666-f7347c490ee2'
END
WHERE category = 'monitor';

-- Update Peripherals with unique images
UPDATE products 
SET image = CASE id
  WHEN (SELECT id FROM products WHERE category LIKE '%mouse%' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1527814050087-3793815479db'
  WHEN (SELECT id FROM products WHERE category LIKE '%mouse%' OFFSET 1 LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7'
  WHEN (SELECT id FROM products WHERE category LIKE '%keyboard%' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1595225476474-87563907a212'
  WHEN (SELECT id FROM products WHERE category LIKE '%keyboard%' OFFSET 1 LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1587829741301-dc798b83add3'
  WHEN (SELECT id FROM products WHERE category LIKE '%headset%' LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df'
  WHEN (SELECT id FROM products WHERE category LIKE '%headset%' OFFSET 1 LIMIT 1)
    THEN 'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb'
END
WHERE category LIKE '%mouse%' OR category LIKE '%keyboard%' OR category LIKE '%headset%';