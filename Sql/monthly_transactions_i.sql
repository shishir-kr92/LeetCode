-- https://leetcode.com/problems/monthly-transactions-i/

create table Transactions (id int, country varchar(20), state varchar(20), amount int, trans_date date)

select date_format(trans_date, '%Y-%m') as month,
       country,
       count(id) as trans_count,
       sum(case when lower(state) = 'approved' then 1 else 0 end) as approved_count,
       sum(amount) as trans_total_amount,
       sum(case when lower(state) = 'approved' then amount else 0 end) as approved_total_amount
from Transactions
group by date_format(trans_date, '%Y-%m'), country
order by 1, 2