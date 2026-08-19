CREATE DATABASE RetailSalesDB;
GO
USE RetailSalesDB;
GO

USE RetailSalesDB;
GO

CREATE TABLE Transactions (
    customer_id VARCHAR(20),
    trans_date DATE,
    tran_amount DECIMAL(10,2)
);
CREATE TABLE CustomerResponse (
    customer_id VARCHAR(20),
    response INT
);
SELECT TOP 10 *
FROM dbo.Retail_Data_Transactions;
SELECT COUNT(*) AS TotalRows
FROM dbo.Retail_Data_Transactions;

SELECT TOP 10 *
FROM dbo.Retail_Data_Response;
SELECT COUNT(*) AS TotalCustomers
FROM dbo.Retail_Data_Response;

SELECT SUM(tran_amount) AS Total_Revenue
FROM Retail_Data_Transactions;

SELECT COUNT(*) AS Total_Transactions
FROM Retail_Data_Transactions;

SELECT COUNT(DISTINCT customer_id) AS Unique_Customers
FROM Retail_Data_Transactions;

SELECT
    AVG(tran_amount) AS Average_Transaction_Value
FROM Retail_Data_Transactions;

SELECT TOP 10
    customer_id,
    SUM(tran_amount) AS Total_Spent
FROM Retail_Data_Transactions
GROUP BY customer_id
ORDER BY Total_Spent DESC;

SELECT
    response,
    COUNT(*) AS Customer_Count
FROM Retail_Data_Response
GROUP BY response;

SELECT
    r.response,
    AVG(t.tran_amount) AS Avg_Spend
FROM Retail_Data_Transactions t
INNER JOIN Retail_Data_Response r
ON t.customer_id = r.customer_id
GROUP BY r.response;

SELECT
    YEAR(trans_date) AS Sales_Year,
    MONTH(trans_date) AS Sales_Month,
    SUM(tran_amount) AS Total_Sales
FROM Retail_Data_Transactions
GROUP BY
    YEAR(trans_date),
    MONTH(trans_date)
ORDER BY
    Sales_Year,
    Sales_Month;


    SELECT TOP 10
    customer_id,
    COUNT(*) AS Number_Of_Transactions
FROM Retail_Data_Transactions
GROUP BY customer_id
ORDER BY Number_Of_Transactions DESC;