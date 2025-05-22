-- Update any products missing images with appropriate Unsplash photos

-- Update any missing gaming PC images
UPDATE products 
SET image = 'https://images.unsplash.com/photo-1593640495253-23196b27a87f?auto=format&fit=crop&q=80&w=1920'
WHERE category LIKE 'gaming-pc-%' AND (image IS NULL OR image = '');

-- Update any missing laptop images
UPDATE products 
SET image = 'https://images.unsplash.com/photo-1593642634315-48f5414c3ad9?auto=format&fit=crop&q=80&w=1920'
WHERE category LIKE '%laptop%' AND (image IS NULL OR image = '');

-- Update any missing component images
UPDATE products 
SET image = CASE category
  WHEN 'cpu' THEN 'https://images.unsplash.com/photo-1555617742-d00924fb617e?auto=format&fit=crop&q=80&w=1920'
  WHEN 'gpu' THEN 'https://images.unsplash.com/photo-1591488320241-c1c292f556c9?auto=format&fit=crop&q=80&w=1920'
  WHEN 'storage' THEN 'https://images.unsplash.com/photo-1597872200848-5877b7164e03?auto=format&fit=crop&q=80&w=1920'
  WHEN 'memory-ddr5' THEN 'https://images.unsplash.com/photo-1562976540-1502c2145186?auto=format&fit=crop&q=80&w=1920'
  WHEN 'memory-ddr4' THEN 'https://images.unsplash.com/photo-1562976540-5c5cca1d4d4c?auto=format&fit=crop&q=80&w=1920'
  ELSE image
END
WHERE category IN ('cpu', 'gpu', 'storage', 'memory-ddr5', 'memory-ddr4') 
AND (image IS NULL OR image = '');

-- Update any missing monitor images
UPDATE products 
SET image = 'https://images.unsplash.com/photo-1585792180666-f7347c490ee2?auto=format&fit=crop&q=80&w=1920'
WHERE category = 'monitor' AND (image IS NULL OR image = '');

-- Update any missing peripheral images
UPDATE products 
SET image = CASE category
  WHEN 'mouse-wireless' THEN 'https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?auto=format&fit=crop&q=80&w=1920'
  WHEN 'keyboard-mechanical' THEN 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?auto=format&fit=crop&q=80&w=1920'
  WHEN 'headset-wireless' THEN 'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?auto=format&fit=crop&q=80&w=1920'
  ELSE image
END
WHERE (category LIKE '%mouse%' OR category LIKE '%keyboard%' OR category LIKE '%headset%')
AND (image IS NULL OR image = '');

-- Update any missing cooling product images
UPDATE products 
SET image = CASE category
  WHEN 'cooling-air' THEN 'https://images.unsplash.com/photo-1587202372562-9e587c2c25c9?auto=format&fit=crop&q=80&w=1920'
  WHEN 'cooling-water' THEN 'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&q=80&w=1920'
  WHEN 'cooling-case' THEN 'https://images.unsplash.com/photo-1587202372599-d86c8c1d3a14?auto=format&fit=crop&q=80&w=1920'
  ELSE image
END
WHERE category LIKE 'cooling-%' AND (image IS NULL OR image = '');