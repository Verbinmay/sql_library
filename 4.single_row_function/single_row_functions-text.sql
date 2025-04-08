-- SINGLE_ROW F
;

--LOWER(str) - только с буквами, нижний регистр
--SELECT column1, LOWER(column1) from table_name
--SELECT column1, column1 from table_name where LOWER(column1) = 'value'
;

--UPPER(str) - только с буквами, верхний регистр
--SELECT column1, UPPER(column1) from table_name
;

--INITCAP(str) - приводит первую букву каждого слова к верхнему регистру
--SELECT column1, INITCAP(column1) from table_name
--SELECT column1, column1 from table_name where INITCAP(column1) = 'Value'
;

--CONCAT(str, str) - соединяет две строки ||, конвертирует все в строку, только два параметра
--SELECT column1, CONCAT(column1, column2) from table_name
;

--LENGTH(str) - длина строки
--SELECT column1, LENGTH(column1) from table_name
--SELECT column1, LENGTH(column1) from table_name order by LENGTH(column1) desc
--SELECT column1, column1 from table_name where LENGTH(column1) = 5
--
;

--LPAD|RPAD(str, length, fill) - добавляет пробелы в строку слева|справа, строка/длинна строки/текст для заполнения, если конечный текст меньше строки, то обрежет 
--SELECT column1, LPAD(column1, 10) from table_name
--SELECT column1, RPAD(column1, 10) from table_name
--SELECT column1, LPAD(column1, 10, '0') from table_name
;

--TRIM(str) - убирает пробелы в начале и конце строки
--trailing - убирает пробелы только в конце строки
--leading - убирает пробелы только в начале строки
--both - убирает пробелы в начале и конце строки (по умолчанию)
--SELECT TRIM(trailing 'a' from 'dda') from dual
;

--INSTR(str, str, start position, вхождение по счету) - ищет вхождение строки в строке, возвращает позицию первого вхождения или не первого, если указана позиция
--SELECT * from table_name where INSTR(column1, 'value') > 0
--SELECT * from table_name where INSTR(column1, 'value', 1, 2) > 0
--вернет позицию второго вхождения в строке , начало проверки с 1
;

--SUBSTR(str, start position, length) - возвращает часть строки, начиная с позиции и длиной
--SELECT SUBSTR(column1, 1, 5) from table_name
-- вернет первые 5 символов строки с позиции 1, если 5 не указать, то вернет все символы начиная с 1, может вернуть null, если позиция отрицательная, то с конца строки отсчет будет 
;

--REPLACE(str, search item, replacement str) - заменяет часть строки на другую строку, хотя replacement str может отсутствовать, тогда просто сотрет
--SELECT REPLACE('hi value', 'value', 'new_value') from dual