-- SINGLE_ROW F
;

--SYSDATE - возвращает текущую дату и время
;

--MONTHS_BETWEEN(date1, date2) - возвращает количество месяцев между двумя датами
--SELECT MONTHS_BETWEEN('2023-10-01', '2023-01-01') from dual - вернет 9? ,более поздняя-более ранняя, иначе будет отрицательное число
;

--ADD_MONTHS(date, number) - добавляет указанное количество месяцев к дате
--SELECT ADD_MONTHS('2023-10-01', 1) from dual - вернет 2023-11-01
--SELECT ADD_MONTHS('2023-10-01', -1) from dual - вернет 2023-09-01
;

--NEXT_DAY(date, 'day') - возвращает дату следующего указанного дня недели
--SELECT NEXT_DAY('2023-10-01', 'MONDAY') from dual - вернет 2023-10-02
--SELECT NEXT_DAY('2023-10-01', 'SUNDAY') from dual - вернет 2023-10-08
;

--LAST_DAY(date) - возвращает последний день месяца для указанной даты
--SELECT LAST_DAY('2023-10-01') from dual - вернет 2023-10-31
;

--ROUND(date, format) - округляет дату 
-- Век - 'CC', год - 'YY', месяц - 'MM', день - 'DD', час - 'HH', минута - 'MI', секунда - 'SS'
--SELECT ROUND('2023-10-01', 'MM') from dual - вернет 2023-10-01
--SELECT ROUND('2023-10-01', 'YY') from dual - вернет 2023-01-01
;

--TRUNC(date, format) - обрезает дату
-- Век - 'CC', год - 'YY', месяц - 'MM', день - 'DD', час - 'HH', минута - 'MI', секунда - 'SS' 
--SELECT TRUNC('2023-10-05', 'MM') from dual - вернет 2023-10-01
--SELECT TRUNC('2023-10-01', 'YY') from dual - вернет 2023-01-01