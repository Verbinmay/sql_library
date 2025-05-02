--COMMIT
--ROLLBACK
--rollback to savepoint s1
--SAVEPOINT
--savepoint s1
;
--autocommit
--SET autocommit on
--SET autocommit off
;
--SELECT FOR UPDATE
-- блокирует строки, которые были выбраны в запросе, до тех пор, пока транзакция не будет завершена
--select column1 from table_name where condition for update