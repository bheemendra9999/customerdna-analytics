/* =====================================
   CUSTOMERDNA - SQL ANALYSIS
   ===================================== */

/* Business Question:
   What is the total revenue generated?
*/
SELECT ROUND(SUM(Revenue),2) AS Total_Revenue
FROM retail;


/* Business Question:
   Which countries generate the most revenue?
*/
SELECT Country,
       ROUND(SUM(Revenue),2) AS Revenue
FROM retail
GROUP BY Country
ORDER BY Revenue DESC;


/* Business Question:
   Who are the top customers by revenue?
*/
SELECT CustomerID,
       ROUND(SUM(Revenue),2) AS Revenue
FROM retail
GROUP BY CustomerID
ORDER BY Revenue DESC
LIMIT 10;


/* Business Question:
   Which products generate the highest revenue?
*/
SELECT Description,
       ROUND(SUM(Revenue),2) AS Revenue
FROM retail
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;


/* Business Question:
   What is the average order value?
*/
SELECT ROUND(
       SUM(Revenue)/COUNT(DISTINCT InvoiceNo),2
       ) AS Avg_Order_Value
FROM retail;


/* Business Question:
   How has revenue changed over time?
*/
SELECT YEAR(InvoiceDate) AS Year,
       MONTH(InvoiceDate) AS Month,
       ROUND(SUM(Revenue),2) AS Revenue
FROM retail
GROUP BY Year, Month
ORDER BY Year, Month;