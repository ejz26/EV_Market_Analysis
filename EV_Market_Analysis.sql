-- Q1. Which EV brands have the highest total annual sales?
SELECT 
    brand,
    SUM(annual_sales_units) AS total_annual_sales
FROM ev
GROUP BY brand
ORDER BY total_annual_sales DESC
limit 10;

-- Q2. What is the average price by brand?
SELECT 
    brand,
    ROUND(AVG(price_usd)::numeric, 2) AS average_price
FROM ev
GROUP BY brand
ORDER BY average_price DESC
limit 10;

-- Q3. Which EV models have the highest average customer ratings?
SELECT
    brand,
    model,
    ROUND(AVG(customer_rating)::numeric, 2) AS average_customer_rating
FROM ev
GROUP BY brand, model
ORDER BY average_customer_rating DESC
limit 10;

-- Q4. Which brands offer the longest average driving range?
   Select 
	brand,
    ROUND(AVG(range_miles)::numeric, 2) AS average_range
FROM ev
GROUP BY brand
ORDER BY average_range DESC
LIMIT 10;

-- Q5. Which market segments generate the most sales?
SELECT
    market_segment,
    SUM(annual_sales_units) AS total_sales
FROM ev
GROUP BY market_segment
ORDER BY total_sales DESC;

-- Q6. Which vehicles offer the best range per dollar?
SELECT
    brand,
    model,
    price_usd,
    range_miles,
    ROUND((range_miles / price_usd)::numeric, 4) AS range_per_dollar
FROM ev
ORDER BY range_per_dollar DESC
LIMIT 10;

-- Q7. Which brands have the fastest average charging speeds?
SELECT
    brand,
    ROUND(AVG(charging_speed_kw)::numeric, 2) AS average_charging_speed
FROM ev
GROUP BY brand
ORDER BY average_charging_speed DESC
LIMIT 10;

-- Q8. Which market segments have the highest average customer ratings?
SELECT
    market_segment,
    ROUND(AVG(customer_rating)::numeric, 2) AS average_customer_rating
FROM ev
GROUP BY market_segment
ORDER BY average_customer_rating DESC;

-- Q9. Which price range has the highest sales?
SELECT
    CASE
        WHEN price_usd < 30000 THEN 'Under $30k'
        WHEN price_usd BETWEEN 30000 AND 49999 THEN '$30k-$49k'
        WHEN price_usd BETWEEN 50000 AND 69999 THEN '$50k-$69k'
        WHEN price_usd BETWEEN 70000 AND 99999 THEN '$70k-$99k'
        ELSE '$100k+'
    END AS price_range,
    SUM(annual_sales_units) AS total_sales
FROM ev
GROUP BY price_range
ORDER BY total_sales DESC;

-- Q10. Which body type has the highest average range?
SELECT
    body_type,
    ROUND(AVG(range_miles)::numeric, 2) AS average_range
FROM ev
GROUP BY body_type
ORDER BY average_range DESC;

-- Q11. Which brands dominate each market segment?
SELECT
    market_segment,
    brand,
    SUM(annual_sales_units) AS total_sales
FROM ev
GROUP BY market_segment, brand
ORDER BY market_segment, total_sales DESC;

-- Q12. Which market segment represents the biggest opportunity for Tesla?
SELECT
    market_segment,
    SUM(annual_sales_units) AS total_sales,
    ROUND(AVG(customer_rating)::numeric, 2) AS avg_rating,
    COUNT(DISTINCT model) AS number_of_models
FROM ev
GROUP BY market_segment
ORDER BY total_sales DESC, avg_rating DESC, number_of_models ASC;

-- Q13. Which body type represents the biggest opportunity for Tesla?
SELECT
    body_type,
    SUM(annual_sales_units) AS total_sales,
    ROUND(AVG(customer_rating)::numeric, 2) AS average_rating,
    COUNT(DISTINCT model) AS number_of_models
FROM ev
GROUP BY body_type
ORDER BY total_sales DESC, average_rating DESC, number_of_models ASC;

-- Q14. What price range represents the biggest opportunity for Tesla?
SELECT
    CASE
        WHEN price_usd < 30000 THEN 'Under $30k'
        WHEN price_usd BETWEEN 30000 AND 49999 THEN '$30k-$49k'
        WHEN price_usd BETWEEN 50000 AND 69999 THEN '$50k-$69k'
        WHEN price_usd BETWEEN 70000 AND 99999 THEN '$70k-$99k'
        ELSE '$100k+'
    END AS price_range,
    SUM(annual_sales_units) AS total_sales,
    ROUND(AVG(customer_rating)::numeric, 2) AS average_rating,
    COUNT(DISTINCT model) AS number_of_models
FROM ev
GROUP BY price_range
ORDER BY total_sales DESC, average_rating DESC, number_of_models ASC;