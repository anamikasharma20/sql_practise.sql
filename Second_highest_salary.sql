select distinct(
    case
        when count(distinct salary)>=2 then (select distinct salary from Employee order by salary desc limit 1 offset 1)
        when count(distinct salary)<2 then null
        end
) as SecondHighestSalary
from Employee
;
