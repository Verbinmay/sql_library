--SUBQUERY 
-- select column1, column2 from table1 where column1 = (select column1 from table2 where column2 = 'value');
select
    DEPARTMENT_NAME,
    min(salary),
    max(salary)
from
    (
        select
            salary,
            department_name
        from
            employees e
            JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
    )
group by
    DEPARTMENT_NAME;

-- одинаковые результаты
select
    salary,
    department_name
from
    employees e
    join departments d on e.department_id = d.department_id
group by
    department_name;

--CORRELATED SUBQUERY
-- select e1.first_name, e1.last_name, e1.salary from employees e1 where e1.salary > (select avg(e2.salary) from employees e2 where e1.department_id = e2.department_id);
--очень ресурсозатратный запрос

