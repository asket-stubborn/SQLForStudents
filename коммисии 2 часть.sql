-- Вариант 6

-- 6. Создать два индекса для заданных таблиц по заданным полям. Одно задание – один индекс. Название индекса должно начитаться с префикса "index_":

-- 6.1. Таблица: Члены_городского_совета. Атрибуты: ФИО.

create index index_members on members (full_name);

-- 6.2. Таблица: Заседания. Атрибуты: ID_Комиссии, ID_Ответственного.

create index index_meetings on meetings (meeting_id, manager_id);

-- 7. Создать пакет, состоящий из описанных процедур, функций и констант (если требуется). Все процедуры и функции при необходимости должны включать обработчики исключений.
-- Названия функций: F_<имя>. Формат названий процедур: P_<имя>. Написать анонимные блоки или запросы для проверки работы процедур и функций.

create or replace package PAC
as
	function F_CommissionsCount(member_id_ number, date_from date := NULL, date_to date := NULL) return number;
	function F_MeetingsCount(commission_id_ number, date_from date := NULL, date_to date := NULL) return number;
	procedure P_List(member_id_ number, date_ date);
	procedure P_Copy(commission_id_ number);
end;
/
create or replace package body PAC
as

-- 7.1. Написать функцию, возвращающую количество комиссией, в которых участвует указанный член городского совета в течение определённого периода (id_члена городского совета и промежуток времени – аргументы функции).
-- Период указывается с точностью до месяца. Если промежуток времени не указан, считается количество за всё время.

function F_CommissionsCount(member_id_ number, date_from date, date_to date)
return number
as
	member_valid number(10);
	commissions_count number(10);
begin
	select count(*)
	into member_valid
	from members mr
	where mr.member_id = member_id_;

	if member_valid = 0 then
		raise_application_error(-20000, 'Введен некорректный ID_члена_ГС.');
	end if;

	select count(distinct mt.commission_id)
	into commissions_count
	from meetings mt
		inner join colleges cm on cm.commission_id = mt.commission_id
	where cm.member_id = member_id_
		and (date_from is null or mt.meeting_date >= trunc(date_from, 'mm'))
		and (date_to is null or mt.meeting_date <= trunc(date_to, 'mm'));

	return commissions_count;
end;

-- 7.2. Написать функцию, которая для заданной комиссии рассчитывает общее количество заседаний, проведенных за указанный период времени.
-- Функция имеет три аргумента: id_комиссии, начало периода, окончание периода. Только первый аргумент является обязательным. Предусмотреть вариант вызова функции без необязательных аргументов.

-- members mr		члены городского совета
-- colleges cm		члены комиссии
-- commissions c		комиссии
-- meetings mt		заседания

function F_MeetingsCount(commission_id_ number, date_from date, date_to date)
return number
as
	commission_valid number(10);
	meetings_count number(10);
begin
	select count(*)
	into commission_valid
	from commissions c
	where c.commission_id = commission_id_;

	if commission_valid = 0 then
		raise_application_error(-20000, 'Введен некорректный ID_комиссии.');
	end if;

	select count(*)
	into meetings_count
	from meetings mt
	where mt.commission_id = commission_id_
		and (date_from is null or mt.meeting_date >= date_from)
		and (date_to is null or mt.meeting_date <= date_to);

	return meetings_count;
end;

-- 7.3. Написать процедуру, которая формирует календарь заседаний для заданного члена городского совета. (id_члена городского совета и год – параметры процедуры).
-- Формат вывода:
-- ------------------------------------------------------
-- Календарь заседаний для <ФИО> на <год> год:
-- <месяц_1>:
-- 1. <Дата и время проведения>. <Название комиссии> – <роль: член комиссии / ответственный секретарь>;
-- 2. <Дата и время проведения>. <Название комиссии> – <роль: член комиссии / ответственный секретарь>;
-- <и т.д.>
-- <месяц_2 (без заседаний)>: заседаний не запланировано
-- <и т.д.>
-- ------------------------------------------------------

procedure P_List(member_id_ number, date_ date)
as
	num number(10);
	member_name varchar2(100);

	cursor meetings_cursor is
	select mt.meeting_date, c.title, case when mt.manager_id = member_id_ then 'ответственный секретарь' else 'член комиссии' end as role
	from meetings mt
		inner join colleges cm on cm.commission_id = mt.commission_id
		inner join commissions c on c.commission_id = mt.commission_id
	where cm.member_id = member_id_
		and trunc(mt.meeting_date, 'yyyy') = trunc(date_, 'yyyy')
	order by mt.meeting_date;

	it meetings_cursor%rowtype;
