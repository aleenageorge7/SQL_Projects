CREATE TABLE Products(ProductID INT, 
ProductName VARCHAR(100) NOT NULL,
SellingPrice FLOAT);

SELECT * FROM public.products;

INSERT INTO products VALUES(1,'Product A',100.00),
(2,'Product B',150.00),
(1,'Product A',120.00),
(3,'Product C',200.00),
(2,'Product B',180.00),
(1,'Product A',90.00),
(3,'Product C',210.00);

SELECT productname,avg(sellingprice) FROM public.products GROUP BY productname ORDER BY avg(sellingprice);