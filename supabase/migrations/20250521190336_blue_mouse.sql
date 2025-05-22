/*
  # Configure Supabase Storage for product images

  1. Changes
    - Create storage bucket for product images
    - Set up storage policies for admin access
    - Enable public read access
*/

-- Create storage bucket for product images
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM storage.buckets WHERE id = 'product-images'
  ) THEN
    INSERT INTO storage.buckets (id, name)
    VALUES ('product-images', 'Product Images');
  END IF;
END $$;

-- Enable public read access
CREATE POLICY "Enable public read access"
ON storage.objects FOR SELECT
USING (bucket_id = 'product-images');

-- Allow admin to upload images
CREATE POLICY "Allow admin to upload images"
ON storage.objects FOR INSERT 
TO authenticated
WITH CHECK (
  bucket_id = 'product-images' AND
  auth.email() = 'admin@example.com'
);

-- Allow admin to update images
CREATE POLICY "Allow admin to update images"
ON storage.objects FOR UPDATE
TO authenticated
USING (
  bucket_id = 'product-images' AND
  auth.email() = 'admin@example.com'
);

-- Allow admin to delete images
CREATE POLICY "Allow admin to delete images"
ON storage.objects FOR DELETE
TO authenticated
USING (
  bucket_id = 'product-images' AND
  auth.email() = 'admin@example.com'
);