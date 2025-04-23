-- 1. Выведите информацию о регионах и количестве сотрудников в каждом регионе.
SELECT
    REGION_NAME,
    COUNT(*)
FROM
    HR.REGIONS
    NATURAL JOIN HR.COUNTRIES
    NATURAL JOIN HR.LOCATIONS
    NATURAL JOIN HR.DEPARTMENTS
    JOIN HR.EMPLOYEES USING (DEPARTMENT_ID)
GROUP BY
    REGION_NAME;

-- 2. Выведите детальную информацию о каждом сотруднике: имя, фамилия, название департамента, job_id, адрес, страна и регион.
SELECT
    e.FIRST_NAME,
    e.LAST_NAME,
    e.JOB_ID,
    d.DEPARTMENT_NAME,
    l.STREET_ADDRESS,
    c.COUNTRY_NAME,
    r.Region_name
FROM
    HR.EMPLOYEES e
    JOIN hr.DEPARTMENTS d using (DEPARTMENT_ID)
    NATURAL JOIN hr.LOCATIONS l
    NATURAL JOIN hr.countries c
    NATURAL JOIN hr.REGIONS r;

--3. Выведите информацию о имени менеджеров которые имеют в подчинении больше 6ти сотрудников, а также выведите количество сотрудников, которые им подчиняются.
SELECT
    e1.FIRST_NAME,
    count(*)
FROM
    HR.EMPLOYEES e1
    join hr.EMPLOYEES e2 on (e1.EMPLOYEE_ID = e2.MANAGER_ID)
group by
    e1.FIRST_NAME
having
    count(*) > 6;

--4. Выведите информацию о названии всех департаментов и о количестве работников, если в департаменте работают больше 30ти сотрудников. Используйте технологию «USING» для объединения по id департамента.
SELECT
    DEPARTMENT_NAME,
    count(*)
FROM
    HR.DEPARTMENTS d
    join hr.EMPLOYEES e using (DEPARTMENT_ID)
group by
    DEPARTMENT_NAME
having
    count(*) > 30;

--5. Выведите названия всех департаментов, в которых нет ни одного сотрудника.
SELECT
    d.DEPARTMENT_NAME,
    count(e.FIRST_NAME) as a
FROM
    HR.DEPARTMENTS d
    left outer join hr.EMPLOYEES e on d.DEPARTMENT_ID = e.DEPARTMENT_ID
group by
    DEPARTMENT_NAME
having
    a = 0;

SELECT
    d.DEPARTMENT_NAME
FROM
    HR.DEPARTMENTS d
    LEFT JOIN HR.EMPLOYEES e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE
    e.EMPLOYEE_ID IS NULL;

--6. Выведите всю информацию о сотрудниках, менеджеры которых устроились на работу в 2005ом году, но при это сами работники устроились на работу до 2005 года.
SELECT
    e1.EMPLOYEE_ID,
    e1.FIRST_NAME,
    e1.LAST_NAME,
    e1.EMAIL,
    e1.PHONE_NUMBER,
    e1.HIRE_DATE AS EMPLOYEE_HIRE_DATE, -- Указываем алиас для ясности
    e1.JOB_ID,
    e1.SALARY,
    e1.COMMISSION_PCT,
    e1.MANAGER_ID,
    e1.DEPARTMENT_ID,
    e2.HIRE_DATE AS MANAGER_HIRE_DATE -- Указываем алиас для ясности
FROM
    HR.EMPLOYEES e1
    JOIN HR.EMPLOYEES e2 ON e1.MANAGER_ID = e2.EMPLOYEE_ID
WHERE
    e1.HIRE_DATE < TO_DATE ('01.01.2015', 'DD.MM.YYYY')
    AND e2.HIRE_DATE > TO_DATE ('01.01.2015', 'DD.MM.YYYY');

--7. Выведите название страны и название региона этой страны, используя natural join.
SELECT
    COUNTRY_NAME,
    REGION_NAME
FROM
    HR.COUNTRIES
    natural join HR.REGIONS;

--8. Выведите имена, фамилии и з/п сотрудников, которые получают меньше, чем (минимальная з/п по их специальности + 1000).
SELECT
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE,
    SALARY
FROM
    HR.EMPLOYEES
    join HR.JOBS using (JOB_ID)
where
    salary < MIN_SALARY + 1000;

SELECT
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE,
    SALARY
FROM
    HR.EMPLOYEES e
    join HR.JOBS j on (
        e.JOB_ID = j.JOB_ID
        and salary < MIN_SALARY + 1000
    );

--9. Выведите уникальные имена и фамилии сотрудников, названия стран, в которых они работают. Также выведите информацию о сотрудниках, о странах которых нет информации. А также выведите все страны, в которых нет сотрудников компании.
SELECT DISTINCT
    e1.FIRST_NAME,
    e1.LAST_NAME,
    c.country_name
FROM
    HR.EMPLOYEES e1
    full OUTER join hr.DEPARTMENTS d on (e1.DEPARTMENT_ID = d.DEPARTMENT_ID)
    full outer join hr.locations l on (l.LOCATION_ID = d.LOCATION_ID)
    full OUTER join hr.COUNTRIES c on (c.COUNTRY_ID = l.COUNTRY_ID);

--10. Выведите имена и фамилии всех сотрудников, а также названия стран, которые мы получаем при объединении работников со всеми странами без какой-либо логики.
SELECT DISTINCT
    e1.FIRST_NAME,
    e1.LAST_NAME,
    c.country_name
FROM
    HR.EMPLOYEES e1
    cross join hr.COUNTRIES c;