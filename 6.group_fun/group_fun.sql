--GROUP FUNCTION - возвращает один ответ, обрабатывая группу строк
--COUNT( * / expr) - возвращает количество строк в группе
-- select count(*) from employees; -- 14
-- select count(distinct department_id) from employees; -- 5
-- select count(department_id) from employees; -- 14
-- select count(department_id) from employees where department_id is not null; -- 14
;

-- SUM( distinct / expr) - возвращает сумму значений в группе
-- select sum(salary) from employees; -- 1 200 000
-- select sum(distinct salary) from employees; -- 1 200 000
-- select sum(salary) from employees where salary is not null; -- 1 200 000
-- AVG( distinct / expr) - возвращает среднее значение в группе
-- select avg(salary) from employees; -- 85 714.28571428571
-- select avg(nvl(salary, 0)) from employees; -- 85 714.28571428571
-- select avg(distinct salary) from employees; -- 85 714.28571428571
;

-- MIN\MAX(expr) - возвращает минимальное/максимальное значение в группе
-- select min(salary) from employees; -- 50 000
-- select max(salary) from employees; -- 150 000
;

-- GROUP BY - группирует строки по указанным столбцам
;

-- select department_id, count(*) from hr.employees group by department_id order by 2,1;
;

-- HAVING - фильтрует группы по условию
-- select department_id, count(*) from hr.employees group by department_id having count(*) > 2 order by 2,1;
;

-- вложенные групповые функции ( глубина 2 )
