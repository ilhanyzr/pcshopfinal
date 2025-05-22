-- Update product images with copyright-free Unsplash photos

-- Gaming PCs
UPDATE products 
SET image = CASE category
  WHEN 'gaming-pc-high' THEN 'https://images.unsplash.com/photo-1587831990711-23ca6441447b?auto=format&fit=crop&q=80&w=1920'
  WHEN 'gaming-pc-mid' THEN 'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?auto=format&fit=crop&q=80&w=1920'
  WHEN 'gaming-pc-entry' THEN 'https://images.unsplash.com/photo-1587831991559-20c1ba52a5df?auto=format&fit=crop&q=80&w=1920'
  ELSE image
END
WHERE category LIKE 'gaming-pc-%';

-- Laptops
UPDATE products 
SET image = CASE category
  WHEN 'gaming-laptop' THEN 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&q=80&w=1920'
  WHEN 'ultrabook' THEN 'https://images.unsplash.com/photo-1517336714731-489689fd1ca4?auto=format&fit=crop&q=80&w=1920'
  ELSE image
END
WHERE category IN ('gaming-laptop', 'ultrabook');

-- Components
UPDATE products 
SET image = CASE category
  WHEN 'cpu' THEN 'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&q=80&w=1920'
  WHEN 'gpu' THEN 'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&q=80&w=1920'
  WHEN 'storage' THEN 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?auto=format&fit=crop&q=80&w=1920'
  ELSE image
END
WHERE category IN ('cpu', 'gpu', 'storage');

-- Monitors
UPDATE products 
SET image = CASE brand
  WHEN 'Samsung' THEN 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=1920'
  WHEN 'LG' THEN 'https://images.unsplash.com/photo-1527443195645-1133f7f28990?auto=format&fit=crop&q=80&w=1920'
  WHEN 'ASUS ROG' THEN 'https://images.unsplash.com/photo-1616588589676-62b3bd4ff6d2?auto=format&fit=crop&q=80&w=1920'
  ELSE image
END
WHERE category = 'monitor';

-- Peripherals
UPDATE products 
SET image = CASE category
  WHEN 'mouse-wireless' THEN 'https://images.unsplash.com/photo-1527814050087-3793815479db?auto=format&fit=crop&q=80&w=1920'
  WHEN 'mouse-wired' THEN 'https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?auto=format&fit=crop&q=80&w=1920'
  WHEN 'keyboard-mechanical' THEN 'https://images.unsplash.com/photo-1595225476474-87563907a212?auto=format&fit=crop&q=80&w=1920'
  WHEN 'keyboard-optical' THEN 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?auto=format&fit=crop&q=80&w=1920'
  WHEN 'headset-wireless' THEN 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?auto=format&fit=crop&q=80&w=1920'
  ELSE image
END
WHERE category LIKE '%mouse%' OR category LIKE '%keyboard%' OR category LIKE '%headset%';