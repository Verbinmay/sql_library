--2. Выведите id тех департаментов, где работает менеджер № 100 и не работают менеджеры № 145, 201.
select
    department_id
from
    hr.DEPARTMENTS
    left join hr.EMPLOYEES e using (DEPARTMENT_ID)
where
    e.EMPLOYEE_ID = 100
union all
select
    department_id
from
    hr.DEPARTMENTS
    left join hr.EMPLOYEES e using (DEPARTMENT_ID)
where
    e.EMPLOYEE_ID not in (145, 201);

-- 3. Используя SET операторы и не используя логические операторы, выведите уникальную информацию о именах, фамилиях и з/п сотрудников, второй символ в именах которых буква «а», и фамилия содержит букву «s» вне зависимости от регистра. Отсортируйте результат по з/п по убыванию
SELECT
    FIRST_NAME,
    LAST_NAME,
    SALARY
FROM
    HR.EMPLOYEES
where
    substr (FIRST_NAME, 1, 1) = 'a'
INTERSECT
SELECT
    FIRST_NAME,
    LAST_NAME,
    SALARY
FROM
    HR.EMPLOYEES
where
    LOWER(last_NAME) like '%s%'
order by
    salary desc;

-- 4. Используя SET операторы и не используя логические операторы, выведите информацию о id локаций, почтовом коде и городе для локаций, которые находятся в Италии или Германии. А также для локаций, почтовый код которых содержит цифру «9».
select
    location_id,
    postal_code,
    city
from
    hr.locations l
    join hr.countries c using (country_id)
where
    country_name in ('Italy', 'Germany')
union all
select
    location_id,
    postal_code,
    city
from
    hr.locations l
    join hr.countries c using (country_id)
where
    postal_code like '%9%'