begin
	select max(full_name)
	into member_name
	from members mr
	where mr.member_id = member_id_;

	if member_name is null then
		dbms_output.put_line('Введен некорректный ID_члена_ГК.');
		return;
	end if;
	
	if date_ is null then
		dbms_output.put_line('Введите дату.');
		return;
	end if;

	dbms_output.put_line('Календарь заседаний для ' || member_name || ' на ' || to_char(date_, 'yyyy') ||' год:');

	open meetings_cursor;

	fetch meetings_cursor into it;

	for m in 1..12 loop
		num := 0;

		if extract(month from it.meeting_date) = m then
			dbms_output.put_line(trim(to_char(to_date(m, 'mm'), 'month', 'nls_date_language=russian')) || ':');
		else
			dbms_output.put_line(trim(to_char(to_date(m, 'mm'), 'month', 'nls_date_language=russian')) || ': заседаний не запланировано');
		end if;

		loop
			exit when meetings_cursor%notfound or extract(month from it.meeting_date) != m;

			num := num + 1;

			dbms_output.put_line(num || '. ' || to_char(it.meeting_date, 'yyyy-mm-dd hh24:mi') || '. ' || it.title || ' - ' || it.role || ';');

			fetch meetings_cursor into it;
		end loop;
	end loop;

	close meetings_cursor;
end;

-- 7.4. Написать процедуру, которая выполняете копирование всех данных о указанной комиссии, включая её состав. Аргумент процедуры - id_комиссии. Для скопированной записи ставится отметка "копия" в поле название.

procedure P_Copy(commission_id_ number)
as
	commission_valid number(10);
	copy_commission_id number(10);
begin
	select count(*)
	into commission_valid
	from commissions c
	where c.commission_id = commission_id_;

	if commission_valid = 0 then
		dbms_output.put_line('Введен некорректный ID_комиссии.');
		return;
	end if;

	select max(c.commission_id) + 1
	into copy_commission_id
	from commissions c;

	insert into commissions (commission_id, manager_id, title, budget)
	select copy_commission_id, c.manager_id, c.title || ' копия', c.budget
	from commissions c
	where c.commission_id = commission_id_;

	insert into colleges (member_id, commission_id)
	select cm.member_id, copy_commission_id
	from colleges cm
	where cm.commission_id = commission_id_;
end;

end;
/
-- 7.1
select member_id, PAC.F_CommissionsCount(member_id, to_date('2006-01', 'yyyy-mm'), to_date('2008-01', 'yyyy-mm')) from members;
select member_id, PAC.F_CommissionsCount(member_id) from members;
select PAC.F_CommissionsCount(null, to_date('2006-01', 'yyyy-mm'), to_date('2008-01', 'yyyy-mm')) from dual;

-- select * from meetings
-- 	inner join colleges on colleges.commission_id = meetings.commission_id
-- where member_id = 6;

-- 7.2
select commission_id, PAC.F_MeetingsCount(commission_id, to_date('2005', 'yyyy'), to_date('2006', 'yyyy')) from commissions;
select commission_id, PAC.F_MeetingsCount(commission_id, to_date('2005', 'yyyy')) from commissions;
select commission_id, PAC.F_MeetingsCount(commission_id, null, to_date('2006', 'yyyy')) from commissions;
select commission_id, PAC.F_MeetingsCount(commission_id) from commissions;
select PAC.F_MeetingsCount(null) from dual;

-- 7.3
savepoint A;

