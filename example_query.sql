SET SEARCH_PATH TO 'demo';

-- Top customer in France, by total quantity across all orders
-- Also output the total order count

SELECT
    c.customer_id,
    COUNT(*) AS total_order_count,
    SUM(quantity) AS total_quantity
FROM order_details od
    JOIN orders o ON od.order_id = o.order_id
    JOIN customers c ON o.customer_id = c.customer_id AND c.country = 'France'
GROUP BY 1
ORDER BY 3 DESC
LIMIT 1;