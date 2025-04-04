--1. Выведите всю информацию о регионах.
select
    *
from
    hr.REGIONS;

--2. Выведите информацию о имени, id департамента, зарплате и фамилии
--для всех работников.
select
    FIRST_NAME,
    DEPARTMENT_ID,
    SALARY,
    LAST_NAME
from
    hr.EMPLOYEES;

--3. Выведите информацию о id работника, электронной почте и дату,
--которая была за неделю до трудоустройства для всех работников.
--Столбец, который будет содержать дату назовите One week before hire date.
select
    EMPLOYEE_ID,
    EMAIL,
    HIRE_DATE - INTERVAL '7' DAY as "One week before hire date"
from
    hr.EMPLOYEES;

--4. Выведите информацию о работниках с их позициями в формате:
--Donald(SH_CLERK) . Назовите столбец our_employees .
select
    FIRST_NAME || '(' || JOB_ID || ')' as "our_employees"
from
    hr.EMPLOYEES;

--5. Выведите список уникальных имён среди работников.
select DISTINCT
    FIRST_NAME
from
    hr.EMPLOYEES;

--6. Выведите следующую информацию из таблицы jobs:
--job_title, выражение в формате: «min = 20080, max = 40000»,
--где 20080 – это минимальная з/п, а 40000 – максимальная.
--Назовите этот столбец info. Максимальную з/п и назовите столбец max,
--новую з/п, которая будет называться new_salary и вычисляться по
--формуле: max_salary*2-2000.
select
    JOB_TITLE,
    concat ('min = ', MIN_SALARY, ', max = ', MAX_SALARY) as info,
    MAX_SALARY as "max",
    MAX_SALARY * 2 -2000 as "new_salary"
from
    hr.JOBS;

--7. Выведите на экран предложение «Peter's dog is very clever», используя
--одну из двух техник работы с одинарными кавычками.
select
    'Peter''s dog is very clever'
from
    DUAL;

--8. Выведите на экран предложение «Peter's dog is very clever», используя,
--отличную от предыдущего примера, технику работы с одинарными кавычками.
--select q'<Peter's dog is very clever>' from DUAL;

--9. Выведите на экран количество минут в одном веке (1 год = 365.25 дней).
select
    100 * 365.25 * 24 * 60
from
    DUAL;