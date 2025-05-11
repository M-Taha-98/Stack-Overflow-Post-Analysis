-- Project Title 
-- "Stack Overflow Post Analysis: A SQL Portfolio Project"

-- Creation of database with name "project" 

CREATE DATABASE project;

 -- using "project" database 
 
USE project;

-- creation of tables:

CREATE TABLE badges (
    id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255),
    date DATE
);

INSERT INTO badges (id, user_id, name, date) VALUES
(1, 1001, 'Gold Contributor', '2024-01-01'),
(2, 1002, 'Silver Helper', '2024-01-05'),
(3, 1003, 'Bronze Reviewer', '2024-02-10'),
(4, 1001, 'Silver Helper', '2024-03-15'),
(5, 1004, 'Gold Contributor', '2024-04-20'),
(6, 1001, 'Gold Contributor', '2024-05-05'),
(7, 1002, 'Bronze Reviewer', '2024-06-10'),
(8, 1003, 'Silver Helper', '2024-07-10'),
(9, 1004, 'Gold Contributor', '2024-08-01'),
(10, 1001, 'Bronze Reviewer', '2024-09-01');


CREATE TABLE comments (
    id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    creation_date DATE,
    text TEXT
);

INSERT INTO comments (id, post_id, user_id, creation_date, text) VALUES
(1, 2001, 1001, '2024-01-01', 'Great explanation!'),
(2, 2002, 1002, '2024-01-05', 'This helped a lot.'),
(3, 2003, 1003, '2024-01-10', 'Can you clarify?'),
(4, 2004, 1001, '2024-01-15', 'Excellent resource.'),
(5, 2005, 1004, '2024-01-20', 'Thank you for sharing.'),
(6, 2001, 1002, '2024-01-25', 'I agree, very useful.'),
(7, 2003, 1003, '2024-02-01', 'This solved my issue.'),
(8, 2004, 1001, '2024-02-05', 'Thanks for the info.'),
(9, 2005, 1004, '2024-02-10', 'Could use more detail.'),
(10, 2006, 1002, '2024-02-15', 'Good job on this one!');


CREATE TABLE post_history (
    id INT PRIMARY KEY,
    post_history_type_id INT,
    post_id INT,
    user_id INT,
    text TEXT,
    creation_date DATE
);

INSERT INTO post_history (id, post_history_type_id, post_id, user_id, text, creation_date) VALUES
(1, 1, 2001, 1001, 'Initial post creation', '2024-01-01'),
(2, 2, 2002, 1002, 'Edited post for clarity', '2024-01-05'),
(3, 3, 2003, 1003, 'Comment added by moderator', '2024-01-10'),
(4, 1, 2004, 1001, 'First version of the post', '2024-01-15'),
(5, 2, 2005, 1004, 'Reworded answer', '2024-01-20'),
(6, 3, 2001, 1002, 'User updated answer with additional info', '2024-01-25'),
(7, 1, 2003, 1003, 'Post originally created', '2024-02-01'),
(8, 3, 2004, 1001, 'Moderators edited content', '2024-02-05'),
(9, 2, 2005, 1004, 'User revised explanation', '2024-02-10'),
(10, 3, 2006, 1002, 'Moderators flagged inappropriate content', '2024-02-15');


CREATE TABLE post_links (
    id INT PRIMARY KEY,
    post_id INT,
    related_post_id INT,
    link_type_id INT
);

INSERT INTO post_links (id, post_id, related_post_id, link_type_id) VALUES
(1, 2001, 2002, 1),
(2, 2002, 2003, 2),
(3, 2003, 2004, 1),
(4, 2004, 2005, 3),
(5, 2005, 2006, 2),
(6, 2001, 2004, 3),
(7, 2002, 2006, 1),
(8, 2003, 2005, 2),
(9, 2004, 2006, 3),
(10, 2005, 2001, 2);



