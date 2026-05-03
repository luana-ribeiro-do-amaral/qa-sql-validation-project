SELECT c.NAME AS category_name,
       MAX(p.PRICE) AS max_price
FROM product_list p
JOIN category_list c
  ON p.CATEGORY_ID = c.ID
GROUP BY c.NAME
HAVING COUNT(DISTINCT p.ID) >= 3
ORDER BY max_price ASC;
