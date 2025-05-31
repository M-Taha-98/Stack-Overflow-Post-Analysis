# Stack Overflow Post Analysis
###### Comprehensive Project including analysis using SQL and Interactive Dashboard

![Stack Overflow Post Analysis](https://github.com/user-attachments/assets/ccb30bea-028c-4f9b-ac90-0ad31dcb981f)
___

### Project Overview

The objective is to write queries to analyze the history of Stack Overflow posts to gain insights.

### Data Source
The primary data used for this project is the [Stack Overflow Data](https://www.kaggle.com/datasets/stackoverflow/stackoverflow/data?select=post_history).

*Dataset Description*: 
The data dictionary can be found [here.](https://meta.stackexchange.com/questions/2677/database-schema-documentation-for-the-public-data-dump-and-sede)

The dataset contains the follwoing tables:<br>

1. badges:<br>
 ○ Tracks badges earned by users.<br>
 ○ Key Fields: id, user_id, name (badge name), date (earned date).<br>
2. comments:<br>
 ○ Contains comments on posts.<br>
 ○ Key Fields: id, post_id, user_id, creation_date, text.<br>
3. post_history:<br>
 ○ Tracks the history of edits, comments, and other changes made to posts.<br>
 ○ Key Fields: id, post_history_type_id, post_id, user_id, text, creation_date.<br>
4. post_links:<br>
○ Links between related posts.<br>
○ Key Fields: id, post_id, related_post_id, link_type_id.<br>
5. tags:<br>
○ Information about tags associated with posts.<br>
○ Key Fields: id, tag_name.<br>
6. users:<br>
○ Details about Stack Overflow users.<br>
○ Key Fields: id, display_name, reputation, creation_date.<br>
7. votes:<br>
○ Tracks voting activity on posts.<br>
○ Key Fields: id, post_id, vote_type_id, creation_date.<br>
8. posts:<br>
○ Information about posts.<br>
○ Key Fields: id, title, post_tag_id, creation_date, score, view_count, user_id.<br>
 
### Tools Used

-  <img height="32px" src="https://github.com/devicons/devicon/blob/master/icons/mysql/mysql-original-wordmark.svg"> MySQL
- <img height="32px" src="https://raw.githubusercontent.com/microsoft/PowerBI-Icons/2bf1c982fb24528eee1559a96a25eb534c175cfd/SVG/Power-BI.svg">  Power BI
  
### Exploratory Analysis
In this stage, the data is explored using SQL to understand its structure, depth and answer basic underlying questions such as posts with a view count greater than hundred:

```sql
select *
from posts 
where view_count > 100;
```

### Data Analysis
The analysis step involved writing SQL queries to answer business relevant questions such as finding the users who have earned badges and also made comments:
```sql
SELECT u.*,
		GROUP_CONCAT(DISTINCT b.`name` ORDER BY b.`name` ASC) AS all_badges, 
    GROUP_CONCAT(DISTINCT c.`text` ORDER BY c.`text` ASC) AS all_comments
FROM users u
JOIN badges b ON u.id = b.user_id
JOIN comments c ON u.id = c.user_id
GROUP BY u.id
order by u.id asc;	
```

The analysis involves use of advanced SQL concepts such as **subqueries**, **Common Table Expression (CTE)**, **window functions**.

### Interactive Dashboard [![View Dashboard on Power BI](https://img.shields.io/badge/View%20Dashboard%20on-Power%20BI-F2C811?logo=powerbi&logoColor=black)](https://app.powerbi.com/view?r=eyJrIjoiMDk3OWUxYmQtMmNkNS00ZDBiLTg4ZjktMzhhYmQyODhlZGU0IiwidCI6ImM2ZTU0OWIzLTVmNDUtNDAzMi1hYWU5LWQ0MjQ0ZGM1YjJjNCJ9)
The findings of the analysis is then presented in form of a dynamic stakeholder dashboard. 

*Dashboard Snapshot:*
![image](https://github.com/user-attachments/assets/b8ebc57c-5ed0-4d9f-8c94-58510582402d)

___

[![View LinkedIn Profile](https://img.shields.io/badge/View%20Profile%20on-LinkedIn-0077B5?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mohammadtaha-businessanalytics/)