CREATE TABLE tags (
    id INT PRIMARY KEY,
    tag_name VARCHAR(255)
);

INSERT INTO tags (id, tag_name) VALUES
(1, 'SQL Joins'),
(2, 'SQL Optimization'),
(3, 'SQL Indexing'),
(4, 'SQL Subqueries'),
(5, 'SQL Group By'),
(6, 'SQL Database Normalization'),
(7, 'SQL Window Functions');


CREATE TABLE users (
    id INT PRIMARY KEY,
    display_name VARCHAR(255),
    reputation INT,
    creation_date DATE
);

INSERT INTO users (id, display_name, reputation, creation_date) VALUES
(1001, 'Alice', 1500, '2024-01-01'),
(1002, 'Bob', 1200, '2024-01-05'),
(1003, 'Charlie', 800, '2024-01-10'),
(1004, 'Dave', 1800, '2024-01-15'),
(1005, 'Eve', 1000, '2024-01-20'),
(1006, 'Frank', 2000, '2024-01-25'),
(1007, 'Grace', 1300, '2024-02-01'),
(1008, 'Hank', 1100, '2024-02-05'),
(1009, 'Ivy', 900, '2024-02-10'),
(1010, 'Jack', 1600, '2024-02-15');


CREATE TABLE votes (
    id INT PRIMARY KEY,
    post_id INT,
    vote_type_id INT,
    creation_date DATE
);

INSERT INTO votes (id, post_id, vote_type_id, creation_date) VALUES
(1, 2001, 1, '2024-01-01'),
(2, 2002, 2, '2024-01-05'),
(3, 2003, 1, '2024-01-10'),
(4, 2004, 2, '2024-01-15'),
(5, 2005, 1, '2024-01-20'),
(6, 2001, 2, '2024-01-25'),
(7, 2003, 1, '2024-02-01'),
(8, 2004, 2, '2024-02-05'),
(9, 2005, 1, '2024-02-10'),
(10, 2006, 2, '2024-02-15');


CREATE TABLE posts (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    post_tag_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    user_id INT
);

INSERT INTO posts (id, title, post_tag_id, creation_date, score, view_count, user_id)
VALUES
(2001, 'How to solve SQL JOIN issues?', 1, '2023-01-01', 10, 100, 1002),
(2002, 'Best practices for writing SQL queries', 2, '2023-01-02', 15, 150, 1004),
(2003, 'Understanding INNER JOIN in SQL', 1, '2023-01-03', 20, 200, 1010),
(2004, 'What is a LEFT JOIN?', 1, '2023-01-04', 25, 250, 1005),
(2005, 'Database indexing techniques', 3, '2023-01-05', 30, 300, 1002),
(2006, 'Explaining SQL subqueries', 4, '2023-01-06', 35, 350, 1003),
(2007, 'How to optimize SQL queries?', 2, '2023-01-07', 40, 400, 1008),
(2008, 'Database normalization concepts', 6, '2023-01-08', 45, 450, 1006),
(2009, 'SQL Aggregate Functions explained', 5, '2023-01-09', 50, 500, 1010),
(2010, 'Introduction to SQL Window Functions', 7, '2023-01-10', 55, 550, 1009);



-- select all the tables 

SELECT * FROM badges;
SELECT * FROM comments;
SELECT * FROM post_history;
SELECT * FROM post_links;
SELECT * FROM posts;
SELECT * FROM tags;
SELECT * FROM users;
SELECT * FROM votes;

-- -----------------------------------------------------------------------------------------------------------------------------------
													      -- Tasks --
-- ------------------------------------------------------------------------------------------------------------------------------------
-- Part 1: Basics (2 marks each)
-- -------------------------------------------------------
-- ○ Explore the structure and first 5 rows of each table
-- -------------------------------------------------------
DESCRIBE badges;
select * from badges
limit 5;

DESCRIBE comments;
select * from comments
limit 5;

