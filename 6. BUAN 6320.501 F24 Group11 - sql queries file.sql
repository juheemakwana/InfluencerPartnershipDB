set search_path to influencer_partnership
--Q1: Select all columns and all rows from one table (5 points)
SELECT * FROM content_creation;

--Q2: Select five columns and all rows from one table (5 points)
SELECT product_id, product_name, category, price, manufacturer_country
FROM product;

--Q3: Select all columns from all rows from one view (5 points)
SELECT * FROM ProductInfo;

--Q4: Using a join on 2 tables, select all columns and all rows from the tables without the use of a Cartesian product (5 points)
SELECT * FROM product p
JOIN brand b
ON p.brand_id = b.brand_id ;

--Q5: Select and order data retrieved from one table (5 points)
SELECT * FROM contract
ORDER BY pay DESC ;

--Q6: Using a join on 3 tables, select 5 columns from the 3 tables. Use syntax that would limit the output to 3 rows (5 points)
SELECT c.contract_id, i.first_name, i.last_name, p.product_name, p.price
FROM contract c
JOIN influencer i ON c.influencer_id = i.influencer_id
JOIN product p ON c.brand_id = p.brand_id
LIMIT 3;

--Q7: Select distinct rows using joins on 3 tables (5 points)
SELECT DISTINCT 
i.first_name, i.last_name, p.product_name, b.brand_name, c.pay
FROM contract c
JOIN influencer i ON c.influencer_id = i.influencer_id
JOIN product p ON c.brand_id = p.brand_id
JOIN brand b ON p.brand_id = b.brand_id;

--Q8: Use GROUP BY and HAVING in a select statement using one or more tables (5 points)
SELECT i.first_name, i.last_name, COUNT(c.contract_id) AS total_contracts, SUM(c.pay) AS total_earnings
FROM influencer i
JOIN contract c ON i.influencer_id = c.influencer_id
GROUP BY i.first_name, i.last_name
HAVING SUM(c.pay) > 10000;

--Q9: Use IN clause to select data from one or more tables (5 points)
SELECT p.product_name, p.category, p.price
FROM product p
WHERE p.brand_id IN (
    SELECT b.brand_id FROM brand b
    WHERE b.industry IN ('Technology', 'Fashion')
);

--Q10: Select length of one column from one table (use LENGTH function) (5 points)
SELECT first_name, LENGTH(first_name) AS name_length
FROM influencer;

--Q11: Delete one record from one table. Use select statements to demonstrate the table contents before and after the DELETE statement. 
--	Make sure you use ROLLBACK afterwards so that the data will not be physically removed (5 points)
-- View Table Contents Before Delete
SELECT * FROM content_creation;
BEGIN;
DELETE FROM content_creation
WHERE post_id = 10031;
-- View Table Contents After Delete
SELECT * FROM content_creation;
-- Rollback the Transaction
ROLLBACK;
-- Verify Table Contents After Rollback
SELECT * FROM content_creation;

--Q12: Update one record from one table. Use select statements to demonstrate the table contents before and after the UPDATE statement. 
--	Make sure you use ROLLBACK afterwards so that the data will not be physically removed (5 points)
-- Q12: Update a record and demonstrate using ROLLBACK

-- View Table Contents Before Update
SELECT * FROM influencer;
-- Start a Transaction
BEGIN;
-- Update a Record
UPDATE influencer
SET platform = 'TikTok'
WHERE influencer_id = 101;
-- View Table Contents After Update
SELECT * FROM influencer;
-- Rollback the Transaction
ROLLBACK;
-- Verify Table Contents After Rollback
SELECT * FROM influencer;

--Q13: Classify each influencer by type (nano, micro, macro, or celebrity) based on their follower count.
SELECT
	i.influencer_id,
	i.first_name,
	i.last_name,
	CASE
		WHEN follower_count >= 190000 THEN 'Celebrity'
		WHEN follower_count >= 100000 THEN 'Macro'
		WHEN follower_count >= 10000 THEN 'Micro'
		ELSE 'Nano'
	END AS influencer_type
FROM
	influencer i ;

--Q14: Identify the Top 3 Most Profitable Products per Brand
SELECT 
    b.brand_name,
    p.product_name,
    SUM(pm.revenue) AS total_revenue
FROM 
    product p
JOIN 
    performance_metrics pm ON p.product_id = pm.product_id
JOIN 
    brand b ON p.brand_id = b.brand_id
GROUP BY 
    b.brand_name, p.product_name
HAVING 
    SUM(pm.revenue) > 0
ORDER BY 
    b.brand_name, total_revenue DESC
LIMIT 3;