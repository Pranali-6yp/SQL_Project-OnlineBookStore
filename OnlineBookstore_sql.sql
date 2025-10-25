Create database OnlineBookstore;

Drop Table if exists Books;

Create Table Books (Book_ID Serial Primary Key,
                    Title Varchar(100),
                    Author Varchar(100),
                    Genre Varchar(50),
                    Published_Year Int,
                    Price Numeric(10,2),
                    Stock Int);
		
 Drop Table if exists Customers;  
 
 Create Table Customers (Customer_ID Serial Primary Key,
                         Name Varchar(100),
                         Email Varchar(100),
                         Phone Varchar(15),
                         City Varchar(50),
                         Country Varchar(150)
                         );

Drop Table if exists Orders;
  
Create Table Orders (Order_ID Serial Primary Key,
					 Customer_ID INT references Customers(Customer_ID),
                     Book_ID INT references Books(Book_ID),
                     Order_Date date,
                     Quantity int,
                     Total_Amount numeric(10,2)
                     );
                     
select * from Books;
select * from Customers;
select * from Orders;    

select * from book_online;
select * from customer_online;
select * from Orders;   

# 1. Retreive all books in the 'Fiction' genre?
SELECT 
    *
FROM
    book_online
WHERE
    Genre = 'Fiction';

# 2.Find books published after the year 1950?
SELECT 
    *
FROM
    book_online
WHERE
    Published_Year > 1950;

# 3. List all customers from the canada?
SELECT 
    *
FROM
    customer_online
WHERE
    Country = 'Canada';

# 4. Show orders placed in November 2023?
SELECT 
    *
FROM
    orders
WHERE
    Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

# 5. Retreive the total stock of books available?
SELECT 
    SUM(Stock) AS Total_Stock
FROM
    book_online;

# 6. Find the details of the most expensive books?
SELECT 
    *
FROM
    book_online
ORDER BY Price DESC
LIMIT 1;

# 7. Show all customers who ordered more than 1 quantity of a book?
SELECT 
    *
FROM
    orders
WHERE
    Quantity > 1
ORDER BY Quantity ASC;
                          
# 8. Retreive all orders where the total amount exceeds $20?
SELECT 
    *
FROM
    orders
WHERE
    Total_Amount > 20;

# 9. List all Genre available in the books table?
select distinct Genre from book_online;

# 10. Find the book with the lowest stock?
SELECT 
    *
FROM
    book_online
ORDER BY Stock
LIMIT 1;

# 11. Calculate the total revenue generated from all orders?
SELECT 
    SUM(Total_Amount) AS Revenue
FROM
    orders;

# Advance Questions:

# 1. Retrieve the total number of books sold for each genre?
SELECT * FROM orders;

SELECT 
    b.Genre, SUM(o.Quantity) AS Total_Books_sold
FROM
    orders o
        JOIN
    book_online b ON o.Book_ID = b.Book_ID
GROUP BY b.Genre;

# 2. Find the average price of books in the "Fantasy" genre?
SELECT 
    AVG(Price) AS Average_Price
FROM
    book_online
WHERE
    Genre = 'Fantasy';

# 3. List customers who have placed at least 2 orders?
SELECT 
    o.Customer_ID, c.name, COUNT(o.Order_ID) AS ORDER_COUNT
FROM
    orders o
        JOIN
    customer_online c ON o.Customer_ID = c.Customer_ID
GROUP BY o.Customer_ID , c.name
HAVING COUNT(Order_ID) >= 2;

# 4. Find the most frequently ordered book?
SELECT 
    o.Book_ID, b.Title, COUNT(o.Order_ID) AS ORDER_COUNT
FROM
    orders o
        JOIN
    book_online b ON o.Book_ID = b.Book_ID
GROUP BY o.Book_ID , b.Title
ORDER BY ORDER_COUNT DESC
LIMIT 1;

# 5. Show the top 3 most expensive books of 'Fantasy' Genre ?
SELECT 
    *
FROM
    book_online
WHERE
    Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;
             
# 6. Retrieve the total quantity of books sold by each author?
SELECT 
    b.Author, SUM(o.Quantity) AS Total_Books_Sold
FROM
    orders o
        JOIN
    book_online b ON o.Book_ID = b.Book_ID
GROUP BY b.Author;
                         
 # 7. List the cities where customers who spent over $30 are located?
SELECT DISTINCT
    c.City, Total_Amount
FROM
    orders o
        JOIN
    customer_online c ON o.Customer_ID = c.Customer_ID
WHERE
    o.Total_Amount > 30;
 
# 8. Find the customer who spent the most on orders?
SELECT 
    c.Customer_ID, c.name, SUM(o.Total_Amount) AS Total_Spent
FROM
    orders o
        JOIN
    customer_online c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID , c.name
ORDER BY Total_Spent DESC
LIMIT 1; 

# 9. Calculate the stock remaining after fulfilling all orders?
SELECT 
    b.Book_ID,
    b.Title,
    b.Stock - IFNULL(SUM(o.Quantity), 0) AS Remaining_Stock
FROM
    book_online b
        LEFT JOIN
    orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID , b.Title , b.Stock;

                         
                         
                         
                         