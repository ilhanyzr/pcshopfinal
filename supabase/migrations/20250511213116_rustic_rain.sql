/*
  # Add payment method to orders

  1. Changes
    - Add payment_method column to orders table with valid payment types
    - Set default value to 'bank_transfer'
    - Add check constraint for valid payment methods
*/

ALTER TABLE orders 
ADD COLUMN IF NOT EXISTS payment_method text 
DEFAULT 'bank_transfer'
CHECK (payment_method IN ('bank_transfer', 'credit_card', 'crypto'));

-- Update existing orders to have the default payment method
UPDATE orders SET payment_method = 'bank_transfer' WHERE payment_method IS NULL;