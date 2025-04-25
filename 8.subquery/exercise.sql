-- 1. Выведите всю информацию о сотрудниках, с самым длинным именем.
SELECT
    *
from
    hr.EMPLOYEES e1
where
    length (e1.FIRST_NAME) = (
        select
            max(length (e2.FIRST_NAME))
        from
            hr.EMPLOYEES e2
    );

--2. Выведите всю информацию о сотрудниках, с зарплатой большей средней зарплаты всех сотрудников.
SELECT
    *
from
    hr.EMPLOYEES e1
where
    e1.salary > (
        select
            avg(e2.salary)
        from
            hr.EMPLOYEES e2
    );

-- 3. Получить город/города, где сотрудники в сумме зарабатывают меньше всего.
SELECT
    l.CITY
FROM
    HR.LOCATIONS l
WHERE
    l.LOCATION_ID IN (
        SELECT
            d.LOCATION_ID
        FROM
            hr.DEPARTMENTS d
        WHERE
            d.DEPARTMENT_ID IN (
                SELECT
                    e.DEPARTMENT_ID
                FROM
                    hr.EMPLOYEES e
                WHERE
                    e.DEPARTMENT_ID IS NOT NULL
                GROUP BY
                    e.DEPARTMENT_ID
            )
        GROUP BY
            d.LOCATION_ID
        HAVING
            SUM(
                (
                    SELECT
                        SUM(e2.salary)
                    FROM
                        hr.EMPLOYEES e2
                    WHERE
                        e2.DEPARTMENT_ID = d.DEPARTMENT_ID
                )
            ) = (
                SELECT
                    MIN(city_sum)
                FROM
                    (
                        SELECT
                            SUM(
                                (
                                    SELECT
                                        SUM(e3.salary)
                                    FROM
                                        hr.EMPLOYEES e3
                                    WHERE
                                        e3.DEPARTMENT_ID = d2.DEPARTMENT_ID
                                )
                            ) as city_sum
                        FROM
                            hr.DEPARTMENTS d2
                        GROUP BY
                            d2.LOCATION_ID
                    )
            )
    );

WITH
    city_salaries AS (
        SELECT
            l.CITY,
            SUM(e.SALARY) AS total_salary
        FROM
            HR.LOCATIONS l
            LEFT JOIN hr.DEPARTMENTS d ON l.LOCATION_ID = d.LOCATION_ID
            LEFT JOIN hr.EMPLOYEES e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
        GROUP BY
            l.CITY
    )
SELECT
    CITY
FROM
    city_salaries
WHERE
    total_salary = (
        SELECT
            MIN(total_salary)
        FROM
            city_salaries
    );

;

--5. Выведите всю информацию о департаментах, в которых нет ни одного сотрудника.
SELECT
    DEPARTMENT_ID,
    DEPARTMENT_NAME,
    MANAGER_ID,
    LOCATION_ID
FROM
    HR.DEPARTMENTS
where
    DEPARTMENT_ID not in (
        select distinct
            e.DEPARTMENT_ID
        from
            hr.EMPLOYEES e
        where
            e.DEPARTMENT_ID is not null
    );

SELECT
    d.DEPARTMENT_ID,
    d.DEPARTMENT_NAME,
    d.MANAGER_ID,
    d.LOCATION_ID
FROM
    HR.DEPARTMENTS d
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            HR.EMPLOYEES e
        WHERE
            e.DEPARTMENT_ID = d.DEPARTMENT_ID
    );

SELECT
    d.DEPARTMENT_ID,
    d.DEPARTMENT_NAME,
    d.MANAGER_ID,
    d.LOCATION_ID
FROM
    HR.DEPARTMENTS d
    LEFT JOIN HR.EMPLOYEES e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE
    e.EMPLOYEE_ID IS NULL;

--6. Выведите всю информацию о сотрудниках, которые не являются менеджерами.
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE_NUMBER,
    HIRE_DATE,
    JOB_ID,
    SALARY,
    COMMISSION_PCT,
    MANAGER_ID,
    DEPARTMENT_ID
FROM
    HR.EMPLOYEES e
where
    e.EMPLOYEE_ID not in (
        select distinct
            e1.MANAGER_ID
        FROM
            hr.EMPLOYEES e1
        where
            e1.MANAGER_ID is not null
    );

--7. Выведите всю информацию о менеджерах, которые имеют в подчинении больше 6ти сотрудников.
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE_NUMBER,
    HIRE_DATE,
    JOB_ID,
    SALARY,
    COMMISSION_PCT,
    MANAGER_ID,
    DEPARTMENT_ID
FROM
    HR.EMPLOYEES e
where
    (
        select
            count(*)
        FROM
            hr.EMPLOYEES e1
        where
            e.EMPLOYEE_ID = e1.MANAGER_ID
    ) > 6;

SELECT
    e.EMPLOYEE_ID,
    e.FIRST_NAME,
    e.LAST_NAME,
    e.EMAIL,
    e.PHONE_NUMBER,
    e.HIRE_DATE,
    e.JOB_ID,
    e.SALARY,
    e.COMMISSION_PCT,
    e.MANAGER_ID,
    e.DEPARTMENT_ID
FROM
    HR.EMPLOYEES e
    join hr.employees e1 on (e.EMPLOYEE_ID = e1.MANAGER_ID)
GROUP by
    e.EMPLOYEE_ID,
    e.FIRST_NAME,
    e.LAST_NAME,
    e.EMAIL,
    e.PHONE_NUMBER,
    e.HIRE_DATE,
    e.JOB_ID,
    e.SALARY,
    e.COMMISSION_PCT,
    e.MANAGER_ID,
    e.DEPARTMENT_ID
having
    count(*) > 6;

--8. Выведите всю информацию о сотрудниках, которые работают в департаменте с названием IT .
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE_NUMBER,
    HIRE_DATE,
    JOB_ID,
    SALARY,
    COMMISSION_PCT,
    MANAGER_ID,
    DEPARTMENT_ID
FROM
    HR.EMPLOYEES
where
    DEPARTMENT_ID = (
        select
            DEPARTMENT_ID
        from
            hr.DEPARTMENTS
        where
            department_name = 'IT'
    );

