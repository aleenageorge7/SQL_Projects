CREATE TABLE Ads(AdID INT PRIMARY KEY,
Views_ FLOAT,
Clicks FLOAT,
Cost_ FLOAT);

INSERT INTO public.ads VALUES(1,1000,50,20.5),
(2,800,30,15.2),
(3,1200,80,25.7),
(4,600,20,10.9),
(5,1500,120,40.3);

SELECT * FROM public.ads;


--------CTR
SELECT adid,round( ((clicks::NUMERIC/views_::NUMERIC)*100),1 )|| '%' AS CTR,views_,clicks,cost_ FROM public.ads ORDER BY CTR DESC;