DESCRIBE post_history;
select * from post_history
limit 5;

DESCRIBE post_links;
select * from post_links
limit 5;

DESCRIBE posts;
select * from posts
limit 5;

DESCRIBE tags;
select * from tags
limit 5;

DESCRIBE users;
select * from users
limit 5;

DESCRIBE votes;
select * from votes
limit 5;
-- -------------------------------------------------------
-- ○ Identify the total number of records in each table
-- -------------------------------------------------------
select count(id) as total_records from badges;          -- 10 records
select count(id) as total_records from comments;		-- 10 records
select count(id) as total_records from post_history;	-- 10 records
select count(id) as total_records from post_links;		-- 10 records
select count(id) as total_records from posts;			-- 10 records
select count(id) as total_records from tags;      		-- 7 records
select count(id) as total_records from users;			-- 10 records
select count(id) as total_records from votes;			-- 10 records
-- ----------------------------------------------------
-- ○ Find all posts with a view_count greater than 100
-- ----------------------------------------------------
select *
from posts 
where view_count > 100;   			-- post id: 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010 (total 9 posts)	
-- -----------------------------------------------------------
-- ○ Display comments made in 2005, sorted by date of creation
-- -----------------------------------------------------------				
select * from comments
where YEAR(creation_date) = 2005
order by creation_date asc;		-- no comments from 2005 in the dataset
-- ----------------------------------------------------
-- ○  Count the total number of votes for each post_id.
-- ----------------------------------------------------	
-- correlated subquery									 	
select p.id as post_ID,										
		(select count(vote_type_id) 							
			from votes												
            where post_id = p.id) as total_votes
from posts as p;	
-- ------------------------------------------------------------------
-- ○  Calculate the count and average score of posts per post_tag_id.
-- ------------------------------------------------------------------	
/*select *,
		count(id) over(partition by post_tag_id order by id) as total_posts,
        avg(score) over(partition by post_tag_id order by id) as avg_score
from posts; */   -- gives cumulative total of posts and running average_score

-- CTE
with t as(
	select post_tag_id, count(id) as total_posts, avg(score) as avg_score
    from posts
    group by post_tag_id )

select p.*, t.total_posts, t.avg_score
from
posts as p
join t on p.post_tag_id = t.post_tag_id
order by post_tag_id asc;

-- non-correlated subquery in join
select p.*,t.total_posts, t.avg_score								
from posts as p
join (select post_tag_id, count(id) as total_posts, avg(score) as avg_score
		from posts
		group by post_tag_id) as t
on p.post_tag_id = t.post_tag_id
order by post_tag_id asc;	

-- self-join
SELECT p.*, 
       count(t.id) as total_posts, avg(t.score) as avg_score
FROM posts AS p
JOIN posts AS t 
  ON p.post_tag_id = t.post_tag_id
GROUP BY t.id
order by p.post_tag_id asc;

-- ----------------------------------
-- Part 2: : Advanced (6 marks each)
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ○ Combine the post_history and posts tables to display the title of posts and the corresponding changes made in the post history
-- ---------------------------------------------------------------------------------------------------------------------------------
	-- id, title from posts
    -- post_history_type_id, text from post_history

select a.id, a.title, b.post_history_type_id, b.`text`
from posts as a
join post_history as b
on a.id = b.post_id
order by a.id, b.post_history_type_id;
-- --------------------------------------------------------------
-- ○ Show user details and the total badges earned by each user
-- --------------------------------------------------------------
/*select u.*, count(b.id) as total_badges, b.`name`, b.`date`
from users as u 
join badges as b
on u.id = b.user_id
group by b.id
order by u.id asc; */

 -- non-correlated subquery in join
select u.*, t.total_badges								
from users as u
join (select b.user_id, count(b.id) as total_badges
		from badges as b
		group by user_id) as t
