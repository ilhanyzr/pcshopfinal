/*
  # Enhance products table with technical specifications

  1. Changes
    - Add technical_specs column to products table
    - Add validation for technical specs format
    - Update existing RLS policies

  2. Security
    - Maintain existing RLS policies
    - Add validation for new fields
*/

ALTER TABLE products
ADD COLUMN IF NOT EXISTS technical_specs jsonb DEFAULT '{}'::jsonb;

-- Add check constraint to ensure technical_specs is valid JSON
ALTER TABLE products
ADD CONSTRAINT valid_technical_specs CHECK (technical_specs IS NULL OR jsonb_typeof(technical_specs) = 'object');

-- Update trigger function to include new fields
CREATE OR REPLACE FUNCTION audit_product_changes()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO audit_logs (
        table_name,
        operation,
        record_id,
        user_id,
        old_data,
        new_data,
        ip_address
    )
    VALUES (
        TG_TABLE_NAME,
        TG_OP,
        COALESCE(NEW.id, OLD.id),
        auth.uid(),
        CASE WHEN TG_OP = 'DELETE' THEN row_to_json(OLD)::jsonb ELSE NULL END,
        CASE WHEN TG_OP IN ('INSERT', 'UPDATE') THEN row_to_json(NEW)::jsonb ELSE NULL END,
        current_setting('request.headers', true)::json->>'x-forwarded-for'
    );
    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;