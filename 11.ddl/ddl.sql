--покажет таблицы юзера
select
    table_name
from
    user_tables;

--названия - правила:
-- 1. не могут начинаться с цифры
-- 2. не могут содержать пробелы( кроме в кавычках)
-- 3. не могут содержать специальные символы ( кроме _ и $, и #)
-- 4. не могут содержать зарезервированные слова
-- 5. не могут содержать символы, которые не поддерживаются в кодировке
;

--типы данных
-- timestamp with timezone (содержит информацию о временной зоне)
-- timestamp with local timezone (время в зависимости от часового пояса)
-- interval year to month (разница между датами в годах и месяцах)
-- interval day to second (разница между датами в днях, часах, минутах и секундах)
-- clob (символьные данные)
-- blob (бинарные данные)
-- long (required)  
;

--CREATE TABLE
-- create table table_name (column1 datatype, column2 datatype, column3 datatype DEFAULT value)
create table
    students (
        student_id integer,
        first_name varchar2 (20),
        start_date date DEFAULT ROUND(sysdate),
        scholarship number (5, 2),
        avg_score number (3, 2) DEFAULT 5
    );

--create table table_name as (select column1, column2 from table_name2 where condition)
create table
    new_emps2 as (
        select
            first_name,
            salary
        from
            hr.employees
        where
            1 = 2
    );

--изменение таблицы
--откатить (rollback) нельзя
;

--ALTER TABLE
--добавить столбец
--ALTER TABLE table_name ADD (column1 datatype, column2 datatype)
alter table students add (course number default 3);

--изменить параметры столбца
--ALTER TABLE table_name MODIFY (column1 datatype, column2 datatype)
alter table students modify (first_name varchar2 (30));

alter table students modify (start_date date default null);

--удалить столбец
--ALTER TABLE table_name DROP (column1, column2)
alter table students
drop (course);

--больше не использовать столбец, не отображать его, но не удалять
--ALTER TABLE table_name SET UNUSED (column1, column2)
alter table students
set
    unused (course);

--удалить столбец, который больше не используется
--ALTER TABLE table_name DROP UNUSED COLUMNS
alter table students
drop unused columns;

--переименовать столбец
--ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name
alter table students
rename column first_name to name;

--только чтение (но можно удалить всю таблицу)
--ALTER TABLE table_name READ ONLY
alter table students read only;

alter table students read write;

--удаляет все строки из таблицы, но не удаляет саму таблицу
--TRUNCATE TABLE
--truncate table table_name
truncate table students;

--удаляет таблицу и все ее данные
--DROP TABLE
--drop table table_name
drop table students;