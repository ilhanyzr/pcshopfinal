/*
  # Add reviews-profiles relationship

  1. Changes
    - Add foreign key relationship between reviews.user_id and profiles.id
    - Add index on reviews.user_id for better query performance

  2. Security
    - No changes to RLS policies
*/

-- Add index for better join performance
CREATE INDEX IF NOT EXISTS idx_reviews_user_id_profiles ON reviews(user_id);

-- Add foreign key constraint
ALTER TABLE reviews
ADD CONSTRAINT reviews_user_id_profiles_fkey
FOREIGN KEY (user_id) REFERENCES profiles(id)
ON DELETE CASCADE;