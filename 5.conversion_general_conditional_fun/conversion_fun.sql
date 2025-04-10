--CONVERSION FUNCTION - преобразование данных
;

--TO_CHAR(number, format, nls_parameters) - преобразование числа в строку
-- select TO_CHAR(18) from dual 
--  9 - Ширина выводимого числа 
--  0 - Заполнение нулями
-- . - Десятичная точка
-- D - Разделитель дробной части
-- , - Позиция запятой
-- G - Разделитель групп
-- $ - Знак валюты
-- L - Локальный символ валюты
-- MI - Знак минус
-- PR - Скобки для отрицательных чисел 
-- S - Знак числа
;

-- select TO_CHAR(18, '999') from dual - '18'
-- select TO_CHAR(18, '099') from dual - '018'
-- select TO_CHAR(18, '99.99') from dual - '18.00'
-- select TO_CHAR(18, '99D99') from dual - '18.00'
-- select TO_CHAR(18, '099,99') from dual - '000,18'
-- select TO_CHAR(18, '99,99') from dual - '18'
-- select TO_CHAR(18, '99G99') from dual - '18'
-- select TO_CHAR(18, '99$') from dual - '18$'
-- select TO_CHAR(18, '99L') from dual - '18$'
-- select TO_CHAR(-18, '99MI') from dual - '18-'
-- select TO_CHAR(18, '99MI') from dual - '18'
;

--TO_CHAR(date, format, nls_parameters) - преобразование даты в строку
-- Y - последняя цифра года
-- YY - последние 2 цифры года
-- YYYY - год
-- RR - последние 2 цифры года, если год больше 50, то прибавляется 1900, если меньше 50, то прибавляется 2000
-- YEAR\year\Year - полное название года строкой(регистр зависимое) (например, 'Twenty Twenty-Five')
-- MM - месяц 
-- MON - три буквы названия месяца ( регистр зависимое) (например, 'Oct')
-- MONTH - полное название месяца строкой (регистр зависимое) (например, 'October')
-- D - день недели (1-7), зависит от NLS_DATE_LANGUAGE, по умолчанию 1 - воскресенье
-- DD - день месяца (1-31)
-- DDD - день года (1-366)
-- DY - три буквы названия дня недели ( регистр зависимое) (например, 'Mon')
-- DAY - полное название дня недели строкой (регистр зависимое) )(например, 'Monday')
-- W - неделя месяца (1-5)
-- WW - неделя года (1-53)
-- Q - квартал (1-4)
-- CC - столетие (1-99)
-- AM/PM/A.M./P.M. - показывает AM ил PM в зависимости от времени
-- HH/HH12/HH24 - часы (1-12/1-24)
-- MI - минуты (0-59)
-- SS - секунды (0-59)
-- SSSSS -секунды после полуночи
-- -/.,?!решетка - пунктуация (например, '18.10.2023')
-- TH - суффикс для дня (например, '1st', '2nd', '3rd', '4th') ('DDth "of" Month') 
-- SP - буквенное написание всей даты ('MmSP Month Yyyysp') - Nine September Two Thousand Nineteen
-- THSP/SPTH - Комбинация 'hh24SpTh' - sixteenth
;

-- при использовании форматов, могут возникать пробелы после слова, чтобы этого не происходило, нужно использовать формат 'FM' перед форматом даты
-- FM - убирает пробелы в начале и конце строки
;

-- select TO_CHAR(sysdate, 'DD.MM.YYYY') from dual - '18.10.2023'
-- select TO_CHAR(sysdate, 'DD.MM.YYYY HH24:MI:SS') from dual - '18.10.2023 12:00:00'
-- select TO_CHAR(sysdate, 'Year') from dual - 'Twenty Twenty-Five'
-- select TO_CHAR(sysdate, 'MON') from dual - 'OCT'
-- select TO_CHAR(sysdate, 'Month') from dual - 'October'
-- select TO_CHAR(sysdate, 'Month', 'NLS_DATE_LANGUAGE=RUSSIAN') from dual - 'Октябрь'
-- select TO_CHAR(sysdate, 'fmMonth') from dual - 'October'
-- select TO_CHAR(sysdate, 'PM') from dual - 'PM'
-- select TO_CHAR(sysdate, 'HH24:MI:SS') from dual - '12:00:00'
;

-- TO_DATE(string, format, nls_parameters) - преобразование строки в дату
;

-- TO_NUMBER(string, format, nls_parameters) - преобразование строки в число