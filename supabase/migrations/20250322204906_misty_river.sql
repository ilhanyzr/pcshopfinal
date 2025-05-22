/*
  # Fix Products Table RLS Policies

  1. Changes
    - Drop existing RLS policies
    - Create new policies with correct permissions
    - Add policy for admin access using auth.email()

  2. Security
    - Public read access for all users
    - Write access only for admin users
    - Uses auth.email() instead of direct users table access
*/

-- Drop existing policies
DROP POLICY IF EXISTS "Products are viewable by everyone" ON products;
DROP POLICY IF EXISTS "Only admins can modify products" ON products;

-- Allow public read access
CREATE POLICY "Products are viewable by everyone"
  ON products
  FOR SELECT
  TO public
  USING (true);

-- Allow admin write access (ALL includes INSERT, UPDATE, DELETE)
CREATE POLICY "Only admins can modify products"
  ON products
  FOR ALL
  TO authenticated
  USING (auth.email() = 'admin@example.com')
  WITH CHECK (auth.email() = 'admin@example.com');