on u.id = t.user_id
order by u.id asc;	
-- ------------------------------------------------------------------------------------
-- ○ Fetch the titles of posts, their comments, and the users who made those comments
-- ------------------------------------------------------------------------------------
select p.id as post_id, p.title, c.`text` as comments, u.display_name as commenter
from posts as p
 join comments as c
	on p.id = c.post_id
		join users as u
			on c.user_id = u.id
order by p.id asc;
-- ----------------------------------------------------------
-- ○ Combine post_links with posts to list related questions.
-- ----------------------------------------------------------
select pl.id, pl.post_id, p.title as related_post
from post_links as pl
join posts as p
on pl.related_post_id = p.id
order by pl.id asc;
-- ---------------------------------------------------------------
-- ○  Find the users who have earned badges and also made comments
-- ---------------------------------------------------------------
/*select u.*, t.badge_name, t.comments  
from users as u
join (select b.user_id, b.`name` as badge_name, c.`text` as comments 
		from badges as b
        join comments as c
        on b.user_id = c.user_id) as t
on u.id = t.user_id
order by u.id asc; */

SELECT u.*,
		GROUP_CONCAT(DISTINCT b.`name` ORDER BY b.`name` ASC) AS all_badges, 
        GROUP_CONCAT(DISTINCT c.`text` ORDER BY c.`text` ASC) AS all_comments
FROM users u
JOIN badges b ON u.id = b.user_id
JOIN comments c ON u.id = c.user_id
GROUP BY u.id
order by u.id asc;						-- outputs the user data along with badges and comments

SELECT u.*, 
       GROUP_CONCAT(DISTINCT t.badge_name ORDER BY t.badge_name ASC) AS all_badges, 
       GROUP_CONCAT(DISTINCT t.comments ORDER BY t.comments ASC) AS all_comments
FROM users AS u
JOIN (
    SELECT b.user_id, b.`name` AS badge_name, c.`text` AS comments 
    FROM badges AS b
    JOIN comments AS c ON b.user_id = c.user_id
) AS t
ON u.id = t.user_id
GROUP BY u.id
ORDER BY u.id ASC;					-- outputs the user data along with badges and comments
-- ---------------------------------------------------------------
-- ○   Find all users with the highest reputation
-- ---------------------------------------------------------------
WITH t as (
select *,
		dense_rank() over(order by reputation desc) as ranking
from users
)
select * from t
where ranking = 1;  
-- ---------------------------------------------------------------
-- ○  Retrieve posts with the highest score in each post_tag_id
-- ---------------------------------------------------------------
 -- through correlated subquery
 select *
 from posts as p
 where (post_tag_id,score) in (select post_tag_id, max(score) 
								from posts	
								where post_tag_id = p.post_tag_id)
order by p.post_tag_id;
 
-- through non-correlated subquery
select *
from posts as p
where (post_tag_id,score) in (select post_tag_id, max(score) 
								from posts	
								group by post_tag_id)
order by p.post_tag_id;
 
-- window function in CTE
WITH t as (
select *,
		dense_rank() over(partition by post_tag_id order by score desc) as ranking
from posts
)
select * from t
where ranking = 1; 
-- -------------------------------------------------------------------
-- ○  For each post, fetch the number of related posts from post_links.
-- -------------------------------------------------------------------
/*with t as (
select post_id, count(related_post_id) as total_related_posts
from post_links
group by post_id
order by post_id asc )

select DISTINCT p.post_id,
			GROUP_CONCAT(related_post_id order by related_post_id asc) as all_related_post_id,
            GROUP_CONCAT(link_type_id order by link_type_id asc) as all_link_type_id
from post_links as p
where p.post_id in (SELECT post_id FROM t) 
group by p.post_id
order by p.post_id asc; */

-- here cte only serves the purpose of improving readibility
with t as (
select post_id, count(related_post_id) as total_related_posts
from post_links
group by post_id
order by post_id asc )

