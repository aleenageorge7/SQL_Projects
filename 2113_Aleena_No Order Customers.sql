CREATE TABLE customer(ID INT PRIMARY KEY
, customer_name VARCHAR(50));

INSERT INTO public.customer VALUES(1,'Joe'),
(2,'Henry'),
(3,'Sam'),
(4,'Max');

SELECT * FROM public.customer;

CREATE TABLE orders(id INT PRIMARY KEY,
customer_id INT
,FOREIGN KEY (customer_id) REFERENCES public.customer(ID));

INSERT INTO public.orders VALUES(2,1),(1,3);

SELECT * FROM public.orders;

SELECT customer_name AS Customers FROM public.customer WHERE id NOT IN (SELECT customer_id FROM public.orders);