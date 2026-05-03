# SQL Project: Most Expensive Product by Category

## Objective

Retrieve the most expensive product price for each category that contains at least 3 distinct products.

## Dataset Description

The project uses two tables:

* **category_list**

  * `ID` — unique category identifier
  * `NAME` — category name

* **product_list**

  * `ID` — unique product identifier
  * `NAME` — product name
  * `AMOUNT` — quantity in stock
  * `PRICE` — product price
  * `CATEGORY_ID` — reference to category

## SQL Solution

```sql
SELECT c.NAME AS category_name,
       MAX(p.PRICE) AS max_price
FROM product_list p
JOIN category_list c
  ON p.CATEGORY_ID = c.ID
GROUP BY c.NAME
HAVING COUNT(DISTINCT p.ID) >= 3
ORDER BY max_price ASC;
```

## Approach

* Joined `product_list` with `category_list`
* Grouped results by category
* Used `MAX()` to find the highest price
* Filtered categories with at least 3 distinct products
* Sorted results in ascending order

## Test Scenarios

* Category with less than 3 products → excluded
* Category with exactly 3 products → included
* Duplicate products → counted once
* Multiple categories → only valid ones returned

## Edge Cases

* Duplicate entries
* Empty categories
* Same price across multiple products

## Key Learnings

* Difference between `WHERE` and `HAVING`
* Importance of `COUNT(DISTINCT ...)`
* SQL aggregation and grouping

## How to Run

1. Create tables `category_list` and `product_list`
2. Insert sample data
3. Run the query in any SQL environment

---

