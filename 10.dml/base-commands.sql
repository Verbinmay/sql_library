--DESCRIBE HR.EMPLOYEES - вывести структуру таблицы
;

--INSERT
--insert into table_name (columns) values (values) 
insert into
    hr.countries
values
    ('cw', 'sweden', 1);

insert into
    hr.countries (country_id, country_name, region_id)
values
    ('cw', 'sweden', 1);

--можно вставить несколько строк
insert into
    hr.countries (country_id, country_name, region_id)
values
    ('cw', 'sweden', 1),
    ('cw', 'sweden', 1);

insert into
    hr.countries (country_id, country_name, region_id) (
        select
            country_id,
            country_name,
            region_id
        from
            hr.countries2
        where
            country_id = 'cw'
    );

--вставить строки в несколько таблиц
insert all when country_id = 'cw' then into hr.countries (country_id, country_name, region_id) when 5 = 5 then into hr.countries (country_id, country_name, region_id)
values
    ('cw', 'sweden', 1);

--UPDATE 
--если информации нет, то может создать новую запись
--update table_name set column1 = value1, column2 = value2 where condition
--update hr.employees set salary = 1000 where employee_id = 100
;

--DELETE
--delete from table_name where condition
--delete from table_name (все записи)


--MERGE
--merge into table_name using table_name2 on (condition) when matched then update set column1 = value1, column2 = value2 when not matched then insert (columns) values (values)
