-- ORDER BY - сортировка 
-- SELECT * FROM table_name where expression ORDER BY column 
-- Сортировка происходит от меньшего к большему, даты от меньшей к большей

-- ORDER BY column_name ASC|DESC
-- ASC - по возрастанию (дефолтное), DESC - по убыванию
-- ORDER BY column_name [ASC|DESC] NULLS LAST |NULLS FIRST 
-- NULLS LAST - NULL значения в конце, NULLS FIRST - NULL значения в начале
-- SELECT column1, column2 from table_name order by 2
-- 2 - из селект листа 
-- SELECT column1, column2 from table_name order by column1 desc, column2 
-- сортировка по двум столбцам, сначала сортировка по первому столбцу, те, у кого первый столбец одинаковый, сортировка происходит по второму 
-- SELECT column1, column2 from table_name order by column1 desc nulls last, column2

