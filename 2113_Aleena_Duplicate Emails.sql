CREATE TABLE Emails(ID SERIAL PRIMARY KEY,
Name_ VARCHAR(20),
Email VARCHAR(50),
Phone NUMERIC);

INSERT INTO public.emails(name_,email,phone) VALUES('Rahul','rahul@exmple.com',9839473902),
('Rohit','rohit@example.com',9883782971),
('Suresh','rahul@exmple.com',7654321098),
('Manish','manish@example.com',8927394619),
('Amit','amit@example.com',9399303840),
('Rahul','rahul@exmple.com',9737466147);

SELECT * FROM public.emails;

--remove duplicates
SELECT * FROM (SELECT DISTINCT ON (email) id, name_, email, phone
FROM public.emails
ORDER BY email,id) ORDER BY id;


DELETE FROM public.emails
WHERE id NOT IN (
    SELECT MIN(id)
    FROM public.emails
    GROUP BY email
);

SELECT * FROM public.emails;
