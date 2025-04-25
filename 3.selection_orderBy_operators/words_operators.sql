-- BETWEEN
-- SELECT column1, column2 FROM table_name WHERE column1 BETWEEN value1 AND value2 - выводит все столбцы из таблицы employees, где column1 работника находится в диапазоне от a до b
-- SELECT column1, column2 FROM table_name WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31' - выводит все столбцы из таблицы employees, где дата начала работы находится в диапазоне от 1 января 2023 года до 31 декабря 2023 года
-- SELECT * FROM employees WHERE first_name BETWEEN 'A' AND 'C' - выводит все столбцы из таблицы employees, где имя работника начинается с буквы A и заканчивается на букву C
;

-- IN 
-- (NOT IN - не использовать с NULL)
-- SELECT column1, column2 FROM table_name WHERE column1 IN (value1, value2, value3) - выводит все столбцы из таблицы employees, где column1  равна a или b или c
;

-- IS NULL
-- SELECT column1, column2 FROM table_name WHERE column1 IS NULL - выводит все столбцы из таблицы employees, где column1 равна NULL
;

-- LIKE
-- % - любое количество символов
-- _ - один символ
-- ESCAPE - символ, который будет использоваться для экранирования специальных символов
-- SELECT column1, column2 FROM table_name WHERE column1 LIKE 'A%' - выводит все столбцы из таблицы employees, где имя работника начинается с буквы A
-- SELECT column1, column2 FROM table_name WHERE column1 LIKE '%A' - выводит все столбцы из таблицы employees, где имя работника заканчивается на букву A
-- SELECT column1, column2 FROM table_name WHERE column1 LIKE '%A%' - выводит все столбцы из таблицы employees, где имя работника содержит букву A
-- SELECT column1, column2 FROM table_name WHERE column1 LIKE '_A%' - выводит все столбцы из таблицы employees, где имя работника начинается с любого символа и второй символ A
-- SELECT column1, column2 FROM table_name WHERE column1 LIKE 'A_' - выводит все столбцы из таблицы employees, где имя работника начинается с буквы A и второй символ любой
-- SELECT column1, column2 FROM table_name WHERE column1 LIKE 'A\_%' ESCAPE '\' - выводит все столбцы из таблицы employees, где имя работника начинается с буквы A и второй символ _
;

-- AND 
-- SELECT column1, column2 FROM table_name WHERE column1 = value1 AND column2 = value2 - выводит все столбцы из таблицы employees, где column1 равна a и column2 равна b
;

-- OR
-- SELECT column1, column2 FROM table_name WHERE column1 = value1 OR column2 = value2 - выводит все столбцы из таблицы employees, где column1 равна a или column2 равна b
;

-- NOT
-- SELECT column1, column2 FROM table_name WHERE NOT column1 = value1 - выводит все столбцы из таблицы employees, где column1 не равна a
-- SELECT column1, column2 FROM table_name WHERE NOT IN (value1, value2, value3) - выводит все столбцы из таблицы employees, где column1 не равна a и не равна b и не равна c
-- SELECT column1, column2 FROM table_name WHERE IS NOT NULL - выводит все столбцы из таблицы employees, где column1 не равна NULL
-- AND работает перед OR
;

-- ANY 
-- SELECT column1, column2 FROM table_name WHERE column1 = ANY (value1, value2, value3) - выводит все столбцы из таблицы employees, где column1 равна a или b или c