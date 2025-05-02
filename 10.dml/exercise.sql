--1. Перепишите и запустите данный statemenet для создания таблицы locations2, которая будет содержать такие же столбцы, что и locations: CREATE TABLE locations2 AS (SELECT * FROM locations WHERE 1=2)
--2. Добавьте в таблицу locations2 2 строки с информацией о id локации, адресе, городе, id страны. Пусть данные строки относятся к стране Италия.
insert into
    LOCATIONS2 (
        select
            *
        from
            hr.locations l
        where
            l.LOCATION_ID in (1000, 1100)
    );

--3. Совершите commit.
--4. Добавьте в таблицу locations2 ещё 2 строки, не используя перечисления имён столбцов, в которые заносится информация. Пусть данные строки относятся к стране Франция. При написании значений, где возможно, используйте функции.
insert into
    LOCATIONS2
values
    (
        to_number (1200),
        '12 less loop',
        to_number (12001),
        initcap ('Paris'),
        initcap ('Paris'),
        upper('IT')
    );

--5. Совершите commit.
--6. Добавьте в таблицу locations2 строки из таблицы locations, в которых длина значения столбца state_province больше 9.
INSERT INTO
    LOCATIONS2 (
        location_id,
        street_address,
        city,
        state_province,
        postal_code,
        country_id
    )
SELECT
    location_id,
    street_address,
    city,
    state_province,
    postal_code,
    country_id
FROM
    hr.locations
WHERE
    LENGTH (state_province) > 9;

INSERT INTO
    LOCATIONS2
SELECT
    *
FROM
    hr.locations l
WHERE
    LENGTH (l.state_province) > 9;

--7. Совершите commit.
--8. Перепишите и запустите данный statemenet для создания таблицы locations4europe, которая будет содержать такие же столбцы, что и locations: CREATE TABLE locations4europe AS (SELECT * FROM locations WHERE 1=2);
--9. Одним statement-ом добавьте в таблицу locations2 всю информацию для всех строк из таблицы locations, а в таблицу locations4europe добавьте информацию о id локации, адресе, городе, id страны только для тех строк из таблицы locations, где города находятся в Европе.
insert all when COUNTRY_ID in (
    select
        c.country_id
    from
        hr.countries c
        join hr.regions r using (region_id)
    where
        r.region_name = 'Europe'
) then into locations4europe (
    LOCATION_ID,
    STREET_ADDRESS,
    POSTAL_CODE,
    CITY,
    STATE_PROVINCE,
    COUNTRY_ID
) when 5 = 5 then into locations2 (
    LOCATION_ID,
    STREET_ADDRESS,
    POSTAL_CODE,
    CITY,
    STATE_PROVINCE,
    COUNTRY_ID
) (
    select
        *
    from
        hr.locations
);

--10.Совершите commit.
--11.В таблице locations2 измените почтовый код на любое значение в тех строках, где сейчас нет информации о почтовом коде.
update locations2
set
    postal_code = upper('djh31')
where
    postal_code is null;

--12.Совершите rollback.
--13.В таблице locations2 измените почтовый код в тех строках, где сейчас нет информации о почтовом коде. Новое значение должно быть кодом из таблицы locations для строки с id 2600.
UPDATE LOCATIONS2
SET
    POSTAL_CODE = UPPER(
        (
            select
                postal_code
            from
                hr.locations
            where
                location_id = 2600
        )
    )
WHERE
    postal_code is null;

--14.Совершите commit.
--15.Удалите строки из таблицы locations2, где id страны «IT».
delete from locations2
where
    country_id = 'IT';

--16.Создайте первый savepoint.
--17.В таблице locations2 измените адрес в тех строках, где id локации больше 2500. Новое значение должно быть «Sezam st. 18»
update locations2
set
    STREET_ADDRESS = 'Sezam st. 18'
where
    location_id > 2500;