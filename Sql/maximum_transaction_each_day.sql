-- https://leetcode.com/problems/maximum-transaction-each-day/

create table Transactions (transaction_id int, day datetime, amount int)


with cte as (select transaction_id, date(day) as date, amount,
                    dense_rank() over(partition by date(day) order by amount desc) as rnk
from  Transactions)

select transaction_id from cte where rnk = 1  order by transaction_id