-- https://leetcode.com/problems/nth-highest-salary/submissions/
create table Employee (id int, salary int)

-- Solution
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      select distinct salary from (select *, dense_rank() over(order by salary desc) as rnk
                          from Employee) tmp where rnk = n

  );
END