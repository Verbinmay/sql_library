--SEQUENCE - генерация последовательности
;

--create sequence name_sequence increment by number start with number {maxvalue number | nomaxvalue} {minvalue number | nomminvalue} {cycle | nocycle} {cache number | nocache}
--create sequence seq_student_id - 1,2,3,4
--create sequence seq_student_id increment by 3 - 1,4,7,10
--create sequence seq_student_id increment by -3 - 1,-2,-5,-8
--create sequence seq_student_id increment by 3 start with 10 - 10,13,16
--create sequence seq_student_id maxvalue 1000 - 1,2,3,4...999 ошибка
--create sequence seq_student_id minvalue 1000 - 1000,1001,1002
--create sequence seq_student_id maxvalue 3 cycle - 1,2,3,1,2,3
--create sequence seq_student_id cache 30000 - просто сразу создает 30000 последовательностей, чтобы не тратить время на создание каждой 
;

--nextval - получить следующее значение последовательности
--currval - получить текущее значение последовательности
-- относится к этой сессии
--select seq_student_id.nextval from dual; 
--select seq_student_id.currval from dual;
;

--create table students (id number, name varchar(50), faculty_id number);
--create table faculties (id number, name varchar(50));
create sequence seq_st;

create sequence seq_fac start
with
    20 increment by 5;

insert into
    faculties (id, name)
values
    (seq_fac.nextval, 'Факультет 1');

insert into
    faculties (id, name)
values
    (seq_fac.nextval, 'Факультет 2');

--вернет последний факультет, который был вставлен в таблицу faculties
insert into
    students (id, name, faculty_id)
values
    (seq_st.nextval, 'Студент 1', seq_fac.currval);

insert into
    students (id, name, faculty_id)
values
    (
        seq_st.nextval,
        'Студент 2',
        (
            select
                id
            from
                faculties
            where
                name = 'Факультет 1'
        )
    );

-- create sequence s4 increment by 2 maxvalue 17 cycle cache 5;
-- в таких случаях, когда максимальное значение МЕНЬШЕ, чем стандартное значение кеша, может выкидывать ошибку, но если указать кеш вручную, то все будет работать
;

--при цикле последовательность будет возвращаться не к указанному началу 
--если в кеше значения не используются все, но происходит сбой системы, но при активации кеш будет утерян и будут дыры в последовательности;
;

--изменение sequence
--alter sequence name_sequence increment by number start with number {maxvalue number | nomaxvalue} {minvalue number | nomminvalue} {cycle | nocycle} {cache number | nocache}
alter sequence seq_student_id increment by 2;

-- удалить последовательность
--drop sequence name_sequence
drop sequence seq_student_id;