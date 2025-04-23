-- NATURAL JOIN - таблица, которая содержит все строки из обеих таблиц, которые имеют одинаковые значения в столбцах с одинаковыми именами, но если нет, то нет 
-- SELECT columns FROM table1 NATURAL JOIN table2;
-- select * from table1 natural join table2;
-- SELECT t1.column1, t2.column1, column2 FROM table1 t1 NATURAL JOIN table2 t2;
-- нельзя указывать элиас для столбца, по которому идет соединение
;

-- JOIN USING - соединяет таблицы по конкретным столбцам с одинаковыми именами
-- SELECT columns FROM table1 JOIN table2 USING (column_name);
;

-- JOIN ON - соединяет таблицы по конкретным столбцам с разными именами
-- SELECT columns FROM table1 JOIN table2 ON table1.column_name = table2.column_name_name;
--NONEQUIJOIN with ON - знаки сравнения
-- select columns from table1 join table2 on table1.column_name > table2.column_name;
-- select first_name, salary, min(salary), max(salary) from employees e join jobs j on (e.job_id = j.job_id and salary*2 < max_salary);
;

--SELF JOIN - соединение таблицы с самой собой
-- SELECT emp1.employee_id, emp1.first_name, emp2.first_name FROM employees emp1 JOIN employees emp2 ON emp1.manager_id = emp2.employee_id;
;

--OUTER JOIN - соединяет таблицы, даже если нет совпадений
-- LEFT OUTER JOIN - возвращает все строки из левой таблицы и совпадающие строки из правой таблицы
--RIGHT OUTER JOIN - возвращает все строки из правой таблицы и совпадающие строки из левой таблицы
--FULL OUTER JOIN - возвращает все строки из обеих таблиц, даже если нет совпадений
-- SELECT columns FROM table1 LEFT OUTER JOIN table2 ON table1.column_name = table2.column_name;
;

-- CROSS JOIN - возвращает декартово произведение двух таблиц
-- SELECT columns FROM table1 CROSS JOIN table2;