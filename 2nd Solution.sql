Use ateekdb;


SELECT c.Customer_ID, c.First, c.Last, COUNT(o.Order_ID) AS TotalTransactions, 
       SUM(o.Amount) AS TotalAmountSpent, 
       COUNT(o.Order_ID) AS TotalQuantitySold, o.Item
FROM [dbo].[Customer] c
JOIN [dbo].[Order] o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.First, c.Last, o.Item;
