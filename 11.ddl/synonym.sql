--SYNONYM
-- private synonym
-- public synonym
--select * from hr.employees@orclpdb2;
--create public synonym employees for hr.employees@orclpdb2;
--create synonym employees for hr.employees@orclpdb2;
-- если создать паблик синоним и прайвет, то сработает прайвет!
;

--удалить синоним
--drop public synonym employees;
;

--изменить синоним
--alter public synonym compile