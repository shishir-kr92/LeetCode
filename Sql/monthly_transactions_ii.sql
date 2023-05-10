-- https://leetcode.com/problems/monthly-transactions-ii/description/

-- Create
Create table If Not Exists Transactions (id int,
                                         country varchar(4),
                                         state enum('approved', 'declined'),
                                         amount int,
                                         trans_date date);
Create table If Not Exists Chargebacks (trans_id int, trans_date date);

-- Insert
insert into Transactions (id, country, state, amount, trans_date) values ('101', 'US', 'approved', '1000', '2019-05-18'),
('102', 'US', 'declined', '2000', '2019-05-19'),
('103', 'US', 'approved', '3000', '2019-06-10'),
('104', 'US', 'declined', '4000', '2019-06-13'),
('105', 'US', 'approved', '5000', '2019-06-15');
insert into Chargebacks (trans_id, trans_date) values ('102', '2019-05-29'), ('101', '2019-06-30'), ('105', '2019-09-18');


select date_format(coalesce(t.trans_date, c.trans_date), '%m/%y'),
       case when state = 'approved' then 1 else 0 end  as approved_count
from Transactions t
outer join Chargebacks c
on date_format(t.trans_date, '%m/%y') = date_format(c.trans_date, '%m/%y')

group by date_format(trans_date, '%m/%y')
