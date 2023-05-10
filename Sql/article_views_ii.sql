-- https://leetcode.com/problems/article-views-ii/

create table Views (article_id int, author_id int, viewer_id int, view_date date)

-- Solution 1
-- select distinct v1.*, v2.view_date, v2.article_id
select distinct v1.viewer_id as id
from Views v1
inner join Views v2
on v1.viewer_id = v2.viewer_id
    and v1.view_date = v2.view_date
    and v1.article_id <> v2.article_id
order by 1 asc

-- Solution 2
with cte as (select distinct * from Views)

select distinct viewer_id as id
from cte
group by viewer_id, view_date
having count(article_id) > 1
order by 1