-- Вариант 6

-- 1. Написать команды создания таблиц заданной схемы с указанием необходимых ключей и ограничений. Все ограничения должны быть именованными (для первичных ключей имена должны начинаться с префикса "PK_", для вторичного ключа – "FK_", проверки - "CH_"). Ограничения:
-- Размер бюджета не может быть отрицательным.
-- Заседание не могут проходить с полуночи до 6 утра.
-- Значение null допустимо только в полях телефон_дом и адрес.

-- члены городского совета
create table members
(
	member_id number(10), --id_члена городского совета
	full_name varchar2(100), --фио
	address varchar2(100), --адрес
	phone_work varchar2(100), --номер телефона рабочий
	phone_home varchar2(100), --номер телефона домашний
	constraint pk_members primary key (member_id),
	constraint ch_members check (full_name is not null and phone_work is not null)
);

-- комиссии
create table commissions
(
	commission_id number(10), --id_комиссии
	manager_id number(10), --id_председателя
	title varchar2(100), --название
	budget number(10), --бюджет
	constraint pk_commissions primary key (commission_id),
	constraint fk_commissions_members foreign key (manager_id) references members (member_id),
	constraint ch_commissions check (manager_id is not null and title is not null and budget >= 0)
);

-- члены комиссии
create table colleges
(
	member_id number(10), --id_члена городского совета
	commission_id number(10), --id_комиссии
	constraint pk_colleges primary key (member_id, commission_id),
	constraint fk_colleges_members foreign key (member_id) references members (member_id),
	constraint fk_colleges_commissions foreign key (commission_id) references commissions (commission_id)
);

-- заседания
create table meetings
(
	meeting_id number(10), --id_заседания
	commission_id number(10), --id_комиссии
	manager_id number(10), --id_ответственного
	meeting_date date, --дата и время проведения
	address varchar2(100), --место проведения
	constraint pk_meetings primary key (meeting_id),
	constraint fk_meetings_commissions foreign key (commission_id) references commissions (commission_id),
	constraint fk_meetings_memebers foreign key (manager_id) references members (member_id),
	constraint ch_meetings check (commission_id is not null and manager_id is not null and address is not null and to_char(meeting_date,'hh24') >= 6)
);

-- 2. Заполнить созданные таблицы данными, 5-10 записей для каждой таблицы.

insert into members(member_id, full_name, address, phone_work, phone_home) values(1, 'Джамилев Алексей Петрович', 'г.Томск, Ленина, д.15, кв.85', '8800553535', '');
insert into members(member_id, full_name, address, phone_work, phone_home) values(2, 'Изуева Алия Васильевна', 'г.Томск, Киевская, д.11, кв.11', '8800553536', '895823');
insert into members(member_id, full_name, address, phone_work, phone_home) values(3, 'Дамиров Михаил Евреевич', 'г.Северск, Ленина, д.45, кв.95', '8800553537', '742325');
insert into members(member_id, full_name, address, phone_work, phone_home) values(4, 'Козеева Валерия Юрьевна', 'г.Томск, Джихада, д.25, кв.25', '8800553538', '');
insert into members(member_id, full_name, address, phone_work, phone_home) values(5, 'Иванов Григорий Иванович', 'г.Северск, Эпштейна, д.32, кв.10', '8800553539', '');
insert into members(member_id, full_name, address, phone_work, phone_home) values(6, 'Семёнова Арифия Копеевна', 'г.Томск, Гоголя, д.24, кв.35', '8800553540', '9543668');
insert into members(member_id, full_name, address, phone_work, phone_home) values(7, 'Джамахирия Мария Арафатовна', 'г.Томск, Ленина, д.282, кв.1', '8800553541', '346456');
insert into members(member_id, full_name, address, phone_work, phone_home) values(8, 'Алекафтия Артемия Афродитовна', 'г.Томск, Поджигателя Мёртвых Душ, д.2, кв.2', '8800553542', '');
insert into members(member_id, full_name, address, phone_work, phone_home) values(9, 'Поликарпова Сом Карасевна', 'г.Северск, Нагорная, д.288, кв.1', '8800553544', '962529');
insert into members(member_id, full_name, address, phone_work, phone_home) values(10, 'Шляпов Нахим Сергеевич', 'г.Томск, Киевская, д.1, кв.71', '8800553550', '363636');
insert into members(member_id, full_name, address, phone_work, phone_home) values(11, 'Иванов Иван Иванович', 'г. Томск, Ленина, д.32', '8800553551', '121212');

