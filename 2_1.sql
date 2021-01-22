select Название,Автор,Цена  from Книги; --1


select distinct Автор from Книги order by Автор asc; --2

select Книги.Код_книги, Книги.Цена from Книги 
	join Поставки on Поставки.Код_книги = Книги.Код_книги
	join Поставщики on 	Поставки.Код_поставщика = Поставщики.код_поставщика
		where Поставщики.Город='Москва'; --3

select Имя from Заказчики where Имя like 'А%'; --4

select Название from Книги where Название like '%база данных%' or Название like '%базы данных%' or  Название like '%баз данных%'; --5

select sum(Книги.Цена) from Книги
	join Заказы on Книги.Код_книги = Заказы.код_книги
	where Заказы.Дата = to_date('31.01.2018','DD.MM.YYYY'); --6

Select Count(код_поставщика) from Поставщики 
	where (Адрес is not null) and (Телефон is not null); --7

Select Дата,Count(код_заказа) from Заказы 
	where Дата between to_date('01.02.2018','DD.MM.YYYY') and to_date('01.04.2018','DD.MM.YYYY')
	group by(Дата); --8

Select date_part('month',Заказы.Дата), AVG(t.sum) From Заказы, 
						(SELECT Заказы.код_заказа as zakaz,sum(Книги.Цена from Заказы, Книги) as sum where Заказы.код_книги = Книги.Код_книги group by (Заказы.код_заказа) as t
where Заказы.Дата between to_date('01','MM') and to_date('12','MM') group by date_part('month',Заказы.Дата) and t.zakaz = Заказы.код_заказа --9

Select Заказы.код_заказа,Заказы.Дата, Заказчики.Имя, t.сумма from Заказы,Заказчики,
							(select Заказы.код_заказа as код_заказа,sum(Книги.Цена::numeric) as сумма from Книги
							 join Заказы on Книги.Код_книги = Заказы.код_книги group by Заказы.код_заказа ) as t,
							(select avg(Книги.Цена::numeric) as среднее from Книги
							join Заказы on Книги.Код_книги = Заказы.код_книги) as y
	where Заказы.код_заказа = t.код_заказа and t.сумма > y.среднее and Заказчики.Код_заказчика = Заказы.код_заказчика ; --10


select  Поставки.Код_поставщика, count(Поставки.Код_книги), sum(Книги.Остаток) from Поставки
	join Книги on Поставки.Код_книги=Книги.Код_книги
	group by Поставки.Код_поставщика; --11

select Заказы.код_заказа from Заказы,Заказчики
where Заказчики.Адрес like ('%Брест%') and Заказы.Дата between to_date('01.01.2001','DD.MM.YYYY') and to_date('30.04.2001','DD.MM.YYYY')
UNION 
select count(код_заказа) from Заказы,Заказчики where Заказы.Оплачен='Да'and Заказчики.Адрес like ('%Брест%') and Заказы.Дата between to_date('01.01.2001','DD.MM.YYYY') and to_date('30.04.2001','DD.MM.YYYY')
UNION
select код_заказа  from Заказы,Заказчики where Заказы.Оплачен='Нет' and Заказчики.Адрес like ('%Брест%') and Заказы.Дата between to_date('01.01.2001','DD.MM.YYYY') and to_date('30.04.2001','DD.MM.YYYY');
--12  --Красивее бы сделать с помощю join, так как информация повторяется, либо сделать виртуальную таблицу

select Книги.Название from Книги
	where ((Книги.Цена::numeric)*1.12)> 10000; --13

select Заказчики.Имя,sum(Книги.Цена) from Заказчики
	join Заказы on Заказы.код_заказчика = Заказчики.Код_заказчика
	join Книги on Заказы.код_книги = Книги.Код_книги group by Заказчики.Имя; --14

select distinct Книги.Название from Книги
	where Книги.Код_книги not in (select код_книги from Заказы);
--15






