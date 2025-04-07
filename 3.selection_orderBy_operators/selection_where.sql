--WHERE -  условие
Select
    *
from
    employees
where
    last_name = 'King';

-- SELECT * FROM employees WHERE last_name = 'King' - выводит все столбцы из таблицы employees, где фамилия работника равна 'King'
-- SELECT * FROM employees WHERE employee_id > 100 - выводит все столбцы из таблицы employees, где id работника больше 100
-- SELECT * FROM employees WHERE hire_date < '2023-01-01' - выводит все столбцы из таблицы employees, где дата трудоустройства меньше 1 января 2023 года

-- SELECT * FROM employees WHERE salary != 1000 - выводит все столбцы из таблицы employees, где зарплата работника не равна 1000
-- SELECT * FROM employees WHERE salary <> 1000 - выводит все столбцы из таблицы employees, где зарплата работника не равна 1000

