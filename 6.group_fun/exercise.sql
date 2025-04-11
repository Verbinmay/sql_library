-- 1. Получить репорт по department_id с минимальной и максимальной зарплатой, с самой ранней и самой поздней датой прихода на работу и с количеством сотрудников. Сортировать по количеству сотрудников (по убыванию).
select
    DEPARTMENT_ID,
    min(SALARY),
    max(SALARY),
    min(HIRE_DATE),
    max(HIRE_DATE),
    count(*)
from
    hr.EMPLOYEES
group by
    DEPARTMENT_ID
order by
    count(*) desc;

-- 2. Выведите информацию о первой букве имени сотрудника и количество имён, которые начинаются с этой буквы. Выводить строки для букв, где количество имён, начинающихся с неё больше 1. Сортировать по количеству.
select
    substr (FIRST_NAME, 1, 1) as first,
    count(*)
from
    hr.EMPLOYEES
group by
    first
having
    count(*) > 1
order by
    count(*);

--3. Выведите id департамента, з/п и количество сотрудников, которые работают в одном и том же департаменте и получают одинаковую зарплату.
select
    DEPARTMENT_ID,
    salary,
    count(*)
from
    hr.employees
group by
    DEPARTMENT_ID,
    salary;

--4. Выведите день недели и количество сотрудников, которых приняли на работу в этот день.
select
    to_char (hire_date, 'DAY') as day,
    count(*)
from
    hr.EMPLOYEES
group by
    day;

--5. Выведите id департаментов, в которых работает больше 30 сотрудников и сумма их з/п-т больше 300000.
select
    DEPARTMENT_ID
from
    hr.EMPLOYEES
group by
    DEPARTMENT_ID
having
    count(*) > 30
    and sum(salary) > 300000;

--6. Из таблицы countries вывести все region_id, для которых сумма всех букв их стран больше 50ти.
select
    REGION_ID
from
    hr.countries
group by
    REGION_ID
having
    length (sum(length (COUNTRY_NAME))) > 50;

--7. Выведите информацию о job_id и округленную среднюю зарплату работников для каждого job_id.
select
    job_id,
    round(avg(salary))
from
    hr.EMPLOYEES
group by
    JOB_ID;

--8. Получить список id департаментов, в которых работают сотрудники нескольких (>1) job_id.
select
    DEPARTMENT_ID
from
    hr.EMPLOYEES
group by
    DEPARTMENT_ID
having
    count(distinct JOB_ID) > 1;

--9. Выведите информацию о department, job_id, максимальную и минимальную з/п для всех сочетаний department_id - job_id, где средняя з/п больше 10000.
select
    DEPARTMENT_ID,
    JOB_ID,
    max(SALARY),
    MIN(SALARY)
from
    hr.EMPLOYEES
group by
    DEPARTMENT_ID,
    JOB_ID
having
    avg(salary) > 10000;

--10.Получить список manager_id, у которых средняя зарплата всех его подчиненных, не имеющих комиссионные, находится в промежутке от 6000 до 9000.
select
    MANAGER_ID
from
    hr.EMPLOYEES
where
    COMMISSION_PCT is null
group by
    MANAGER_ID
having
    avg(SALARY) between 6000 and 9000;

--11.Выведите округлённую до тысяч (не тысячных) максимальную зарплату среди всех средних зарплат по департаментам.
select
    round(max(avg(salary)), -3)
from
    hr.EMPLOYEES
group by
    DEPARTMENT_ID;