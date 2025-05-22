/*
  # Fix storage bucket issues

  1. Changes
    - Create public bucket for product images
    - Set up proper storage policies
    - Ensure admin access for uploads
*/

-- Create public bucket if it doesn't exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM storage.buckets WHERE id = 'public'
  ) THEN
    INSERT INTO storage.buckets (id, name, public)
    VALUES ('public', 'Public Storage', true);
  END IF;
END $$;

-- Enable public read access
CREATE POLICY "Enable public read access for product images"
ON storage.objects FOR SELECT
USING (bucket_id = 'public');

-- Allow admin to upload images
CREATE POLICY "Allow admin to upload product images"
ON storage.objects FOR INSERT 
TO authenticated
WITH CHECK (
  bucket_id = 'public' AND
  auth.email() = 'admin@example.com'
);

-- Allow admin to update images
CREATE POLICY "Allow admin to update product images"
ON storage.objects FOR UPDATE
TO authenticated
USING (
  bucket_id = 'public' AND
  auth.email() = 'admin@example.com'
);

-- Allow admin to delete images
CREATE POLICY "Allow admin to delete product images"
ON storage.objects FOR DELETE
TO authenticated
USING (
  bucket_id = 'public' AND
  auth.email() = 'admin@example.com'
);