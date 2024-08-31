CREATE DATABASE wal;
USE wal;

SELECT *
FROM walmatty;
---Generic--
--how many unique cities does the data have--
SELECT  
 DISTINCT City
FROM walmatty;

SELECT 
DISTINCT Branch
FROM walmatty;

SELECT 
DISTINCT City,
Branch
FROM walmatty;

---PRODUCT--
--how many unique productline does the data have(COUNT)--
SELECT
 COUNT (DISTINCT Product_line) AS COUNT_OF_PRODUCT_LINE
FROM walmatty;

-- What is the most common payment method--
SELECT
payment,
COUNT(payment) AS count_of_payment
FROM walmatty
GROUP BY Payment
ORDER BY count_of_payment DESC;

--What is the most selling product line--
SELECT 
Product_line,
COUNT(Product_line) AS count
FROM walmatty
GROUP BY Product_line
ORDER BY count DESC;

--What product line had the largest revenue--
SELECT 
Product_line,
SUM(Total) AS revenue
FROM walmatty
GROUP BY Product_line
ORDER BY revenue DESC;

--what city has the largest revenue--
SELECT  
City,
SUM(Total) AS revenue
FROM walmatty
GROUP BY City
ORDER BY revenue DESC;

--what productline had the largest VAT--
SELECT 
Product_line,
 AVG (Tax_5) AS vat
FROM walmatty
GROUP BY Product_line
ORDER BY vat DESC;

--Which  branch sold more products than the average sold--
SELECT 
Branch,
SUM(Quantity) AS qty
FROM walmatty
GROUP BY Branch;

--What is the most common productline by gender--
SELECT 
Product_line,
Gender,
COUNT(Gender) AS count
FROM walmatty
GROUP BY Product_line, Gender
ORDER BY count DESC;

--what is the average rating of each productline--
SELECT Product_line,
ROUND (AVG(rating),2)AS ratings
FROM walmatty
GROUP BY  Product_line;

---------SALES-------
--which customer type brings the most revenue--
SELECT 
Customer_type,
SUM(Total) AS count
FROM walmatty
GROUP BY Customer_type
ORDER BY Customer_type DESC;

--Which city has the largest tax percent or VAT--
SELECT 
City,
AVG(TAX_5) as  count_of_vat
FROM walmatty
GROUP BY City
ORDER BY count_of_vat DESC;

--which customer type pays the most in VAT--
SELECT
Customer_type,
AVG(TAX_5) AS count
FROM walmatty
GROUP BY Customer_type
ORDER BY count DESC;


------CUSTOMERS----
----how many unique customer types does the data have---
SELECT
DISTINCT(Customer_type) 
FROM walmatty;

--how many unique payment methods does the data have--
SELECT 
DISTINCT(Payment)
FROM walmatty;

--Which customer type buys the most --
SELECT Customer_type,
COUNT(*) AS count_of_customer
FROM walmatty
GROUP BY Customer_type;

---what is the gender of most of the customers---
SELECT Gender,
COUNT(*) AS gender_count
FROM walmatty
GROUP BY Gender;

---What is the gender distribution per branch--
SELECT
Gender,
COUNT(*) AS gender_count
FROM walmatty
WHERE Branch='A'
GROUP BY Gender
ORDER BY gender_count DESC;

SELECT
Gender,
COUNT(*) AS gender_count
FROM walmatty
WHERE Branch='B'
GROUP BY Gender
ORDER BY gender_count DESC;

SELECT
Gender,
COUNT(*) AS gender_count
FROM walmatty
WHERE Branch='C'
GROUP BY Gender
ORDER BY gender_count DESC;

----Which day of the week has the best average ratings per bramch --
SELECT 
   day_name,
   AVG(rating) AS avg-rating
   FROM walmatty
   WHERE Branch ='A'
   GROUP BY day_name
   ORDER BY avg_rating DESC;

