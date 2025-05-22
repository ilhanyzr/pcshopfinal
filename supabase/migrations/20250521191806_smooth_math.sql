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
CREATE POLICY "Enable public read access for all files"
ON storage.objects FOR SELECT
USING (bucket_id = 'public');

-- Allow admin to upload files
CREATE POLICY "Allow admin to upload files"
ON storage.objects FOR INSERT 
TO authenticated
WITH CHECK (
  bucket_id = 'public' AND
  auth.email() = 'admin@example.com'
);

-- Allow admin to update files
CREATE POLICY "Allow admin to update files"
ON storage.objects FOR UPDATE
TO authenticated
USING (
  bucket_id = 'public' AND
  auth.email() = 'admin@example.com'
);

-- Allow admin to delete files
CREATE POLICY "Allow admin to delete files"
ON storage.objects FOR DELETE
TO authenticated
USING (
  bucket_id = 'public' AND
  auth.email() = 'admin@example.com'
);