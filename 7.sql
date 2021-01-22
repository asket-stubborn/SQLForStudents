--7
CREATE OR REPLACE package JOHN.PAC 
as 
FUNCTION F_SPECIALIZATION_FOR_STUDENTS(id_student number)return number;
FUNCTION f_count_abs_for_spec(id_special number,min_bal number,max_ball number)return number;
procedure P_List(faculty_name varchar2);
procedure p_Copy (id_abutur_ch number);
end;
/


CREATE OR REPLACE package body JOHN.PAC
as
--7.1
FUNCTION F_SPECIALIZATION_FOR_STUDENTS(id_student number)
return number
as  
    id_number_exist number(10);
    return_count_number number(10);

begin
    select count(*) into id_number_exist from abiturients
    where abiturients.ID_ABITUR = id_student;
    
    IF (id_number_exist=0)
        THEN 
            raise_application_error(-20000, 'Введен некорректный ID_АБИТУРИЕНТА');
    END IF;

    select count(*) into return_count_number from SPECIALIUZATION S1,
        (SELECT e.ID_ABITURIENT as sum_ab, sum(e.ball) AS BALLS
            FROM exams e,SPEC_PRED sp,SPECIALIUZATION S
            WHERE e.ID_PREDMET = sp.ID_PRED and sp.ID_CODE_SPEC = S.ID_SPEC and e.ID_ABITURIENT=  id_student  
            GROUP BY e.ID_ABITURIENT) SUMER
            where SUMER.BALLS>S1.START_BALL;
     
    RETURN return_count_number;
    
end ;

--7.2
FUNCTION f_count_abs_for_spec(id_special number,min_bal number,max_ball number)
return number
as 
    id_number_exist number(10);
    return_count_number number(10);
begin

     select count(*) into id_number_exist from SPECIALIUZATION 
    where SPECIALIUZATION.ID_SPEC = id_special;
    
    IF (id_number_exist=0)
        THEN 
            raise_application_error(-20000, 'Введен некорректный ID_СПЕЦИАЛИЗАЦИИ');
    END IF;
            
            
    SELECT count(SUMER.FIO)
        into return_count_number
         FROM SPECIALIUZATION S1,
    (SELECT s.FACULTY AS FAC , a.fio AS FIO,sum(e.ball) AS BALLS
        FROM abiturients a, exams e,SPEC_PRED sp,SPECIALIUZATION S
  
        WHERE e.ID_PREDMET = sp.ID_PRED and a.ID_ABITUR=e.ID_ABITURIENT and sp.ID_CODE_SPEC = S.ID_SPEC and s.ID_SPEC = id_special
         GROUP BY a.fio,s.FACULTY) SUMER 
    WHERE S1.FACULTY = SUMER.FAC AND (min_bal is null or sumer.balls >= min_bal) and (max_ball is null or sumer.balls <= max_ball);
    
    return return_count_number ;
   END ;
   
 --7.3  
procedure P_List(faculty_name varchar2)
   AS
   fac_check number;
   kod_spec number;
   num number;
   cursor fio_in_kafedra is 
    select SUMER.FIO as fio_new,SUMER.BALLS as balls_new
         FROM SPECIALIUZATION S1,
    (SELECT s.FACULTY AS FAC , a.fio AS FIO,sum(e.ball) AS BALLS
        FROM abiturients a, exams e,SPEC_PRED sp,SPECIALIUZATION S
  
        WHERE e.ID_PREDMET = sp.ID_PRED and a.ID_ABITUR=e.ID_ABITURIENT and sp.ID_CODE_SPEC = S.ID_SPEC
         GROUP BY a.fio,s.FACULTY) SUMER 
        WHERE S1.FACULTY = SUMER.FAC AND SUMER.BALLS>S1.START_BALL and SUMER.FAC = faculty_name;
   
   it fio_in_kafedra%rowtype;
   
   begin
    select count(*) 
    into fac_check 
    from SPECIALIUZATION
    where SPECIALIUZATION.FACULTY = faculty_name;
    
    if fac_check = 0 then 
        raise_application_error(-20000, 'Введено некорректное название факультета');
    END IF;
        
    select SPECIALIUZATION.ID_SPEC into kod_spec from SPECIALIUZATION where SPECIALIUZATION.FACULTY = faculty_name;
    dbms_output.put_line( kod_spec || '   ' || faculty_name || '\n');
    
    open fio_in_kafedra;
    fetch fio_in_kafedra into it;
    num:=0;
    
    loop
    exit when fio_in_kafedra%notfound;
    num:=num+1;
    dbms_output.put_line(num || '. ' ||  it.fio_new || ' - ' || it.balls_new || ';' || '\n');
    fetch fio_in_kafedra into it;
    end loop;
    
    close fio_in_kafedra;   

   end ;
   
   
  --7.4 
procedure p_Copy (id_abutur_ch number)
   as 
   abitur_valid number;
   copy_abitur number;
   
   begin
    select count(*) into abitur_valid from abiturients
    where abiturients.ID_ABITUR = id_abutur_ch;
   
    if abitur_valid = 0 then 
        raise_application_error(-20000, 'Введен некорректный ID_АБИТУРИЕНТА');
    END IF;
    
    select max(abiturients.ID_ABITUR) + 1
    into copy_abitur FROM  abiturients;
   
    insert into abiturients(adress,birth_date,fio,id_abitur,medal_exist)
    select c.adress,c.birth_date,c.fio || ' копия', copy_abitur,medal_exist
    from abiturients c;
    
    insert into exams(ball,date_of_complete,id_abiturient,id_predmet,row_id)
    select ball, date_of_complete, copy_abitur,id_predmet,row_id+1
    from exams where exams.ID_ABITURIENT = id_abutur_ch;
     
   end ;
   
   end;
/
   
   
   commit;
   
   
 --7.1  
select abiturients.ID_ABITUR, PAC.F_SPECIALIZATION_FOR_STUDENTS(abiturients.ID_ABITUR,) from abiturients;
select abiturients.ID_ABITUR, PAC.F_SPECIALIZATION_FOR_STUDENTS(null) from abiturients;
select PAC.F_SPECIALIZATION_FOR_STUDENTS(null) from dual;



-- 7.2
select SPECIALIUZATION.ID_SPEC, PAC.f_count_abs_for_spec(SPECIALIUZATION.ID_SPEC,40,180 ) from SPECIALIUZATION;
select SPECIALIUZATION.ID_SPEC, PAC.f_count_abs_for_spec(SPECIALIUZATION.ID_SPEC,40,null) from SPECIALIUZATION;
select SPECIALIUZATION.ID_SPEC, PAC.f_count_abs_for_spec(SPECIALIUZATION.ID_SPEC, null, null) from SPECIALIUZATION;
select SPECIALIUZATION.ID_SPEC, PAC.f_count_abs_for_spec(SPECIALIUZATION.ID_SPEC) from SPECIALIUZATION;
select PAC.f_count_abs_for_spec(null) from dual;

-- 7.3
savepoint A;

begin
	PAC.P_List(6);
	PAC.P_List(null);
end;
/


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

rollback;