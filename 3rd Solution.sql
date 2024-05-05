Use ateekdb;


SELECT c.Country, Count(o.Order_ID) AS Quantity,Sum(o.Amount) As SumAmount
FROM [dbo].[Customer] c
JOIN [dbo].[Order] o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Country
ORDER BY Quantity desc;