-- Customer Demopgrahics (AVG AGE, MAX AGE, MIN AGE, MEDIAN AGE)
SELECT 
    AVG(age) AS average_age,
    MAX(age) AS max_age,
    MIN(age) AS min_age
FROM
    customers
ORDER BY age;

-- Median Age

WITH RankedAges AS (
    SELECT age,
           ROW_NUMBER() OVER (ORDER BY age) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM customers
)
SELECT 
    AVG(age) AS median_age
FROM RankedAges
WHERE row_num IN (
    (total_count + 1) / 2,       -- Middle row (for odd counts)
    (total_count + 2) / 2        -- Middle row (for even counts)
);

-- Customers (adults) by age groups + percentage of customers by age groups.
SELECT 
    CASE
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 41 THEN '35-41'
        WHEN age BETWEEN 42 AND 49 THEN '42-49'
        ELSE '50+'
    END AS age_group,
    COUNT(*) AS number_of_customers,
    ROUND(COUNT(*) / (SELECT 
                    COUNT(*)
                FROM
                    customers) * 100,
            2) AS percentage
FROM
    customers
GROUP BY age_group
ORDER BY CASE
    WHEN age_group = '18-24' THEN 1
    WHEN age_group = '25-34' THEN 2
    WHEN age_group = '35-41' THEN 3
    WHEN age_group = '42-49' THEN 4
    ELSE 5
END;

-- Income and Spending Score
SELECT 
    `Annual Income ($)`,
    AVG(`Spending Score (1-100)`) AS avg_spending
FROM
    customers
GROUP BY `Annual Income ($)`
ORDER BY `Annual Income ($)` DESC;

-- AVG Income of the Customers and AVG spending.
SELECT 
    AVG(`Annual Income ($)`) AS avg_income,
    AVG(`Spending Score (1-100)`) AS avg_spending
FROM
    customers;


-- Median Income and Median AVG spending
WITH RankedIncome AS (
    SELECT 
        `Annual Income ($)`,
        ROW_NUMBER() OVER (ORDER BY `Annual Income ($)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM customers
),
RankedSpending AS (
    SELECT 
        `Spending Score (1-100)`,
        ROW_NUMBER() OVER (ORDER BY `Spending Score (1-100)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM customers
),
MedianIncome AS (
    SELECT `Annual Income ($)`
    FROM RankedIncome
    WHERE row_num IN ((total_count + 1) / 2, (total_count + 2) / 2)
),
MedianSpending AS (
    SELECT `Spending Score (1-100)`
    FROM RankedSpending
    WHERE row_num IN ((total_count + 1) / 2, (total_count + 2) / 2)
)
SELECT 
    (SELECT `Annual Income ($)` FROM MedianIncome) AS median_income,
    (SELECT `Spending Score (1-100)` FROM MedianSpending) AS median_spending_score;
    
    -- Top Jobs
    
SELECT 
    Profession, COUNT(Profession) AS profession_count
FROM
    customers
GROUP BY Profession
ORDER BY Profession;

-- Number of Customers by Gender

SELECT 
    Gender, COUNT(*) AS number_of_customers
FROM
    customers
GROUP BY Gender;

-- AVG Spending Score by Age Group
SELECT 
    CASE
        WHEN Age BETWEEN 18 AND 24 THEN '18-24'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        WHEN Age >= 55 THEN '55+'
    END AS age_group,
    AVG(`Spending Score (1-100)`) AS average_spending_score
FROM
    customers
GROUP BY age_group
ORDER BY CASE
    WHEN age_group = '18-24' THEN 1
    WHEN age_group = '25-34' THEN 2
    WHEN age_group = '35-44' THEN 3
    WHEN age_group = '45-54' THEN 4
    ELSE 5
END;

-- Number of Customers by Family Size Group
SELECT 
    `Family Size`, COUNT(*) AS number_of_customers
FROM
    customers
GROUP BY `Family Size`;

-- Work Experience by Profession
SELECT 
    Profession, AVG(`Work Experience`) AS avg_work_experience
FROM
    customers
GROUP BY Profession;

-- Top Professions with Highest avg Annual Income

SELECT 
    Profession, AVG(`Annual Income ($)`) AS average_income
FROM
    customers
GROUP BY Profession
ORDER BY average_income DESC;

-- Testing VIEWS

CREATE VIEW customer_summary AS
    SELECT 
        CustomerID,
        Gender,
        Age,
        `Annual Income ($)`,
        `Spending Score (1-100)`,
        Profession
    FROM
        customers;

SELECT 
    *
FROM
    customer_summary;

-- A typical sales report.
SELECT 
    Gender,
    AVG(`Annual Income ($)`) AS avg_income,
    AVG(`Spending Score (1-100)`) AS avg_spending
FROM
    customers
GROUP BY Gender;

-- Index experimentation ( an example since its not necessary for this project since the number of rows on the table are very small)
CREATE INDEX idx_gender ON customers (Gender);

-- Would improve performance on Queries like this one bellow.

SELECT 
    CustomerID, Age, `Annual Income ($)`
FROM
    customers
WHERE
    Gender = 'Female';
















    
    






   