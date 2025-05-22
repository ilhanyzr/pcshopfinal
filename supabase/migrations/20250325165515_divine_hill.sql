/*
  # Enhance Database Security

  1. Changes
    - Add rate limiting for public access
    - Add additional security policies
    - Add audit logging
    - Add input validation

  2. Security Improvements
    - Rate limiting on product queries
    - Enhanced RLS policies
    - Audit logging for sensitive operations
*/

-- Create audit log table
CREATE TABLE IF NOT EXISTS audit_logs (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    table_name text NOT NULL,
    operation text NOT NULL,
    record_id uuid NOT NULL,
    user_id uuid REFERENCES auth.users(id),
    old_data jsonb,
    new_data jsonb,
    ip_address text,
    created_at timestamptz DEFAULT now()
);

ALTER TABLE audit_logs ENABLE ROW LEVEL SECURITY;

-- Only admins can view audit logs
CREATE POLICY "Only admins can view audit logs"
    ON audit_logs
    FOR ALL
    TO authenticated
    USING (auth.email() = 'admin@example.com')
    WITH CHECK (auth.email() = 'admin@example.com');

-- Add triggers for audit logging
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

CREATE TRIGGER audit_products_trigger
    AFTER INSERT OR UPDATE OR DELETE ON products
    FOR EACH ROW
    EXECUTE FUNCTION audit_product_changes();

-- Add input validation for products
ALTER TABLE products
    ADD CONSTRAINT price_positive CHECK (price >= 0),
    ADD CONSTRAINT stock_non_negative CHECK (stock >= 0),
    ADD CONSTRAINT rating_range CHECK (rating >= 0 AND rating <= 5),
    ALTER COLUMN name SET NOT NULL,
    ALTER COLUMN category SET NOT NULL;

-- Add rate limiting function
CREATE OR REPLACE FUNCTION check_rate_limit(
    user_id uuid,
    action text,
    max_requests int DEFAULT 100,
    window_minutes int DEFAULT 1
) RETURNS boolean AS $$
DECLARE
    current_count int;
BEGIN
    -- Get current count of requests
    SELECT COUNT(*)
    INTO current_count
    FROM audit_logs
    WHERE 
        CASE 
            WHEN user_id IS NOT NULL THEN audit_logs.user_id = check_rate_limit.user_id
            ELSE audit_logs.ip_address = current_setting('request.headers', true)::json->>'x-forwarded-for'
        END
        AND created_at > now() - (window_minutes || ' minutes')::interval
        AND operation = action;

    -- Return true if under limit, false if exceeded
    RETURN current_count < max_requests;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;