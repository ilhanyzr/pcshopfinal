/*
  # Update orders RLS policies
  
  1. Changes
    - Update RLS policies to use auth.uid() for consistency
    - Drop and recreate policies for orders table
  
  2. Security
    - Maintains same security level with updated syntax
    - Ensures users can only access their own orders
*/

-- Update RLS policies to use auth.uid()
DROP POLICY IF EXISTS "Users can create own orders" ON orders;
CREATE POLICY "Users can create own orders" 
ON orders FOR INSERT 
TO authenticated 
WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can view own orders" ON orders;
CREATE POLICY "Users can view own orders" 
ON orders FOR SELECT 
TO authenticated 
USING (auth.uid() = user_id);