begin
	insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(12, 1, 1, to_date('2006-01-03 11:30:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Томск, Северная, д.1, ауд.228');
	insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(13, 1, 1, to_date('2006-01-03 11:30:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Томск, Северная, д.1, ауд.228');
	insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(14, 1, 1, to_date('2006-01-03 11:30:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Томск, Северная, д.1, ауд.228');
	insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(15, 1, 6, to_date('2006-12-03 11:30:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Томск, Северная, д.1, ауд.228');

	PAC.P_List(6, to_date('2006', 'yyyy'));
	PAC.P_List(null, to_date('2006', 'yyyy'));
	PAC.P_List(6, null);
end;
/
select * from meetings
	inner join colleges on colleges.commission_id = meetings.commission_id
where member_id = 6
order by meeting_date;

rollback;

-- select * from meetings
-- 	inner join colleges on colleges.commission_id = meetings.commission_id
-- order by member_id;

-- 7.4
savepoint A;

begin
	PAC.P_Copy(2);
	PAC.P_Copy(null);
end;
/
select * from commissions where commission_id in (2, 6);
select * from colleges where commission_id in (2, 6);

rollback;

-- 8. Создать триггеры, включить обработчики исключений. Написать скрипты для проверки. При необходимости снять ограничения (если ограничение мешает проверить работу триггера).

-- 8.1. Написать триггер, проверяющий, что дата в таблице "Заседания" не заполнена прошедшим числом (это не относится ко времени).
-- Если место не указано, то автоматически ставится место проведения последнего заседания.

create or replace view meetings_view as
select * from meetings;

create or replace trigger T_meetings_view
instead of
insert
on meetings_view
for each row
declare
	meetings_count number(10);
	new_address varchar2(100);
begin
	if trunc(:new.meeting_date, 'dd') < trunc(sysdate, 'dd') then
		raise_application_error(-20000, 'Дата должна быть заполнена не прошедшим числом.');
	end if;

	if :new.address is null then
		with t as
		(
			select mt.address
			from meetings mt
			where mt.meeting_date <= sysdate
			order by mt.meeting_date desc
		)
		select *
		into new_address
		from t
		where rownum = 1;
		
		if new_address is null then
			raise_application_error(-20000, 'Адрес не указан.');
		end if;
	else
		new_address := :new.address;
	end if;

	insert into meetings (meeting_id, commission_id, manager_id, meeting_date, address)
	values (:new.meeting_id, :new.commission_id, :new.manager_id, :new.meeting_date, new_address);
end;
/
savepoint A;

insert into meetings_view (meeting_id, commission_id, manager_id, meeting_date) values (12, 1, 9, trunc(sysdate, 'dd') + interval '6' hour);
insert into meetings_view (meeting_id, commission_id, manager_id, meeting_date, address) values (13, 1, 9, trunc(sysdate, 'dd') + interval '6' hour, 'г. Северск, Погодаева, д.8, каб.1180');
insert into meetings_view (meeting_id, commission_id, manager_id, meeting_date, address) values (14, 1, 9, to_date('2020-12-25 6:00', 'yyyy-mm-dd hh24:mi'), 'г. Северск, Погодаева, д.8, каб.1180');
-- insert into meetings_view (meeting_id, commission_id, manager_id, meeting_date, address) values (15, 1, 9, to_date('2020-12-29 6:00', 'yyyy-mm-dd hh24:mi'), 'г. Северск, Погодаева, д.8, каб.1180');

select * from meetings where meeting_id >= 11;

rollback;

drop trigger T_meetings_view;

-- select * from meetings;

-- with t as
-- (
-- 	select *
-- 	from meetings mt
-- 	order by mt.meeting_date desc
-- )
-- select *
-- from t
-- where rownum = 1;

-- 8.2. Написать триггер, сохраняющий статистику изменений таблицы "Заседания" в таблице "Заседания_Статистика", в которой хранится дата изменения, тип изменения (insert, update, delete).
-- Триггер также выводит на экран сообщение с указанием количества дней прошедших со дня последнего изменения.

create table meetings_statistics
(
	id number(10),
	change_date date,
	change_type varchar2(10),
	constraint pk_meetings_statistics primary key (id),
	constraint ch_meetings_statistics check (change_date is not null and change_type is not null)
);

create or replace trigger T_meetings
after
insert or update or delete
on meetings
for each row
declare
	last_id number(10);
	last_change_date date;
	change_type varchar2(10);
begin
	select max(ms.id), max(ms.change_date)
	into last_id, last_change_date
	from meetings_statistics ms;

	if inserting then
		change_type := 'insert';
	elsif deleting then
		change_type := 'delete';
	else
		change_type := 'update';
	end if;

	if last_change_date is not null then
		dbms_output.put_line('Дней с момента последнего изменения: ' || trunc(sysdate - last_change_date) || '.');
	end if;

	insert into meetings_statistics (id, change_date, change_type)
	values (nvl(last_id + 1, 1), sysdate, change_type);
end;
/
savepoint A;

insert into meetings_statistics (id, change_date, change_type) values (1, to_date('2020-12-20', 'yyyy-mm-dd'), 'insert');

insert into meetings (meeting_id, commission_id, manager_id, meeting_date, address) values (12, 1, 9, to_date('2020-12-23 06:00', 'yyyy-mm-dd hh24:mi'), 'г. Северск, Погодаева, д.8, каб.1180');
update meetings mt set mt.manager_id = 8 where mt.meeting_id = 12;
delete meetings mt where mt.meeting_id = 12;

begin
	null;
end;
/
select * from meetings_statistics;

rollback;

drop trigger T_meetings;

-- 8.3. Написать триггер, который при вставке в таблицу "Комиссия" проверяет наличие комиссии с таким же названием. Если такая комиссия уже есть, то обновляется значение полей бюджет и председатель.

create or replace view commissions_view as
select * from commissions;

create or replace trigger T_commissions
instead of
insert
on commissions_view
for each row
declare
	existing_commission_id number(10);
begin
	select min(c.commission_id)
	into existing_commission_id
	from commissions c
	where lower(c.title) = lower(:new.title);

	if existing_commission_id is null then
		insert into commissions (commission_id, manager_id, title, budget)
		values (:new.commission_id, :new.manager_id, :new.title, :new.budget);
	else
		update commissions c
		set c.budget = :new.budget
			, c.manager_id = :new.manager_id
		where c.commission_id = existing_commission_id;
	end if;
end;
/
savepoint A;

insert into commissions_view (commission_id, manager_id, title, budget) values (6, 1, 'Департамент мышей', 4200000);
insert into commissions_view (commission_id, manager_id, title, budget) values (7, 2, 'Департамент мышей', 3900005);

select * from commissions where commission_id in (6, 7);

rollback;

drop trigger T_commissions;

-- Откат.

drop view commissions_view;
drop view meetings_view;

drop table meetings_statistics;

drop package PAC;

drop index index_meetings;
drop index index_members;
