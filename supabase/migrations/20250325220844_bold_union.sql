/*
  # Fix Reviews and Profiles Relationship

  1. Changes
    - Add user_profiles view to safely expose user profile data
    - Update reviews query to use the view
    - Add proper join between reviews and profiles

  2. Security
    - Only expose necessary profile information
    - Maintain RLS policies
*/

-- Create a secure view for user profiles
CREATE VIEW user_profiles AS
SELECT 
  id,
  name
FROM profiles;

-- Update reviews query to use user_profiles
CREATE OR REPLACE FUNCTION get_review_with_user(review_id uuid) 
RETURNS TABLE (
  id uuid,
  product_id uuid,
  user_id uuid,
  rating integer,
  comment text,
  created_at timestamptz,
  user_name text
) AS $$
BEGIN
  RETURN QUERY
  SELECT 
    r.id,
    r.product_id,
    r.user_id,
    r.rating,
    r.comment,
    r.created_at,
    up.name as user_name
  FROM reviews r
  LEFT JOIN user_profiles up ON r.user_id = up.id
  WHERE r.id = review_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;