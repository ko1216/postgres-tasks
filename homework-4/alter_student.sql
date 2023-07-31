-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
--пишу строчными буквами запросы, так как пользуюсь DBeaver (через таб все капсовые команды меняет на строчные)

create table student
(
	student_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar
);

-- 2. Добавить в таблицу student колонку middle_name varchar
alter table student add column middle_name varchar;

-- 3. Удалить колонку middle_name
alter table student drop column middle_name;

-- 4. Переименовать колонку birthday в birth_date
alter table student rename birthday to birth_date;

-- 5. Изменить тип данных колонки phone на varchar(32)
alter table student alter column phone set data type varchar(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора
insert into student values
(1, 'name', 'last_name', '10.10.2000', '+79777777777'),
(2, 'name1', 'last_name1', '10.10.2001', '+79777777778'),
(3, 'name2', 'last_name2', '10.10.2002', '+79777777779');

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
truncate table student restart identity;