select p.post_id, t.total_related_posts, 
			GROUP_CONCAT(related_post_id order by related_post_id asc) as all_related_post_id,
            GROUP_CONCAT(link_type_id order by link_type_id asc) as all_link_type_id
from post_links as p
join t 
on p.post_id = t.post_id
group by p.post_id
order by p.post_id asc;
-- -----------------------------------------------------------
-- ○  Rank posts based on their score within each post_tag_id
-- -----------------------------------------------------------
select *,
	dense_rank() over(partition by post_tag_id order by score desc) as ranking
from posts;
-- -------------------------------------------------------------------------------
-- ○  Calculate the running total of badges earned by users in chronological order
-- -------------------------------------------------------------------------------
select *,
	count(id) over (partition by user_id order by `date` asc) as running_total_badges_by_user
from badges;
-- ----------------------------------------------------------------------------
-- ○  Find out the date for each user on which their total badges went over 1
-- ----------------------------------------------------------------------------
with t1 as (
select *,
	count(id) over (partition by user_id order by `date` asc) as running_total_badges_by_user
from badges ),

t2 as (
select *,
		dense_rank() over(partition by user_id order by running_total_badges_by_user asc) as ranking
from t1 ) 

select *
from t2
where ranking = 2;
-- --------------------------------------------------------------------------------------------------------
 /* ○  Create a CTE to calculate the average score of posts by each user and use it to:
■ Show user_ids, display_name, reputation and avg_score for users with an average score above 40.
■ Rank users based on their average post score. Show user_ids, display_name, reputation, avg_score and rank  
*/ -- ------------------------------------------------------------------------------------------------------
with t1 as (
select user_id, avg(score) as avg_score
from posts
group by user_id )

select u.id, u.display_name as posted_by, u.reputation, t1.avg_score
from users as u
join t1 
on u.id = t1.user_id
where avg_score > 40;

with t2 as (
select user_id, avg(score) as avg_score
from posts
group by user_id )

select u.id, u.display_name as posted_by, u.reputation, t2.avg_score,
	dense_rank() over(order by avg_score desc) as `rank`
from users as u
join t2 
on u.id = t2.user_id
order by `rank`;

-- ----------------------------------
-- New Insights and Questions
-- --------------------------------------------------------------------------------
-- ○ Which users have contributed the most in terms of comments, posts, and votes?
-- --------------------------------------------------------------------------------
-- highest contribution in terms of comments
select u.id, u.display_name as commented_by, t.total_comments 
from users as u
join (select user_id, count(`text`) as total_comments 
		from comments
		group by user_id) as t
on u.id = t.user_id
order by t.total_comments desc, u.id asc;  -- Alice and Bob with 3 comments each

-- highest contribution in terms of posts
select u.id, u.display_name as posted_by, t.total_posts
from users as u
join (select user_id, count(title) as total_posts
		from posts
		group by user_id) as t
on u.id = t.user_id
order by t.total_posts desc, u.id asc;	-- Bob and Jack with 2 posts each
-- -------------------------------------------------------------------------------------
-- ○ What types of badges are most commonly earned, and which users are the top earners?
-- -------------------------------------------------------------------------------------
select `name` as badge_name, count(user_id) as frequency,
			GROUP_CONCAT(u.display_name ORDER BY u.display_name ASC) AS all_users
from badges as b
JOIN users as u ON b.user_id = u.id           
group by badge_name
order by frequency desc;			-- Gold Contributor is most commonly earned, twice each by Alice and Dave
-- ------------------------------------------------------------
-- ○ Which tags are associated with the highest-scoring posts?
-- ------------------------------------------------------------
with scoring as (
select p.*, t.tag_name, 
	dense_rank() over(order by score desc) as ranking
from posts as p
join tags as t
on p.post_tag_id = t.id
)

select * 
from scoring
where ranking = 1;  -- 'SQL Window Functions' is associated with highest-scoring post