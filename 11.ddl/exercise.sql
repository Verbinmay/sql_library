--1. Создать таблицу friends с помощью subquery так, чтобы она после создания содержала значения следующих столбцов из таблицы employees: employee_id, first_name, last_name для тех строк, где имеются комиссионные. Столбцы в таблице friends должны называться id, name, surname .
create table
    friends as (
        select
            employee_id as id,
            first_name as name,
            last_name as surname
        from
            hr.EMPLOYEES
        where
            commission_pct is not null
    );

--2. Добавить в таблицу friends новый столбец email .
alter table friends add (email VARCHAR2 (30));

--3. Изменить столбец email так, чтобы его значение по умолчанию было «no email».
alter table friends modify (email VARCHAR2 (30) default 'no email');

--4. Проверить добавлением новой строки, работает ли дефолтное значение столбца email.
insert into
    friends (id, name, surname)
values
    (1, INITCAP ('mart'), 'Franker');

--5. Изменить название столбца с id на friends_id .
alter table friends
rename column id to friends_id;

--6. Удалить таблицу friends.
drop table friends;

--7. Создать таблицу friends со следующими столбцами: id, name, surname, email, salary, city, birthday. У столбцов salary и birthday должны быть значения по умолчанию.
create table
    friends (
        id integer,
        name VARCHAR2 (20),
        surname VARCHAR2 (20),
        email VARCHAR2 (20),
        salary number (10, 2) default 5000.00,
        city VARCHAR2 (20),
        birthday DATE default to_date ('05-SEP-2000', 'DD-MON-YYYY')
    );

--8. Добавить 1 строку в таблицу friends со всеми значениями.
insert into
    friends (ID, NAME, SURNAME, EMAIL, SALARY, CITY, BIRTHDAY)
values
    (
        12,
        initcap ('mark'),
        initcap ('fox'),
        lower('cccc@mail.com'),
        4000.00,
        initcap ('san franc'),
        to_date ('04-NOV-2014')
    );

--9. Добавить 1 строку в таблицу friends со всеми значениями кроме salary и birthday.
insert into
    friends (ID, NAME, SURNAME, EMAIL, CITY)
values
    (
        12,
        initcap ('mark'),
        initcap ('fox'),
        lower('cccc@mail.com'),
        initcap ('san franc')
    );

--10.Совершить commit.
--11.Удалить столбец salary из таблицы friends.
drop column salary;

--12.Сделать столбец email неиспользуемым (unused).
alter table friends
set
    UNUSED (email);

--13.Сделать столбец birthday неиспользуемым (unused).
alter table friends
set
    unused (birthday);

--14.Удалить из таблицы friends неиспользуемые столбцы.
alter table friends
drop UNUSED COLUMNS;

--15.Сделать таблицу friends пригодной только для чтения.
alter table friends read only;

--16.Проверить предыдущее действие любой DML командой.
alter table friends
drop (id);

--17.Опустошить таблицу friends.
alter table friends read write;

truncate table friends;

--18.Удалить таблицу friends.
drop table friends;