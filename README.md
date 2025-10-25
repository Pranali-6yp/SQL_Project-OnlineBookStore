# SQL_Project-OnlineBookStore
SQL project analyzing online book store data to identify top-selling books, revenue trends, and customer insights using queries and aggregations.

# Project Overview
The **Online Book Store Analysis** project explores sales, customers, and inventory data to uncover insights about business performance. <br> 
This project uses **SQL queries** to analyze book sales, revenue trends, and customer behaviour for better decision-making.

# Objectives
•	Analyze book sales across categories and time periods <br> 
•	Identify top-selling authors and genres <br> 
•	Track revenue and customer purchase frequency <br> 
•	Improve marketing and inventory decisions using data insights  

# Sample Queries
-- Retreive all books in the 'Fiction' genre : <br>
SELECT 
    *
FROM
    book_online
WHERE
    Genre = 'Fiction'; <br>

 -- Retreive the total stock of books available : <br>
 SELECT 
    SUM(Stock) AS Total_Stock
FROM
    book_online;

# Repository Structure
•	Dataset: <a href="https://github.com/Pranali-6yp/SQL_Project-OnlineBookStore/blob/main/Books.csv" </a> <br>
            <a href="https://github.com/Pranali-6yp/SQL_Project-OnlineBookStore/blob/main/Customers.csv" </a> <br>
            <a href="https://github.com/Pranali-6yp/SQL_Project-OnlineBookStore/blob/main/Orders.csv" </a> <br>
•	SQL_Scripts: <a href="https://github.com/Pranali-6yp/SQL_Project-OnlineBookStore/blob/main/OnlineBookstore_sql.sql" </a> <br>


# Key Insights
•	Fiction and educational books generated the highest revenue <br>
•	Repeat customers contributed over 60% of total orders <br>
•	Peak sales occurred during the holiday season (Nov–Dec) <br>
•	Author loyalty significantly impacts repeat purchases

# Conclusion
This project demonstrates how SQL-based data analysis can help businesses understand sales trends, customer behaviour, and revenue performance in an online bookstore.
