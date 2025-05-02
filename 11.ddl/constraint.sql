--CONSTRAINT - это ограничение, которое накладывается на данные в таблице
;

--NOT NULL - ограничение, которое запрещает вставку NULL в столбец
--PRIMARY KEY - ограничение, которое определяет уникальный идентификатор для каждой строки в таблице
--FOREIGN KEY - ограничение, которое устанавливает связь между двумя таблицами
--CHECK - ограничение, которое проверяет, соответствует ли значение в столбце определенному условию
--UNIQUE - ограничение, которое гарантирует уникальность значений в столбце( исключение NULL)
;

--INDEX - это структура данных, которая улучшает скорость операций выборки данных из таблицы (primary key, unique key индексируются)
;

-------------------------------------------------------
--UNIQUE (nulls )
create table
    students (
        id number constraint st_id_unique unique,
        first_name varchar2 (20),
        course number,
        faculty_id integer,
        avg_score number (5, 2),
        start_date date,
        scholarship integer
    );

-- уникальность по двум столбцам (дубликаты с null)
-- можно писать без constraint и имени
create table
    students (
        id number,
        first_name varchar2 (20),
        course number,
        faculty_id integer,
        avg_score number (5, 2),
        start_date date,
        scholarship integer,
        CONSTRAINT st_id_unique unique (id, first_name)
    );

--создать после создания таблицы
--ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (column1, column2)
--ALTER TABLE table_name ADD UNIQUE (column1, column2)
;

--изменить ограничение
--ALTER TABLE table_name MODIFY (id constraint st_id_unique unique)
--ALTER TABLE table_name MODIFY (id unique)
;

--удалить ограничение
--ALTER TABLE table_name DROP CONSTRAINT constraint_name
;

--другое:
--insert into students values ( 1, 'Mark', 2, 1, 4.5, to_date ('01-SEP-2020', 'DD-MON-YYYY'), 1000);
--insert into students values ( null, 'Mark', 2, 1, 4.5, to_date ('01-SEP-2020', 'DD-MON-YYYY'), 1000);
-------------------------------------------------------
;

--NOT NULL
--не сможем создавать без имени и constraint, не сможем создать на уровне таблицы, только на уровне столбца, с помощью modify мы сможем изменить на not null, но с помощью add constraint не сможем
create table
    students (
        id number,
        name varchar2 (20),
        course number constraint st_course_not_null not null,
        faculty_id integer
    );

--INSERT INTO STUDENTS (ID, NAME, COURSE, FACULTY_ID) VALUES (1, 'Mark', null, 1);
;

--создать после создания таблицы или изменить
--ALTER TABLE table_name MODIFY (column1 NOT NULL)
--ALTER TABLE table_name MODIFY (column1 constraint st_course_not_null not null)
;

--убрать ограничение
--ALTER TABLE table_name MODIFY (column1 null)
-------------------------------------------------------
;

--PRIMARY KEY (нельзя null и дубликаты, нельзя больше одного)
--not null + unique
create table
    students (
        id number constraint st_id_pk primary key,
        name varchar2 (20),
        course number,
        faculty_id integer
    );

create table
    students (
        id number,
        name varchar2 (20),
        course number,
        faculty_id integer,
        constraint st_id_pk primary key (id, name)
    );

--ALTER TABLE table_name MODIFY (column1 constraint st_id_pk primary key)
--ALTER TABLE table_name ADD CONSTRAINT constraint_name PRIMARY KEY (column1, column2)
--ALTER TABLE table_name ADD PRIMARY KEY (column1, column2)
-------------------------------------------------------
;

--FOREIGN KEY (ссылается на первичный ключ другой таблицы или на уникальный, допускает null)
create table
    faculty (
        id number constraint f_id_pk primary key,
        name varchar2 (20)
    );

create table
    students (
        id number constraint st_id_pk primary key,
        name varchar2 (20),
        course number,
        faculty_id integer constraint st_f_id_fk references faculty (id)
    );

--сокращенный вариант
create table
    students (
        id number,
        name varchar2 (20),
        course number,
        faculty_id integer references faculty (id)
    );

--табличный
create table
    students (
        id number,
        name varchar2 (20),
        course number,
        faculty_id integer,
        CONSTRAINT st_f_id_fk foreign key (faculty_id) references faculty (id)
    );

--создание после создания таблицы или изменение
--ALTER TABLE table_name MODIFY (column1 constraint st_f_id_fk foreign key references faculty (id))
--ALTER TABLE table_name ADD CONSTRAINT constraint_name FOREIGN KEY (column1) REFERENCES faculty (id)
--ALTER TABLE table_name ADD FOREIGN KEY (column1) REFERENCES faculty (id)
;

--insert into faculty values (1, 'Math');
--insert into students values (1, 'Mark', 2, 1);
--insert into students values (2, 'Mark', 2, null) - сработает 
--insert into students values (2, 'Mark', 2, 2) - не сработает
-------------------------------------------------------
;

-- ON DELETE CASCADE для FOREIGN KEY
--удалить строку из родительской таблицы и все строки из дочерней
--ALTER TABLE table_name ADD CONSTRAINT constraint_name FOREIGN KEY (column1) REFERENCES faculty (id) ON DELETE CASCADE
;

-- ON DELETE SET NULL
--удалить строку из родительской таблицы и установить null в дочерней
--ALTER TABLE table_name ADD CONSTRAINT constraint_name FOREIGN KEY (column1) REFERENCES faculty (id) ON DELETE SET NULL
-------------------------------------------------------
;

--CHECK 
create table
    students (
        id number,
        name varchar2 (20),
        course number constraint st_course_check check (
            course > 0
            and course < 7
        ),
        faculty_id integer
    );

;

--используя уровень таблицы можно использовать поля таблицы
create table
    students (
        id number,
        name varchar2 (20),
        course number,
        faculty_id integer,
        CONSTRAINT st_course_check check (
            course > id
            and course < id
        )
    );

--alter table students modify (course constraint st_course_check check (course > 0 and course < 7));
--alter table students modify (course check (course > 0 and course < 7));
--alter table students add constraint st_course_check check (course > 0 and course < 7);
--alter table students add check (course > 0 and course < 7)
;

create table
    students (
        id number,
        email varchar2 (20) check (instr (email, '@') > 0) unique
    )