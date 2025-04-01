CREATE TABLE Names_(Full_Name VARCHAR(20));

INSERT INTO public.names_ VALUES('rAVI kUMAR'),
('priya sharma'),
('amit PATEL'),
('NEHA gupta');

SELECT * FROM public.names_;

-----------

UPDATE public.names_
SET full_name=INITCAP(full_name);

SELECT * FROM public.names_;