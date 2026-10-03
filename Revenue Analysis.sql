// Multi-Table Revenue Analysis
SELECT 
    b.title,
    SUM(o.quantity * b.price) AS total_revenue,
    COUNT(o.order_id) AS total_orders
FROM books b
JOIN orders o ON b.book_id = o.book_id
WHERE o.order_date >= '2025-01-01' 
  AND o.order_date <= '2025-12-31'
GROUP BY b.book_id, b.title
ORDER BY total_revenue DESC
LIMIT 3;
//Aggregation & Grouping
SELECT 
    b.genre,
    SUM(o.quantity) AS total_books_sold,
    ROUND(AVG(o.quantity), 2) AS avg_quantity_per_order
FROM books b
JOIN orders o ON b.book_id = o.book_id
GROUP BY b.genre
HAVING SUM(o.quantity) > 50;