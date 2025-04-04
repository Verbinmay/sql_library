-- SELECT * FROM table_name
-- SELECT column1, column2 FROM table_name

DISTINCT - уникальные значения
-- SELECT DISTINCT column1, column2 FROM table_name - уникальные значения по двум столбцам, т.е. на все указанные столбцы сразу

EXPRESSIONS - выражения
-- SELECT column1 + column2 AS sum FROM table_name - сложение двух столбцов 

CONCATENATION - конкатенация в один столбец
-- SELECT column1 || column2 AS concatenated FROM table_name - конкатенация двух столбцов
-- SELECT column1 || ' ' || column2 AS concatenated FROM table_name - конкатенация двух столбцов с пробелом между ними

ALIAS - псевдонимы
-- SELECT column1 alias_name FROM table_name - псевдоним для столбца
-- SELECT column1 AS alias_name FROM table_name - псевдоним для столбца
-- SELECT column1 "alias name" FROM table_name - псевдоним для столбца с пробелом в имени
-- при использовании кавычек в имени псевдонима, имя столбца будет регистрозависимым

DUAL - специальная таблица, которая содержит одну строку и один столбец
-- SELECT 'Hello World' FROM DUAL - выводит строку 'Hello World'
-- SELECT 1 + 1 FROM DUAL - выводит результат сложения 1 + 1
-- SELECT SYSDATE FROM DUAL - выводит текущую дату и время

-- КАВЫЧКИ
-- SELECT 'It''s a test' FROM DUAL - выводит строку 'It's a test'

-- SELECT q 'delimiter It's a test' delimiter' FROM DUAL - выводит строку 'It's a test'
-- SELECT q'<It's a test>' FROM DUAL - выводит строку 'It's a test'
-- SELECT q'[It's a test]' FROM DUAL - выводит строку 'It's a test'
-- SELECT q'!It's a test!' FROM DUAL - выводит строку 'It's a test'

