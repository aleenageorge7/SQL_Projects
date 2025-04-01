CREATE TABLE Product(ProductName VARCHAR(20),
Price FLOAT);

INSERT INTO public.product VALUES('Apple',2.50),
('Banana',1.50),
('Orange',3.00),
('Mango',2.00);

SELECT * FROM public.product;

CREATE TABLE Orderss(OrderId INT,
ProductID INT,
Quantity INT,
Sales FLOAT);

INSERT INTO public.orderss VALUES(1,1,10,25.00),
(2,1,5,12.50),
(3,2,8,12.00),
(4,3,12,36.00),
(5,4,6,12.00);

SELECT * FROM public.orderss;


CREATE VIEW prod_ord AS
SELECT * FROM public.product CROSS JOIN public.orderss;

SELECT * FROM public.prod_ord;

SELECT productname,sum(sales) AS TotalRevenue FROM public.prod_ord WHERE sales=price*quantity GROUP BY productname ORDER BY sum(sales) DESC,productname;