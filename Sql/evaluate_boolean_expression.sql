-- https://leetcode.com/problems/evaluate-boolean-expression/

create table Variables (name varchar(10), `value` int);
create table Expressions(left_operand varchar(1), operator varchar(1), right_operand varchar(1));


select e.left_operand as left_operand,
       e.operator as operator,
       e.right_operand as right_operand,
       case when e.operator = '>' and  v1.value > v2.value then 'true'
            when e.operator = '<' and  v1.value < v2.value then 'true'
            when e.operator = '=' and  v1.value = v2.value then 'true'
            else 'false' end  as `value`
from Expressions e
left join Variables v1 on e.left_operand = v1.name
left join Variables v2 on e.right_operand = v2.name

