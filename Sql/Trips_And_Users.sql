truncate table Trips
truncate table  Users

create table Trips (id int, client_id int, driver_id int, city_id int, status varchar(20), request_at date);
insert into Trips values ('1', '1', '10', '1', 'completed', '2013-10-01');
insert into Trips values ('2', '2', '11', '1', 'cancelled_by_driver', '2013-10-01');
insert into Trips values ('3', '3', '12', '6', 'completed', '2013-10-01');
insert into Trips values ('4', '4', '13', '6', 'cancelled_by_client', '2013-10-01');
insert into Trips values ('5', '1', '10', '1', 'completed', '2013-10-02');
insert into Trips values ('6', '2', '11', '6', 'completed', '2013-10-02');
insert into Trips values ('7', '3', '12', '6', 'completed', '2013-10-02');
insert into Trips values ('8', '2', '12', '12', 'completed', '2013-10-03');
insert into Trips values ('9', '3', '10', '12', 'completed', '2013-10-03');
insert into Trips values ('10', '4', '13', '12', 'cancelled_by_driver', '2013-10-03');

create table Users (users_id int, banned varchar(5), role varchar(20));
insert into Users values ('1', 'No', 'client');
insert into Users values ('2', 'Yes', 'client');
insert into Users values ('3', 'No', 'client');
insert into Users values ('4', 'No', 'client');
insert into Users values ('10', 'No', 'driver');
insert into Users values ('11', 'No', 'driver');
insert into Users values ('12', 'No', 'driver');
insert into Users values ('13', 'No', 'driver');

select * from Trips;
select * from Users

select request_at as Day, count(request_at) as

 select t.request_at as Day ,
     round(sum(case when t.status in ('cancelled_by_client', 'cancelled_by_driver') then 1 else 0 end)/count(t.request_at), 2) as 'Cancellation Rate'
 from (select * from Trips where request_at >= date('2013-10-01') and request_at <= date('2013-10-03')) as t
 inner join Users as u1 on t.client_id = u1.users_id and u1.banned = 'No'
 inner join Users as u2 on t.driver_id = u2.users_id and u2.banned = 'No'
 group by t.request_at
