--1. Получите список всех сотрудников, у которых длина имени больше 10 букв.
SELECT
    *
from
    hr.EMPLOYEES
where
    LENGTH (FIRST_NAME) > 10;

--2. Получите список всех сотрудников, зарплата которых кратна 1000
SELECT
    *
from
    hr.EMPLOYEES
where
    MOD(SALARY, 1000) = 0;

--3. Выведите телефонный номер и первое 3х значное число телефонного номера сотрудника, если его номер представлен в формате ХХХ.ХХХ.ХХХХ .
SELECT
    PHONE_NUMBER,
    SUBSTR (PHONE_NUMBER, 1, 3)
from
    hr.EMPLOYEES
where
    PHONE_NUMBER like '___.___.____';

--4. Получите список всех сотрудников, у которых последняя буква в имени равна 'm' и длина имени больше 5ти.
select
    *
from
    hr.EMPLOYEES
where
    length (FIRST_NAME) > 5
    and FIRST_NAME like '%m';

select
    *
from
    hr.EMPLOYEES
where
    length (FIRST_NAME) > 5
    and SUBSTR (FIRST_NAME, -1) = 'm';

--5. Выведите дату следующей пятницы.
select
    next_day (sysdate, 'fri')
from
    dual;

--6. Получите список всех сотрудников, которые работают в компании больше 12 лет и 6ти месяцев (150 месяцев).
select
    *
from
    hr.EMPLOYEES
where
    months_between (sysdate, HIRE_DATE) > (12 * 12 + 6);

--7. Выведите телефонный номер, заменив в значении PHONE_NUMBER все'.' на '-'.
select
    REPLACE (PHONE_NUMBER, '.', '-')
from
    hr.EMPLOYEES;

--8. Выведите имя, email, job_id для всех работников в формате: STEVEN sking Ad_Pres
select
    UPPER(FIRST_NAME),
    LOWER(EMAIL),
    INITCAP (JOB_ID)
from
    hr.EMPLOYEES;

--9. Выведите информацию о имени работника и его з/п, не используя символ || , в таком виде: Steven24000
select
    concat (FIRST_NAME, SALARY)
from
    hr.EMPLOYEES;

--10.Выведите информацию о дате приёма сотрудника на работу, округлённой дате приёма на работу до месяца и первом дне года приёма на работу
select
    HIRE_DATE,
    round(HIRE_DATE, 'MM'),
    trunc (HIRE_DATE, 'YYYY')
from
    hr.EMPLOYEES;

--11.Выведите информацию о имени и фамилии всех работников. Имя должно состоять из 10 символов и если длина имени меньше 10, то дополняйте до 10 символов знаком $. Фамилия должна состоять из 15 символов и если длина фамилии меньше 15, то перед фамилией ставьте столько знаков ! сколько необходимо.
select
    RPAD (first_name, 10, '$'),
    LPAD (last_name, 15, '!')
from
    hr.employees;

--12.Выведите имя сотрудника и позицию второй буквы ‘a’ в его имени.
select
    first_name,
    INSTR (first_name, 'a', 1, 2)
from
    hr.employees;

--13.Выведите на экран текст '!!!HELLO!! MY FRIEND!!!!!!!!' и тот же текст, но без символа восклицательный знак в начале и конце текста.
select
    '!!!HELLO!! MY FRIEND!!!!!!!!',
    trim(
        '!'
        from
            '!!!HELLO!! MY FRIEND!!!!!!!!'
    )
from
    dual;

--14.Выведите информацию о: з/п работника, з/п умноженной на коэффициент 3.1415 , округлённый до целого значения вариант увеличенной з/п-ты, целое количество тысяч из увеличенной з/п.
select
    salary,
    ROUND(salary * 3.1415),
    TRUNC (salary * 3.1415, -3) / 1000
from
    hr.employees;

--15.Выведите информацию о: дате приёма сотрудника на работу, дате, которая была через пол года, после принятия сотрудника  работу, дате последнего дня в месяце принятия сотрудника на работу
select
    hire_date,
    ADD_MONTHs (hire_date, 6),
    last_day (hire_date)
from
    hr.EMPLOYEES