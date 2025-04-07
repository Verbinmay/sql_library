--1. Получите список всех сотрудников с именем David.
select
    *
from
    hr.employees
where
    FIRST_NAME = 'David';

--2. Получите список всех сотрудников, у которых job_id равен FI_ACCOUNT.
select
    *
from
    hr.employees
where
    JOB_ID = 'FI_ACCOUNT';

--3. Выведите информацию о имени, фамилии, з/п и номере департамента для сотрудников из 50го департамента с зарплатой, большей 4000.
select
    FIRST_NAME,
    LAST_NAME,
    SALARY,
    DEPARTMENT_ID
from
    hr.employees
where
    DEPARTMENT_ID = 50
    and SALARY > 4000;

--4. Получите список всех сотрудников, которые работают или в 20м, или в 30м департаменте.
select
    *
from
    hr.employees
where
    DEPARTMENT_ID = 20
    or DEPARTMENT_ID = 30;

select
    *
from
    hr.employees
where
    DEPARTMENT_ID in (20, 30);

-- 5. Получите список всех сотрудников, у которых вторая и последняя буква в имени равна 'a'.
select
    *
from
    hr.employees
where
    FIRST_NAME like '_a%a';

--6. Получите список всех сотрудников из 50го и из 80го департамента, у которых есть бонус(комиссионные). Отсортируйте строки по email (возрастающий порядок), используя его порядковый номер.
select
    *
from
    hr.employees
where
    DEPARTMENT_ID in (50, 80)
    and COMMISSION_PCT IS NOT NULL
order by
    4;

--7. Получите список всех сотрудников, у которых в имени содержатся минимум 2 буквы 'n'.
select
    *
from
    hr.employees
where
    FIRST_NAME like '%n%n%';

--8. Получить список всех сотрудников, у которых длина имени больше 4 букв. Отсортируйте строки по номеру департамента (убывающий порядок) так, чтобы значения “null” были в самом конце.
select
    *
from
    hr.employees
where
    FIRST_NAME like '_____%'
order by
    DEPARTMENT_ID DESC nulls last;

--9. Получите список всех сотрудников, у которых зарплата находится в промежутке от 3000 до 7000 (включительно), нет бонуса (комиссионных) и job_id среди следующих вариантов: PU_CLERK, ST_MAN, ST_CLERK.
select
    *
from
    hr.employees
where
    (SALARY BETWEEN 3000 and 7000)
    and COMMISSION_PCT IS NULL
    and JOB_ID IN ('PU_CLERK', 'ST_MAN', 'ST_CLERK');

--10.Получите список всех сотрудников у которых в имени содержится символ '%'
select
    *
from
    hr.employees
where
    FIRST_NAME LIKE '%|%%' ESCAPE '|';

--11.Выведите информацию о job_id, имене и з/п для работников, рабочий id которых больше или равен 120 и job_id не равен IT_PROG. Отсортируйте строки по job_id (возрастающий порядок) и именам (убывающий порядок).
select
    JOB_ID,
    FIRST_NAME,
    SALARY
from
    hr.employees
where
    EMPLOYEE_ID >= 120
    and JOB_ID != 'IT_PROG'
order by
    JOB_ID,
    FIRST_NAME DESC