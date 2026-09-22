-- 06_functions.sql
-- PostgreSQL stored functions

CREATE OR REPLACE FUNCTION get_customer_total_spend(p_customer_id INTEGER)
RETURNS NUMERIC(12,2)
LANGUAGE plpgsql
AS $$
DECLARE
    total_spend NUMERIC(12,2);
BEGIN
    SELECT COALESCE(SUM(total_amount), 0)
    INTO total_spend
    FROM orders
    WHERE customer_id = p_customer_id
      AND status = 'Completed';

    RETURN total_spend;
END;
$$;

CREATE OR REPLACE FUNCTION get_product_stock_status(p_product_id INTEGER)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
    current_qty INTEGER;
    reorder_qty INTEGER;
BEGIN
    SELECT quantity, reorder_level
    INTO current_qty, reorder_qty
    FROM inventory
    WHERE product_id = p_product_id;

    IF current_qty IS NULL THEN
        RETURN 'Product not found';
    ELSIF current_qty <= reorder_qty THEN
        RETURN 'REORDER REQUIRED';
    ELSE
        RETURN 'Stock Healthy';
    END IF;
END;
$$;

-- Function examples
SELECT get_customer_total_spend(1);
SELECT get_product_stock_status(4);
