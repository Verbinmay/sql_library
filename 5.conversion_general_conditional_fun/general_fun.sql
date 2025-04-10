-- NESTED FUNCTIONS - вложенные функции
;

--GENERAL FUNCTION - общая функция
;

--NVL - замена NULL значений, проверяет первое значение, если NULL, то возвращает второе значение
-- select NVL(NULL, 1) from dual - 1
-- select NVL(1, 2) from dual - 1
;

--NVL2 - замена NULL значений, проверяет первое значение, если NULL, то возвращает третье  значение, если не NULL, то возвращает второе значение
-- select NVL2(NULL, 1, 2) from dual - 2
-- select NVL2(1, 2, 3) from dual - 2
;

--NULLIF - проверяет два значения, если они равны, то возвращает NULL, если не равны, то возвращает первое значение
-- select NULLIF(1, 1) from dual - NULL
-- select NULLIF(1, 2) from dual - 1
;

--COALESCE - проверяет несколько значений, возвращает первое не NULL значение
-- select COALESCE(NULL, NULL, 1, 2) from dual - 1
;

--DECODE(expression, comp1, iftrue1, comp2, iftrue2, ..., iffalse) - проверяет выражение на равенство с несколькими значениями, если равно, то возвращает соответствующее значение, если не равно, то возвращает последнее значение
-- select DECODE(1, 1, 'one', 2, 'two', 3, 'three', 'other') from dual - 'one'
-- select DECODE(2, 1, 'one', 2, 'two', 3, 'three', 'other') from dual - 'two'
-- select DECODE(3, 1, 'one', 2, 'two', 3, 'three', 'other') from dual - 'three'
-- null = null
;

--CASE: simple and search
--simple case - проверяет одно выражение на равенство с несколькими значениями
select
    CASE 1
        WHEN 1 THEN 'one'
        WHEN 2 THEN 'two'
        ELSE 'other'
    END
from
    dual
    -- - 'one'
;

-- search case - условие внутри каждого WHEN
select
    CASE
        WHEN 1 = 1 THEN 'one'
        WHEN 2 = 2 THEN 'two'
        ELSE 'other'
    END
from
    dual
    -- - 'one'
;