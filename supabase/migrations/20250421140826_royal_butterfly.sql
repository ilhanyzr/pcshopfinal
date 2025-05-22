/*
  # Fix reviews relationship with profiles

  1. Changes
    - Add foreign key constraint between reviews and profiles
    - Update existing reviews query
    - Add proper indexes for performance

  2. Security
    - Maintain existing RLS policies
*/

-- Add foreign key constraint to reviews table
ALTER TABLE reviews
DROP CONSTRAINT IF EXISTS reviews_user_id_fkey,
ADD CONSTRAINT reviews_user_id_fkey 
  FOREIGN KEY (user_id) 
  REFERENCES auth.users(id)
  ON DELETE CASCADE;

-- Create index for reviews queries
CREATE INDEX IF NOT EXISTS idx_reviews_product_id 
  ON reviews(product_id);

CREATE INDEX IF NOT EXISTS idx_reviews_user_id 
  ON reviews(user_id);

-- Create view for safe profile access
CREATE OR REPLACE VIEW public.user_profiles AS
SELECT 
  p.id,
  p.name,
  p.created_at
FROM profiles p;

-- Update review policies
DROP POLICY IF EXISTS "Anyone can view reviews" ON reviews;
CREATE POLICY "Anyone can view reviews"
  ON reviews
  FOR SELECT
  TO public
  USING (true);

DROP POLICY IF EXISTS "Users can update own reviews" ON reviews;
CREATE POLICY "Users can update own reviews"
  ON reviews
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Authenticated users can create reviews" ON reviews;
CREATE POLICY "Authenticated users can create reviews"
  ON reviews
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);