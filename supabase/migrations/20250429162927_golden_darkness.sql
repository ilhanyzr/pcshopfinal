/*
  # Fix product images

  1. Changes
    - Update RAM product images to use proper RAM photos
    - Update CPU product images to use proper CPU photos
*/

-- Update RAM product images
UPDATE products 
SET image = 'https://images.unsplash.com/photo-1562976540-1502c2145186?auto=format&fit=crop&q=80&w=1920'
WHERE category LIKE 'memory-%';

-- Update CPU product images
UPDATE products 
SET image = 'https://images.unsplash.com/photo-1555617766-c94804765aad?auto=format&fit=crop&q=80&w=1920'
WHERE category LIKE 'cpu-%';