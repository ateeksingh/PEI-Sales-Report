Use ateekdb;
 
SELECT TOP 1
    c.Country,
    COUNT(o.Order_ID) AS TotalTransactions,
    SUM(o.Amount) AS TotalSalesAmount
FROM 
    [dbo].[Order] o
JOIN 
    Customer c ON o.Customer_ID = c.Customer_ID
GROUP BY 
    c.Country
ORDER BY 
    TotalTransactions ASC, TotalSalesAmount ASC
;