insert into commissions(commission_id, manager_id, title, budget) values(1, 4, 'Бог и Народ', 10000000);
insert into commissions(commission_id, manager_id, title, budget) values(2, 5, 'Настольная книга традиционаласта', 15000000);
insert into commissions(commission_id, manager_id, title, budget) values(3, 1, 'Самурай Запада', 10000);
insert into commissions(commission_id, manager_id, title, budget) values(4, 9, 'Археофутуризм', 1777000000);
insert into commissions(commission_id, manager_id, title, budget) values(5, 4, 'Моим Легионерам', 6888888);

insert into colleges(member_id, commission_id) values(7, 2);
insert into colleges(member_id, commission_id) values(6, 3);
insert into colleges(member_id, commission_id) values(8, 2);
insert into colleges(member_id, commission_id) values(2, 5);
insert into colleges(member_id, commission_id) values(4, 1);
insert into colleges(member_id, commission_id) values(10, 4);
insert into colleges(member_id, commission_id) values(1, 2);
insert into colleges(member_id, commission_id) values(3, 3);
insert into colleges(member_id, commission_id) values(6, 1);
insert into colleges(member_id, commission_id) values(6, 4);

insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(1, 2, 9, to_date('2002-06-09 17:00:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Томск, Ленина, д.17, каб.13');
insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(2, 4, 1, to_date('2006-03-03 11:30:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Томск, Гоголя, д.1, ауд.282');
insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(3, 1, 9, to_date('2005-02-23 18:30:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Северск, Юнгера, д.43, каб.1613');
insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(4, 4, 3, to_date('2006-03-03 11:30:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Томск, Гоголя, д.1, ауд.292');
insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(5, 1, 2, to_date('2007-07-11 15:15:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Северск, Гоголя, д.42, каб.1337');
insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(6, 5, 1, to_date('2001-08-20 20:00:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Северск, Юнгера, д.43, каб.1613');
insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(7, 2, 6, to_date('2003-11-12 11:00:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Томск, Гоголя, д.2, ауд.282');
insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(8, 3, 4, to_date('2004-01-14 15:30:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Томск, Ленина, д.24, каб.13');
insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(9, 5, 4, to_date('2006-03-25 10:00:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Томск, Ленина, д.24, каб.13');
insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(10, 1, 9, to_date('2008-04-19 08:00:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Томск, Ленина, д.24, каб.13');
insert into meetings(meeting_id, commission_id, manager_id, meeting_date, address) values(11, 4, 9, to_date('2006-03-19 08:00:00', 'YYYY-MM-DD hh24:mi:ss'), 'г. Томск, Ленина, д.24, каб.13');

-- 3. Написать запросы. Устранить дублирование только для тех случаев, где это потенциально возможно.

-- 3.1. Вывести сведения о членах городского совета, не указавших домашний номер телефона и проживающих вне Томска. Результат упорядочить по ФИО.

select *
from members
where phone_home is null and lower(address) not like '%томск%';

-- 3.2. Вывести председателей комиссий, бюджет которых больше 500 000. В выборке должны присутствовать только следующие поля: ФИО председателя, название комиссии, бюджет. Результат упорядочить по ФИО.

select full_name, title, budget
from commissions
	inner join members on member_id = manager_id
where budget > 500000;

-- 3.3. Для каждого члена городского совета найти число комиссий, в которых он работает, число комиссии, в которых он является ответственным, среднее число заседаний в месяц.

with t1 as
	(
		select members.member_id, colleges.commission_id as cid, commissions.commission_id as cid_m, meeting_id, meeting_date
		from members
			left join colleges on colleges.member_id = members.member_id
			left join commissions on commissions.manager_id = members.member_id
			left join meetings on meetings.commission_id = colleges.commission_id
	)
	, t2 as
	(
		select distinct member_id, avg(count(distinct meeting_id)) over (partition by member_id) as meetings_avg
		from t1
		group by member_id, to_char(meeting_date, 'YYYY-MM')
	)
select t1.member_id, count(distinct cid) as commissions, count(distinct cid_m) as manager, meetings_avg
from t1
	inner join t2 on t2.member_id = t1.member_id
group by t1.member_id, meetings_avg;

-- 3.4. Сформировать статистику заседаний комиссий по месяцам. Исключить комиссии с бюджетом менее 50 000 и числом членов менее трёх. В выборке должны присутствовать следующие поля: месяц (месяц и год), количество заседаний, бюджет, число членов.

select commissions.commission_id, to_char(meeting_date, 'YYYY-MM') as month, count(distinct meeting_id) as meetings, budget, count(distinct member_id) as members
from commissions
	inner join meetings on meetings.commission_id = commissions.commission_id
	inner join colleges on colleges.commission_id = commissions.commission_id
where budget >= 50000
group by commissions.commission_id, to_char(meeting_date, 'YYYY-MM'), budget;

-- 3.5. Выбрать месяца, в которые заседания проходят чаще среднего.

with t as
(
	select extract(month from meeting_date) as month, count(*) as freq, avg(count(*)) over () as avg_freq
	from meetings
	group by extract(month from meeting_date)
)
select *
from t
where freq > avg_freq;

-- 3.6. Вывести ФИО членов горсовета, которые не участвуют ни в одной комиссии, в роли простого сотрудника.

select distinct full_name
from members
	left join commissions on manager_id = members.member_id
	left join colleges on colleges.member_id = members.member_id
where commissions.commission_id is not null or colleges.commission_id is null;

-- 4. Написать запросы на изменение данных.

-- 4.1. Увеличить бюджет на 10% тех комиссий, которые чаще всего проводили заседания.

update commissions
set budget = budget * 1.1
where exists (
	with t as
	(
		select commission_id, rank() over(order by count(*)) as row_num
		from meetings
		group by commission_id
	)
	select 1
	from t
	where t.commission_id = commissions.commission_id and row_num = 1
);

-- 4.2. Удалить информацию о всех членах городского совета, которые не участвуют ни в одной комиссии ни в каком качестве.

delete from members
where exists
(
	select 1
	from members m
		left join commissions on manager_id = m.member_id
		left join colleges on colleges.member_id = m.member_id
	where members.member_id = m.member_id and commissions.commission_id is null and colleges.commission_id is null
);

-- 5. Создать представления.

-- 5.1. Оформить запросы 3.5 - 3.6 в виде представления.

create view v_meetings as
with t as
(
	select extract(month from meeting_date) as month, count(*) as freq, avg(count(*)) over () as avg_freq
	from meetings
	group by extract(month from meeting_date)
)
select *
from t
where freq > avg_freq;

create view v_members as
select distinct full_name
from members
	left join commissions on manager_id = members.member_id
	left join colleges on colleges.member_id = members.member_id
where commissions.commission_id is not null or colleges.commission_id is null;

-- 5.2. Создать представление со следующими полями: ID_комиссии, ФИО ответственного, число членов, число заседаний, бюджет.

create view v_commissions as
select commissions.commission_id, full_name, count(distinct colleges.member_id) as members, count(distinct meeting_id) as meetings, budget
from commissions
	inner join members on members.member_id = commissions.manager_id
	inner join meetings on meetings.commission_id = commissions.commission_id
	inner join colleges on colleges.commission_id = commissions.commission_id
group by commissions.commission_id, full_name, budget;

-- Откат.

drop table meetings;
drop table colleges;
drop table commissions;
drop table members;

drop view v_meetings;
drop view v_members;
drop view v_commissions;
