--8
--8.1
create or replace trigger T_abiturient_insert
instead of insert
on abiturients 
for each row
declare

begin
if :new.BIRTH_DATE < (to_date('1990-01-01','YYYY-MM-DD'))
    then raise_application_error(-20000, 'Дата должна быть заполнена не меньше 1990.01.01');
END IF;


if :new.MEDAL_EXIST not in ('0','1','2','нет','серебрянная','золотая')
    then raise_application_error(-20000, 'Неправильное значение медали');
END IF;


insert into abiturients (ID_ABITUR, FIO, ADRESS,   MEDAL_EXIST, BIRTH_DATE)
values(:new.ID_ABITUR,:new.FIO,:new.ADRESS,:new.MEDAL_EXIST,:new.BIRTH_DATE);

end;


--8.2
create table exams_statistics 
(
    id number,
    change_date date,
    change_type varchar(200) -- insert update delete
);


create or replace trigger T_exams
after
insert or update or delete
on exams
for each row
declare
	last_id number(10);
	last_change_date date;
	change_type varchar2(10);
begin
	select max(e.id), max(e.change_date)
	into last_id, last_change_date
	from exams_statistics e;

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

	insert into exams_statistics (id, change_date, change_type)
	values (nvl(last_id + 1, 1), sysdate, change_type);
end;
/


--8.3

-- UPSERT TRIGGER


CREATE OR REPLACE trigger T_Exams_change
instead of insert
on exams
for each row
declare existing_exams_done number;
begin

select min(e.row_id) 
into existing_exams_done 
from exams e
where e.ID_ABITURIENT = :new.ID_ABITURIENT and e.ID_PREDMET = :new.ID_PREDMET;

if existing_exams_done is null then
		insert into exams (ROW_ID,ID_ABITURIENT,ID_PREDMET,BALL,DATE_OF_COMPLETE)
		values (:new.ROW_ID, :new.ID_ABITURIENT, :new.ID_PREDMET, :new.BALL, :new.DATE_OF_COMPLETE);
	else
		update exams e
		set e.BALL = :new.BALL
			, e.DATE_OF_COMPLETE = :new.DATE_OF_COMPLETE
		where e.ROW_ID = existing_exams_done;
	end if;

end;