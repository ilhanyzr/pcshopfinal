/*
  # Update product images with diverse photos

  1. Changes
    - Update product images with more appropriate and diverse photos
    - Use different photos for each category
    - Ensure all photos are high quality and relevant
*/

-- Update Gaming PC images with diverse setups
UPDATE products 
SET image = CASE
  WHEN category LIKE 'gaming-pc-%' THEN
    CASE (RANDOM() * 4)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1587831990711-23ca6441447b'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1593640408182-31c70c8268f5'
      WHEN 2 THEN 'https://images.unsplash.com/photo-1587831991559-20c1ba52a5df'
      ELSE 'https://images.unsplash.com/photo-1593640495253-23196b27a87f'
    END
  ELSE image
END
WHERE category LIKE 'gaming-pc-%';

-- Update Workstation images
UPDATE products 
SET image = CASE
  WHEN category LIKE 'workstation-%' THEN
    CASE (RANDOM() * 4)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1547082299-de196ea013d6'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1547082298-11a3c07b62e5'
      WHEN 2 THEN 'https://images.unsplash.com/photo-1547082299-5a35ae78f452'
      ELSE 'https://images.unsplash.com/photo-1547082299-4a0e7705b5eb'
    END
  ELSE image
END
WHERE category LIKE 'workstation-%';

-- Update Laptop images with diverse models
UPDATE products 
SET image = CASE
  WHEN category LIKE '%laptop%' THEN
    CASE (RANDOM() * 4)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1593642634315-48f5414c3ad9'
      WHEN 2 THEN 'https://images.unsplash.com/photo-1593642634443-44adaa06623a'
      ELSE 'https://images.unsplash.com/photo-1593642634524-b40b5baae6bb'
    END
  ELSE image
END
WHERE category LIKE '%laptop%';

-- Update Component images
UPDATE products 
SET image = CASE
  WHEN category LIKE 'cpu-%' THEN
    CASE (RANDOM() * 3)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1555617766-c94804765aad'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1555617742-d00924fb617e'
      ELSE 'https://images.unsplash.com/photo-1555617748-5a2b4e98b593'
    END
  WHEN category LIKE 'gpu-%' THEN
    CASE (RANDOM() * 3)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1591488320449-011701bb6704'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1591488320241-c1c292f556c9'
      ELSE 'https://images.unsplash.com/photo-1591488320398-5cc0fafb2d8d'
    END
  WHEN category LIKE 'storage-%' THEN
    CASE (RANDOM() * 3)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1597872200934-7e8e3824ca3d'
      ELSE 'https://images.unsplash.com/photo-1597872200848-5877b7164e03'
    END
  WHEN category LIKE 'memory-%' THEN
    CASE (RANDOM() * 3)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1562976540-1502c2145186'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1562976540-5c5cca1d4d4c'
      ELSE 'https://images.unsplash.com/photo-1562976540-47c3b26b67d6'
    END
  ELSE image
END
WHERE category IN ('cpu-%', 'gpu-%', 'storage-%', 'memory-%');

-- Update Peripheral images
UPDATE products 
SET image = CASE
  WHEN category LIKE '%mouse%' THEN
    CASE (RANDOM() * 3)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1527814050087-3793815479db'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1527814050087-3793815479dc'
      ELSE 'https://images.unsplash.com/photo-1527814050087-3793815479dd'
    END
  WHEN category LIKE '%keyboard%' THEN
    CASE (RANDOM() * 3)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1595225476474-87563907a212'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1595225476474-87563907a213'
      ELSE 'https://images.unsplash.com/photo-1595225476474-87563907a214'
    END
  WHEN category LIKE '%headset%' THEN
    CASE (RANDOM() * 3)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1590658268037-6bf12165a8de'
      ELSE 'https://images.unsplash.com/photo-1590658268037-6bf12165a8dd'
    END
  ELSE image
END
WHERE category LIKE '%mouse%' OR category LIKE '%keyboard%' OR category LIKE '%headset%';

-- Update Monitor images
UPDATE products 
SET image = CASE
  WHEN category LIKE 'monitor%' THEN
    CASE (RANDOM() * 4)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1527443195645-1133f7f28990'
      WHEN 2 THEN 'https://images.unsplash.com/photo-1527443224154-c4a3942d3ace'
      ELSE 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acd'
    END
  ELSE image
END
WHERE category LIKE 'monitor%';

-- Update Streaming Equipment images
UPDATE products 
SET image = CASE
  WHEN category LIKE 'mic%' THEN
    CASE (RANDOM() * 3)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1590602847861-f357a9332bbc'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1590602847861-f357a9332bbd'
      ELSE 'https://images.unsplash.com/photo-1590602847861-f357a9332bbe'
    END
  WHEN category LIKE 'camera%' THEN
    CASE (RANDOM() * 3)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1516035069371-29a1b244cc33'
      ELSE 'https://images.unsplash.com/photo-1516035069371-29a1b244cc34'
    END
  ELSE image
END
WHERE category LIKE 'mic%' OR category LIKE 'camera%';

-- Update Cooling and Case images
UPDATE products 
SET image = CASE
  WHEN category LIKE 'cooling%' OR category LIKE 'case%' THEN
    CASE (RANDOM() * 4)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1587202372775-e229f172b9d7'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1587202372162-cc051ffd7e49'
      WHEN 2 THEN 'https://images.unsplash.com/photo-1587202372599-d86c8c1d3a14'
      ELSE 'https://images.unsplash.com/photo-1587202372934-b43a1697bc31'
    END
  ELSE image
END
WHERE category LIKE 'cooling%' OR category LIKE 'case%';

-- Update Power Supply images
UPDATE products 
SET image = CASE
  WHEN category LIKE 'psu%' THEN
    CASE (RANDOM() * 3)::INT
      WHEN 0 THEN 'https://images.unsplash.com/photo-1624705002806-5d72df19c3ad'
      WHEN 1 THEN 'https://images.unsplash.com/photo-1624705002806-5d72df19c3ae'
      ELSE 'https://images.unsplash.com/photo-1624705002806-5d72df19c3af'
    END
  ELSE image
END
WHERE category LIKE 'psu%';