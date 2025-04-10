--1. Используя функции, получите список всех сотрудников у которых в имени есть буква 'b' (без учета регистра).
select
    *
from
    hr.employees
where
    lower(FIRST_name) like '%b%';

select
    *
from
    hr.employees
where
    instr (lower(FIRST_name), 'b') > 0;

--2. Используя функции, получите список всех сотрудников у которых в имени содержатся минимум 2 буквы 'a'.
select
    *
from
    hr.employees
where
    lower(FIRST_name) like '%a%a%';

select
    *
from
    hr.employees
where
    instr (lower(FIRST_name), 'a', 1, 2) > 0;

--3. Получите первое слово из имени департамента, для тех департаментов, у которых название состоит больше, чем из одного слова.
select
    substr (
        DEPARTMENT_NAME,
        1,
        INSTR (DEPARTMENT_NAME, ' ') -1
    ) fist
from
    hr.DEPARTMENTS
where
    INSTR (DEPARTMENT_NAME, ' ') > 0;

--4. Получите имена сотрудников без первой и последней буквы в имени.
select
    substr (FIRST_NAME, 2, (length (FIRST_NAME) -2))
from
    hr.employees;

--5. Получите список всех сотрудников, у которых в значении job_id после знака '_' как минимум 3 символа, но при этом это значение после '_' не равно 'CLERK'.
select
    *
from
    hr.employees
where
    length (substr (job_id, instr (job_id, '_') + 1)) >= 3
    and substr (job_id, instr (job_id, '_') + 1) != 'CLERK';

--6. Получите список всех сотрудников, которые пришли на работу в первый день любого месяца.
select
    *
from
    hr.employees
where
    HIRE_DATE = trunc (HIRE_DATE, 'MM');

select
    *
from
    hr.employees
where
    to_char (HIRE_DATE, 'DD') = '01';

--7. Получите список всех сотрудников, которые пришли на работу в 2008ом году.
select
    *
from
    hr.employees
where
    to_char (HIRE_DATE, 'YYYY') = '2008';

--8. Покажите завтрашнюю дату в формате: Tomorrow is Second day of January
select
    to_char (
        sysdate + 1,
        'fm"Tomorrow is" Ddspth "day of" Month'
    )
from
    dual;

--9. Выведите имя сотрудника и дату его прихода на работу в формате: 21st of June, 2007
select
    first_name,
    to_char (hire_date, 'fmDdth "of" Month, YYYY')
from
    hr.employees;

--10.Получите список работников с увеличенными зарплатами на 20%. Зарплату показать в формате: $28,800.00
select
    first_name,
    to_char (SALARY + SALARY * 0.2, '$99,999.99')
from
    hr.employees;

--11.Выведите актуальную дату (нынешнюю), + секунда, + минута, + час, + день, + месяц, + год. (Всё это по отдельности прибавляется к актуальной дате).
select
    sysdate,
    sysdate + INTERVAL '1' SECOND,
    sysdate + INTERVAL '1' MINUTE,
    sysdate + INTERVAL '1' HOUR,
    sysdate + INTERVAL '1' DAY,
    sysdate + INTERVAL '1' MONTH,
    sysdate + INTERVAL '1' YEAR
from
    dual;

--12.Выведите имя сотрудника, его з/п и новую з/п, которая равна старой плюс это значение текста «$12,345.55».
select
    first_name,
    salary,
    salary + to_number ('$12,345.55', '$99,999.99')
from
    hr.EMPLOYEES;

--13.Выведите имя сотрудника, день его трудоустройства, а также количество месяцев между днём его трудоустройства и датой, которую необходимо получить из текста «SEP, 18:45:00 18 2009».
select
    first_name,
    hire_date,
    months_between (
        HIRE_DATE,
        TO_DATE (
            'SEP, 18:45:00 18 2009',
            'MON, HH24:MI:SS DD YYYY'
        )
    )
from
    hr.EMPLOYEES;

--14.Выведите имя сотрудника, его з/п, а также полную з/п (salary + commission_pct(%)) в формате: $24,000.00.
select
    first_name,
    salary,
    TO_CHAR (
        salary + (SALARY * NVL (COMMISSION_PCT, 0)),
        '$99,999.00'
    )
from
    hr.EMPLOYEES;

--15.Выведите имя сотрудника, его фамилию, а также выражение «different length», если длина имени не равна длине фамилии или выражение «same length», если длина имени равна длине фамилии. Не используйте conditional functions.
select
    first_name,
    last_name,
    NVL2 (
        NULLIF(LENGTH (FIRST_NAME), LENGTH (LAST_NAME)),
        'different length',
        'same length'
    )
from
    hr.EMPLOYEES;

--16.Выведите имя сотрудника, его комиссионные, а также информацию о наличии бонусов к зарплате – есть ли у него комиссионные (Yes/No).
select
    first_name,
    COMMISSION_PCT,
    NVL2 (COMMISSION_PCT, 'Yes', 'No')
from
    hr.EMPLOYEES;

--17.Выведите имя сотрудника и значение которое его будет характеризовать: значение комиссионных, если присутствует, если нет, то id его менеджера, если и оно отсутствует, то его з/п.
select
    first_name,
    COALESCE(COMMISSION_PCT, MANAGER_ID, SALARY)
from
    hr.EMPLOYEES;

-- 18.Выведите имя сотрудника, его з/п, а также уровень зарплаты каждого сотрудника: Меньше 5000 считается Low level, Больше или равно 5000 и меньше 10000 считается Normal level, Больше или равно 10000 считается High level.
select
    first_name,
    SALARY,
    case
        when salary < 5000 then 'Low'
        when salary < 10000 then 'Normal level'
        else 'High level'
    end
from
    hr.EMPLOYEES;

--19.Для каждой страны показать регион, в котором она находится: 1- Europe, 2-America, 3-Asia, 4-Africa . Выполнить данное задание, не используя функционал JOIN. Используйте DECODE.
select
    COUNTRY_NAME,
    DECODE (
        REGION_ID,
        1,
        'Europe',
        2,
        'America',
        3,
        'Asia',
        4,
        'Africa',
        'n'
    )
from
    hr.countries;

--20.Задачу №19 решите используя CASE.
select
    COUNTRY_NAME,
    CASE
        when REGION_ID = 1 then 'Europe'
        when REGION_ID = 2 then 'America'
        when REGION_ID = 3 then 'Asia'
        when REGION_ID = 4 then 'Africa'
        else 'n'
    end
from
    hr.countries;

-- 21.Выведите имя сотрудника, его з/п, а также уровень того, насколько у сотрудника хорошие условия : BAD: з/п меньше 10000 и отсутствие комиссионных; NORMAL: з/п между 10000 и 15000 или, если присутствуют комиссионные; GOOD: з/п больше или равна 15000
select
    first_name,
    salary,
    case
        when salary < 10000
        and commission_pct is null then 'BAD'
        when between(10000 and 15000)
        or commission_pct is not null then 'NORMAL'
        else 'GOOD'
    end
from
    hr.EMPLOYEES;