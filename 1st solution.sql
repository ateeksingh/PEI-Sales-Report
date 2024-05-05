use ateekdb;

WITH Cus as
(select o.Customer_ID, sum(o.Amount) as TotalAMT from [dbo].[Order] o group by o.Customer_ID),

Ship as
 (select s.Customer_ID, s.Status from [dbo].[Shipping] s 
 where s.Status='Pending'
 group by s.Status,s.Customer_ID ),

 Mergeda as
 (Select a.Status,b.TotalAMT,c.Country from Ship a 
 left join Cus b 
 on a.Customer_ID = b.Customer_ID
 left join [dbo].[Customer] c 
 on a.Customer_ID = c.Customer_ID)
 
 select f.Status, sum(f.TotalAMT) as TotalAmount,f.Country from Mergeda f group by f.Status,f.Country;