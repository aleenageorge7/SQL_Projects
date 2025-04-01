CREATE TABLE Market(CustomerID INT,
ProductID VARCHAR(1),
PurchaseDate DATE,
Quantity INT,
Revenue FLOAT);

INSERT INTO public.market VALUES(1,'A','2023-01-01',5,100.00),
(2,'B','2023-01-02',3,50.00),
(3,'A','2023-01-03',2,30.00),
(4,'C','2023-01-03',1,20.00),
(1,'B','2023-01-04',4,80.00);

SELECT * FROM public.market;

------Total Revenue
SELECT sum(revenue) AS TotalRevenue FROM public.market;

------total sales by product 
SELECT productid,sum(quantity) AS TotalQuantity,sum(revenue) AS totalSales FROM public.market GROUP BY productid ORDER BY productid;

------top customer by Revenue
SELECT customerid,sum(revenue) AS totalrevenue FROM public.market GROUP BY customerid ORDER BY customerid;