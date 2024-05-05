Use ateekdb;


WITH Age_Category AS (
    SELECT 
        CASE 
            WHEN c.Age < 30 THEN 'Less than 30'
            ELSE 'Above 30'
        END AS Age_Category,
        o.Item,
        COUNT(o.Item) AS Total_Transactions
    FROM [dbo].[Order] o
    INNER JOIN Customer c ON o.Customer_ID = c.Customer_ID
    GROUP BY 
        CASE 
            WHEN c.Age < 30 THEN 'Less than 30'
            ELSE 'Above 30'
        END,
        o.Item
)

SELECT 
    Age_Category,
    Item,
  Total_Transactions
FROM (
    SELECT 
        Age_Category,
        Item,
        Total_Transactions,
        ROW_NUMBER() OVER (PARTITION BY Age_Category ORDER BY Total_Transactions DESC) AS RowNum
    FROM Age_Category
) AS Ranked
WHERE RowNum = 1;
