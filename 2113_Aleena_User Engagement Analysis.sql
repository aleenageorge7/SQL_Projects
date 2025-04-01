CREATE TABLE Posts(post_id SERIAL PRIMARY KEY,
Post_content VARCHAR(100),
Post_date DATE);

INSERT INTO public.posts(post_content,post_date) VALUES('Lorem ipsum dolor sit amet','2023-08-25 10:00:00'),
('Exploring the beauty of nature','2023-08-26 15:30:00'),
('Unveiling the latest tech trends','2023-08-27 12:00:00'),
('Journey into the world of literature','2023-08-28 09:45:00'),
('Capturing the essence of city life','2023-08-29 16:20:00');

SELECT * FROM public.posts;


CREATE TABLE User_Reactions(reaction_id SERIAL PRIMARY KEY,
user_id INT,
post_id	INT,
reaction_type VARCHAR(10),
reaction_date DATE,
FOREIGN KEY (post_id) REFERENCES public.posts(post_id));

INSERT INTO public.user_reactions(user_id,post_id,reaction_type,reaction_date) VALUES
(101,1,'like','2023-08-25 10:15:00'),
(102,1,'comment','2023-08-25 11:30:00'),
(103,1,'share','2023-08-26 12:45:00'),
(101,2,'like','2023-08-26 15:45:00'),
(102,2,'comment','2023-08-27 09:20:00'),
(104,2,'like','2023-08-27 10:00:00'),
(105,3,'comment','2023-08-27 14:30:00'),
(101,3,'like','2023-08-28 08:15:00'),
(103,4,'like','2023-08-28 10:30:00'),
(105,4,'share','2023-08-29 11:15:00'),
(104,5,'like','2023-08-29 16:30:00'), 
(101,5,'comment','2023-08-30 09:45:00');

SELECT * FROM public.user_reactions;

------

CREATE VIEW full_Table AS
SELECT p.post_id AS post_id,p.post_content,p.post_date,
u.reaction_id,u.user_id,u.reaction_type,u.reaction_date 
FROM public.posts p FULL OUTER JOIN public.user_reactions u 
ON p.post_id=u.post_id;


------------------------------      1        -----------------------------------------------
SELECT post_id,post_content,
COUNT(CASE WHEN reaction_type='like' THEN 'like' END) AS num_likes,
COUNT(CASE WHEN reaction_type='comment' THEN 'comment' END) AS num_comments,
COUNT(CASE WHEN reaction_type='share' THEN 'share' END) AS num_shares
FROM public.full_table GROUP BY post_id,post_content HAVING post_id=2;



------------------------------      2       -----------------------------------------------
SELECT reaction_date AS reaction_day, 
       COUNT(DISTINCT user_id) AS distinct_users, 
       COUNT(reaction_type) AS total_reactions,
       COUNT(*) / COUNT(DISTINCT user_id) AS avg_reactions_per_user
FROM public.full_table 
GROUP BY reaction_date  
ORDER BY reaction_date;




--------------------------------       3        ------------------------------------------------
SELECT post_id, 
       post_content, 
       COUNT(reaction_type) AS total_reactions
FROM public.full_table
WHERE reaction_date <= NOW() - INTERVAL '7 days'  
GROUP BY post_id, post_content
ORDER BY post_id
LIMIT 3;
