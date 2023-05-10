-- https://leetcode.com/problems/unpopular-books/

create table Books (book_id int, name varchar(20), available_from date)
create table Orders(order_id int, book_id int, quantity int, dispatch_date date)

with cte as (select book_id, sum(quantity) from

select b.name, b.available_from, o.quantity
from  Orders o
inner join Books b on o.book_id = b.book_id and  cast('2019-06-23' as date) - b.available_from = 1

select cast('2019-06-23' as date) - b.available_from , cast('2019-06-23' as date), available_from
from  Books