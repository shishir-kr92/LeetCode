-- https://leetcode.com/problems/number-of-accounts-that-did-not-stream/

create table Subscriptions (account_id int, start_date date, end_date date)
create table Streams (session_id int, account_id int, stream_date date)

-- Solution
select count(subs.account_id) as accounts_count
from `Subscriptions` subs
inner join `Streams` st on subs.account_id = st.account_id
where Year(subs.end_date) = '2021'  and Year(st.stream_date) != '2021'
