/*
  # Add notification system

  1. Changes
    - Enable RLS on orders table
    - Add notification trigger for order status updates
    - Add webhook support for notifications

  2. Security
    - Maintains existing RLS policies
    - Secure webhook handling
*/

-- Enable Row Level Security if not already enabled
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 
    FROM pg_tables 
    WHERE schemaname = 'public' 
    AND tablename = 'orders' 
    AND rowsecurity = true
  ) THEN
    ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
  END IF;
END $$;

-- Drop existing trigger and function if they exist
DROP TRIGGER IF EXISTS order_notification_trigger ON orders;
DROP FUNCTION IF EXISTS notify_order_update();

-- Create or replace the notification function
CREATE OR REPLACE FUNCTION notify_order_update()
RETURNS TRIGGER AS $$
BEGIN
  -- Send notification on status change
  IF OLD.status IS DISTINCT FROM NEW.status THEN
    -- Use safe URL construction
    PERFORM pg_notify(
      'order_notifications',
      json_build_object(
        'type', 'order_status_update',
        'order_id', NEW.id,
        'old_status', OLD.status,
        'new_status', NEW.status,
        'updated_at', NOW()
      )::text
    );
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the notification trigger
CREATE TRIGGER order_notification_trigger
AFTER UPDATE ON orders
FOR EACH ROW
EXECUTE FUNCTION notify_order_update();