CREATE DATABASE customer_data;
USE customer_data;

-- Looking for NULLS or Empty Rows
SELECT 
    *
FROM
    customers
WHERE
    CustomerID IS NULL OR Gender IS NULL
        OR Age IS NULL
        OR `Annual Income ($)` IS NULL
        OR `Spending Score (1-100)` IS NULL
        OR Profession IS NULL
        OR `Work Experience` IS NULL
        OR `Family Size` IS NULL
        OR CustomerID = ''
        OR Gender = ''
        OR Age = ''
        OR `Annual Income ($)` = ''
        OR `Spending Score (1-100)` = ''
        OR Profession = ''
        OR `Work Experience` = ''
        OR `Family Size` = '';
    
    -- Setting invalid ages to NULL.
DELETE FROM customers
WHERE Age <= 0 OR Age > 140;

UPDATE customers 
SET 
    Profession = 'Unemployed'
WHERE
    TRIM(Profession) = ''
        OR Profession IS NULL;
SELECT 
    *
FROM
    customers
WHERE
    Profession = 'Unemployed';
-- Since the data is already Normalized no need todo anything regarding that otherwise we could use UPDATE.

SELECT 
    Gender,
    Age,
    `Annual Income ($)`,
    `Spending Score (1-100)`,
    Profession,
    `Work Experience`,
    `Family Size`,
    COUNT(*) AS duplicate_count
FROM
    customers
GROUP BY Gender , Age , `Annual Income ($)` , `Spending Score (1-100)` , Profession , `Work Experience` , `Family Size`
HAVING COUNT(*) > 1;

-- Since there are no duplicates no need to do anything else when it comes to cleaning data.


