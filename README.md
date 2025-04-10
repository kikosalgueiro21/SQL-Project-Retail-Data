# Customer Analysis Project (WIP)

## Project Overview
This project analyzes customer data from the Kaggle "Customers Dataset." The goal is to gain insights into customer demographics and behaviors based on factors such as gender, age, and income.
This is a personal project where the objective was to build some common queries and get the Insights from the dataset. Because of this the focus on data cleaning was a bit skewed because i had some problems with it even though i noticed that the age and jobs were not showing or were 0 in some parts.
I tried to fix it but i was having issues and since my main focus was applying some other concepts i learned i ended up skipping over it. Since the data that is compromised makes up for a small ammount i went trough and did an analysis anyways.

## Data Description
The dataset consists of the following columns:
- **CustomerID**: Primary Key for each customer.
- **Gender**: The gender of the customer.
- **Age**: The age of the customer.
- **Annual Income ($)**: The annual income of the customer in USD.
- **Spending Score (1-100)**: A spending score assigned to the customer.
- **Profession**: The profession of the customer.
- **Work Experience**: The number of years the customer has been working.
- **Family Size**: The size of the customer’s family.

## Query Breakdown

## Key SQL Queries

1. **Customer Demographics:**
   - **Average Age, Maximum Age, Minimum Age:** This query calculates basic statistics (average, max, min) for customer age.
   - **Median Age:** Using window functions, we calculate the median age of customers.
   
2. **Customers by Age Groups:**
   - Divides customers into age groups and calculates the number of customers and their percentage in each group.

3. **Income and Spending Score:**
   - **Average Spending by Income:** Shows the average spending score for each income group.
   - **Average Income and Spending:** Displays the overall average income and spending score across all customers.

4. **Median Income and Spending:**
   - Calculates the median of both income and spending score by using window functions.

5. **Top Professions:**
   - Lists the most common professions among customers.

6. **Number of Customers by Gender:**
   - Counts the number of male and female customers.

7. **Average Spending Score by Age Group:**
   - Calculates the average spending score by different age groups.

8. **Family Size Distribution:**
   - Counts how many customers fall into each family size group.

9. **Work Experience by Profession:**
   - Averages the work experience of customers based on their profession.

10. **Top Professions by Average Income:**
    - Lists professions sorted by the average annual income of customers in each profession.

---

## Database Views:
- **Customer Summary View:** A view that provides a summary of key customer details (CustomerID, Gender, Age, Annual Income, Spending Score, Profession).

---

## Indexing (Example):
- **Gender Index:** An index is created on the `Gender` column to improve query performance when filtering by gender. For example, the query below is optimized with an index:
  ```sql
  SELECT CustomerID, Age, `Annual Income ($)`
  FROM customers
  WHERE Gender = 'Female';

## Analysis (WIP)

As this project is still in its early stages, the analysis is a work in progress and will be updated as I continue to clean the data and refine the queries.

### Key Findings:

1. **Customer Age:**
   - The average age of shoppers is 48.96 years, and the median age is 48. This data might be skewed due to the presence of 0-year-olds in the dataset, which could be erroneous or incomplete data.
   - When filtering for adult customers (18+), we observe a stark contrast across age groups. The largest group of shoppers are in the 50+ age group, accounting for over 65% of the total number of customers.

2. **Income and Spending Behavior:**
   - The average annual income of customers is approximately $110,731, with an average spending score of around 51 out of 100.
   - The median income and spending score are very close to the average, suggesting that the data doesn't show significant outliers at the high or low end of the income spectrum.

3. **Spending Score by Age Group:**
   - Younger age groups tend to have higher average spending scores compared to older age groups, indicating that younger customers might engage in more frequent or discretionary spending than older customers.

4. **Customer Professions:**
   - The majority of customers fall into the "Artist" profession, followed by "Healthcare" workers and "Engineers." This suggests that these professions are well-represented among the customer base.

5. **Gender Distribution:**
   - The dataset contains 1,186 female customers and 814 male customers, indicating a higher number of female customers. This could suggest that the retail store attracts more female shoppers.

6. **Family Size Distribution:**
   - Family sizes in the dataset vary from 1 to 7 members, with relatively even distribution across most family sizes.
   - There are outliers with family sizes of 8 and 9 members, with only 4 and 1 customers, respectively.


##Conclusion:

This project demonstrates the use of various SQL techniques such as aggregations, window functions, indexing, and creating views to extract valuable insights from the customer dataset. The queries allow us to understand customer demographics, income distributions, spending behavior, and more.


## Technologies Used
- MySQL
- SQL Workbench

## Running the Queries
1. Import the dataset into MySQL.
2. Execute the SQL queries using a MySQL client like SQL Workbench.