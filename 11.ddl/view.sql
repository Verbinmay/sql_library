--VIEW
-- simple view and complex view
-- create view view_name as (select * from table_name)
create view
    fin as (
        select
            employee_id,
            job_id,
            salary
        from
            EMPLOYEES
    );

--create table employees as (select * from hr.EMPLOYEES)
;

--simple view (можем делать insert, update, delete)
-- одна таблица
-- нет функций
-- нет агрегаций 
;

--complex view (иногда может пройти команды, иногда нет, если ничего не мешает)
-- несколько таблиц
-- есть функции
-- есть агрегации
;

--view с использованием алиасов все равно пропустит команды
--create view view_name as (select column1 as alias1, column2 as alias2 from table_name)
;

---------------------------------------
--CREATE or replace {FORCE|NOFORCE} VIEW view_name (alias1...) AS SUBQUERY WITH CHECK OPTION {CONSTRAINT constraint_name} WITH READ ONLY {CONSTRAINT constraint_name};
--alias - алиасы для колонок, но если указать алиасы, то все?
--constraint - имя ограничения (чтобы при ошибке было понятно, что именно не так)
;

--создать или заменить
create
or replace fin2 as (
    select
        employee_id,
        job_id,
        salary
    from
        EMPLOYEES
);

--force - заставит создать независимо от наличия таблицы в селекте (employees),однако сделать селект созданной таблицы не получится все равно, ибо основания для вью не будут найдены
create force view as
select
    *
from
    EMPLOYEES;

;

--with check option - проверяет, что данные, которые вставляются в вью, соответствуют условиям вью
create view
    view_name as
select
    *
from
    EMPLOYEES
where
    employee_id > 1000
with
    check option;

--не получится вставить данные с employee_id < 1000 или изменить employee_id на < 1000
;

--with read only - запрет на изменение данных в вью
create view
    view_name as
select
    *
from
    EMPLOYEES
with
    read only;

    ;

-------------------------
--ALTER VIEW
--это полезно, если вью изначально неактуально, но создано с помощью форсе, другими словами, не хватает колонок, как пример. В таком случае, вью не сможет отобразиться. 
--alter view view_name compile - компилирует вью вручную, если селект уже актуален

--Обновление представления в SQL означает изменение отображаемых им данных. Однако не все представления могут обновляться мгновенно. Представления со сложными запросами, например, с объединениями , подзапросами или агрегатными функциями , могут не обновляться напрямую. Существует два способа обновить представление: с помощью ключевого слова UPDATE или с помощью ключевого слова CREATE OR REPLACE. Ключевое слово UPDATE используется для обновления представления без изменения схемы таблицы. Ключевое слово Update будет использоваться для обновления значений атрибутов. Ключевое слово CREATE OR REPLACE используется для обновления представления, где схема представления также может быть изменена. Как следует из названия, если представление отсутствует, оно будет создано. Если представление присутствует, то представление будет заменено