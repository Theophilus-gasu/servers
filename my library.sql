
create database library
use library

create table authors(
author_ID int primary key,
name varchar(34),
birthdate date
);
insert into authors values(23,'Afi','2003/09/02');
insert into authors values(29,'Ama','2006/07/02');
insert into authors values(21,'Apedo','2001/09/02');
insert into authors values(20,'Terry','2002/08/02');
insert into authors values(32,'Frank','2006/08/02');
insert into authors values(56,'Selasi','1890/08/02');
insert into authors values(12,'Daavi','2001/11/20');
insert into authors values(76,'Danny','2001/02/07');
insert into authors values(89,'Dada','2010/11/02');
insert into authors values(43,'Abraham','2007/06/02');
insert into authors values(87,'William','2009/08/22');
insert into authors values(14,'Vivian','2007/10/03');
insert into authors values(98,'Kwamina','2005/06/12');
insert into authors values(09,'Kojo','2003/08/02');
insert into authors values(31,'Afi','2003/08/02');
insert into authors values(109,'Dadywa','2011/11/02');
insert into authors values(103,'Abann','2002/05/02');
insert into authors values(107,'Willimeg','2019/8/12');
insert into authors values(104,'Viva','2001/11/13');
insert into authors values(908,'Nana','2001/03/2');
insert into authors values(209,'Kwame','2013/8/12');
insert into authors values(312,'Tito','2006/08/12');

select*from authors

create table books(
book_id int primary key,
title varchar(54),
author_id int,
publish_date date
);

alter table books
add foreign key (author_id) references authors(author_id);

insert into books values(21,'Heidi',31,'2001/01/12');
insert into books values(41,'Alice in wonderland',29,'2001/01/22');
insert into books values(53,'Oliver twist',12,'2001/01/17');
insert into books values(21,'Sleeping beaity',76,'2001/01/19');
insert into books values(19,'Cinderella',89,'2001/01/18');
insert into books values(17,'Beauty and the beast',43,'2001/01/23');
insert into books values(16,'Black beauty',87,'2001/01/27');
insert into books values(13,'Snow white',14,'2008/07/11');
insert into books values(22,'In scope',98,'2004/08/10');
insert into books values(2,'Alex dixx',09,'2002/01/12');

select*from books

create table members(
member_id int primary key,
name varchar(54),
membership_date date
);

insert into members values(2,'Daavi','2006/04/13');
insert into members values(87,'Danny','2003/01/07');
insert into members values(29,'Darryl','2021/06/09');
insert into members values(22,'Enoch','2005/06/30');
insert into members values(98,'Freda','2007/01/21');
insert into members values(13,'Frank','2004/07/14');
insert into members values(54,'Zenabu','2011/11/21');
insert into members values(12,'Theo','2012/01/24');
insert into members values(21,'Yasphine','2001/01/22');
insert into members values(07,'Yaaya','2002/03/21');


select*from members

select name,membership_date from members
inner join loans on members.member_id=loans.member_id

create table loans(
loan_id int primary key,
book_id int,
member_id int,
loan_date date,
return_date date
);

alter table loans
add foreign key (member_id) references members(member_id);

alter table loans
add foreign key (book_id) references books(book_id);

insert into loans values(2,21,2,'2011/03/09','2001/02/09')
insert into loans values(3,41,87,'2018/05/28','2021/02/28')
insert into loans values(89,53,29,'2013/06/15','2011/01/11')
insert into loans values(7,19,22,'2012/07/13','2031/02/08')
insert into loans values(1,17,98,'2021/09/12','2015/06/07')
insert into loans values(6,16,13,'2011/01/11','2013/05/09')

select*from loans

select*from information_schema.TABLES where TABLE_TYPE='base table'

-----5th march 2025---
select name from authors;

select birthdate from authors where birthdate>'1980/01/01'

select COUNT(*) from authors

select name from authors
order by name asc

select birthdate,author_id from authors
order by birthdate,author_id asc

select title from books

select title from books where publish_date='2022'

select author_id, COUNT(*) from books
group by author_id

select title from books where title like '%sql%'

select title from books where author_id=author_id

select name from members
order by name asc

select name from members where membership_date> '2021/01/01';

select count(*) from members

select name from members
order by name asc

select membership_date from members where member_id=1

select*from loans

select*from loans where book_id=1

select COUNT(*) from loans

select*from loans where return_date> loan_date

select*from loans where member_id=member_id

select count(*),book_id   as numberoftimes from loans  
group by book_id

select distinct publish_date from books;

----7th march----
select name from authors

select title from books where author_id in(select author_id from authors where author_id='29')

select name,birthdate from authors

select count(*) from books

select name from members

select title as title from books

select name from members where membership_date>'2003/01/07'

select loan_id from loans where book_id in (select book_id from books where book_id=53)

select author_id,COUNT(*) from books
group by author_id

select*from loans

select distinct author_id from books where publish_date<='2008/07/11'

select  membership_date from members where member_id=2;

select COUNT(distinct book_id) from loans

select name from members where member_id not in(2,87,29,22,98,13)

select title from books where  book_id not iN(21,41,53)

select book_id,loan_date from loans

select title from books

select COUNT(*) from authors where birthdate='2003/09/02';

select distinct*from books

select COUNT(*) from loans where return_date is not null

select member_id ,count(*) from loans group by member_id

select min(loan_date),max(loan_date) from loans

----10th march----
select*from loans

update authors
set name='George' where author_ID=23

update loans
set return_date='2023/05/03' where loan_id=3

update members
set membership_date='2024/03/24'  where name like 'f%'

update loans
set return_date=DATEADD(DAY,7,'2013/05/09');

update books
set title='David Copperfield' where book_id=21;

delete from loans where return_date<loan_date

delete from members where member_id not in (select distinct member_id from loans)

delete from authors where author_ID not in (select distinct author_ID from authors)

delete from books  where title like '%old%'

delete from loans where loan_date<'2013/05/09'

select min(birthdate) as minimum  from authors
select COUNT(*) from books

select author_ID from authors
UNION
select author_id from books

select COUNT(author_id),name from authors
group by name
having COUNT(author_id)<13

select name from members
union
select name from authors

select COUNT(member_id),membership_date from members
group by membership_date

select name,author_id,COUNT(author_id) from authors where author_ID in	(select author_ID from books 
group by author_id
having COUNT(book_id)>21)
group by author_id,name

select title,book_id from books b where not exists (select 1 from  loans l where l.book_id=b.book_id)

select name,member_id,membership_date from members where membership_date> any(select membership_date from members where membership_date='2001/02/09')

select name,birthdate,book_id from authors,books
where birthdate>'2002/02/08'
group by name,birthdate,book_id
having COUNT(*)>2

select author_id,name,
case
		   when name='vivian'   Then 'she is mine'
		   when name='Ama'   Then 'she is mad'
		   when name='Frank'   Then 'she is sick'

else 'False'
		   end as Theo
		   from authors;
            
			select title from books where lower(title) like '%guide%'

select COUNT(*),member_id from members m where member_id in( select member_id from loans l where l.member_id=m.member_id)
group by member_id

select author_id from authors where not exists(select 1 from books where author_id=author_id)

select name from members where
DATEADD(DAY, 5, '2003/01/07')

---11th march----
select COUNT(*) from authors

select name from authors

select birthdate from authors where birthdate>'1980/01/01';

select birthdate from authors where author_ID=5

select COUNT(*) from authors where birthdate>'1990/01/01' and birthdate<'2000/01/01'

select COUNT(*) from books

select title from books

select COUNT(*) from books where author_id=21

select title from books where title like '%adventure%'

select author_id from books where book_id=21

select COUNT(*) from members

select name from members

select name from members where membership_date>'2021/06/01'

select membership_date from members where member_id=4

select COUNT(*) from members where membership_date between '2020/01/01' and '2021/01/01'

select COUNT(*) from loans

select loan_id from loans

select COUNT(*) from loans where member_id=2

select*from loans where return_date<'2022/07/01'

select book_id from loans where loan_id in ( select loan_id from loans where loan_id=2)

select COUNT(*) from authors where author_id not in (select author_ID from books where author_id=author_id)

select COUNT(*) from  authors where author_ID not in(select author_ID from books)

select title from books where book_id not in (select book_id from loans)

select COUNT(*) from members where member_id not in(select member_id from loans)

 select top 1 loan_id from loans
 order by return_date desc

 select COUNT(*) from authors where birthdate between '2001/01/01' and '2022/12/12'

select name,COUNT(*) from members where name like 'y%'
group by name
 
 select COUNT(*) from loans where return_date between '2023/03/01' and '2023/03/31'

 create procedure
 selectallloans
 as 
 select*from loans
 go;

 exec selectallloans

 select book_id,publish_date from books
 inner join authors on authors.author_ID=books.author_id

 ------13th march---

select title from books where author_id in(select name from authors)

select loan_id from loans where loan_id in (select loan_id from loans)

select title from books where author_id=09

select a.name,(select COUNT(*) from books where author_id=a.author_id) as counts from authors a

select name from members where member_id in (select member_id from loans)

select title from books where book_id not in (select book_id from loans)

select title,
           case
		   when book_id in(select book_id from loans) then 'loaned'
		   else 'available'
		   end as loan_status
		   from books

select birthdate,name from authors

select COUNT(*) from members where member_id not in (select member_id from loans)

select m.name,(select COUNT(*) from loans where member_id=member_id) from members m 

select title from books where book_id in( select book_id from loans where book_id=book_id)

select b.title,(select COUNT(*) from loans where book_id=book_id) from books b

select name from authors where (select COUNT(*) from books where author_id=author_id)>5

select l.loan_id,l.loan_date,member_id,( select name from members where member_id=l.member_id) as dd
from loans l

select distinct member_id,(select name from members where member_id=member_id) from loans where return_date<loan_date

----17 march--
 select title from books where book_id=21

 select title from books where publish_date>'2007/01/02'

 select title from books where title like '%sno%'

 select title from books where len(title)>10

 select title from books where title like 'A%'

 select title from books where book_id>100

 select title from books where publish_date>'2006/02/03'

 select COUNT(*) from members

 select a.name,(select title from books where book_id=book_id) as author from authors a

select title from books where author_id=98

select title from books where author_id=(select author_id from authors where name='kojo')

select COUNT(*) from loans where book_id=98

select member_id from members where member_id not in(select member_id from loans)

select title from books where book_id in( select book_id from loans)

select count(*) from books

select name from authors where author_ID in (select distinct author_ID from books)

select*from loans where member_id=61

select title from books where book_id not in (select book_id from loans)

select author_id,COUNT(*)
from books
group by author_id

select member_id from loans
group by member_id
having COUNT(*)>5

select title from books where author_id in( select author_id from authors where birthdate>'2009/02/01')

select count(*) from loans

select name from authors where author_ID not in (select author_ID from books)

select top 1*from loans

select loan_id from loans where loan_date=( select max(loan_date) from loans where member_id=member_id)

select*from loans  where loan_id=2    

select author_id,COUNT(*)
from books
group by author_id

select member_id from members where member_id in(select member_id from loans)
group by member_id
having COUNT(*)<5

select member_id from loans 
group by member_id
having count(*)<5

select title from books where author_id in (select author_id from authors where birthdate>'2004/01/01')

select COUNT(*) from loans

select author_id from authors where author_ID not in (select author_ID from books)

select member_id,COUNT(*)
from loans as numberoftimes
group by member_id

create procedure
dada
as 
select*from books

select name from members where YEAR(membership_date)=2005

select loan_id from loans where return_date='2003/09/08';

select author_id,COUNT(*)
from books
group by author_id

select title from books where publish_date=(select max(publish_date) from books)

select name from authors where birthdate<'2009/03/02'

select title from books where book_id in(select book_id from loans group by book_id
having COUNT(*)=2)

select name from members where member_id in(select member_id from loans where book_id=21)

select member_id from loans where book_id=(select book_id from books where title='Alice in wonderland')

exec dada

select title from books where LEN(title)=(select max(len(title)) from books)

 select title from books where len(title)>8;

 select title from books where title like '%heidi%' or  title like '%technology%'

 select title from books where book_id not in (2)

 select title from books where publish_date<'2004/02/03'

 select title from books where author_id in(select author_id from authors where len(name)>6)

 select name from authors where name like 'm%'

 select name from authors where author_ID in( select author_ID from books where publish_date>'2000/12/12')

 select name from authors where author_ID not in (21)

 select name from authors where len(name)>=5

 select name from authors where name like '%son'

 select name from authors
 order by name asc

 select name from authors where author_ID in(select author_ID from books where publish_date between '1998/01/01' and '2008/12/12')

 select distinct*from authors where authors.author_id in( select author_id from books where publish_date>=DATEADD(year,-10,GETDATE()))

 select name from authors where  len(name)-len(replace(name, 'a', ''))>=2 

 select name from authors where len(name)-len(REPLACE(name,'a',''))>=3

 select name from authors where name not like '%e%'

 select name from authors where len(name)>=5 and LEN (name)<=10

 select name from members where name like 'j%'

 select name from members where membership_date>'2004/02/01'

 select name from members where len(name)=6

 select name from members where name like '%y'

 select name from members where MONTH(membership_date)=6

 select name from members where member_id between 50 and 100

 select member_id from members where member_id in(select member_id from loans where loan_date>=DATEADD(DAY,-30,GETDATE()))

 select name from members where member_id >=10

 ---20 march--

 create procedure
 theo
 as
 select*from authors
 go

 exec Theo
 
 select book_id from loans where member_id in(53)

 select book_id from books where author_id in(9,12,14,20)

 select*from books where author_id in(select author_id from authors where name in('kojo','Daavi','Terry'))

 select member_id from members where member_id in (select member_id from loans)
 group by member_id
 having COUNT(*)>=1

 select title,
            case
			when book_id  in (select book_id from loans) Then 'loaned'
			else 'available'
			end as books
			from books

select name from authors where author_ID in (select author_ID from books where book_id in(select book_id from loans))

select*from books

select title from books where exists (select book_id from loans)
group by title
having COUNT(*)>=0

select*from books b where exists(select 1 from loans l where l.book_id=b.book_id)

select*from members m where exists(select 1  from loans l where m.member_id=l.member_id)

  select*from loans where member_id in(41)

  select title from books where exists(select

  select*from authors a where exists(select 1 from books b where a.author_ID=b.book_id and exists(select 1 from loans l where l.book_id=b.book_id))

 ----26th march--

select*from books where book_id in (select book_id from loans)

select member_id from members where member_id in (select member_id from loans)

select book_id from books where author_id=41

select*from books where book_id in (select book_id from loans where return_date is null)

select book_id from books where book_id not in (select book_id from loans)

select member_id from members where member_id not in (select member_id from loans)

select name from authors where author_ID not in (select author_ID from books)

select book_id from loans l where return_date<'2009/02/03'

select book_id from books b where exists (select 1 from loans l where b.book_id=l.book_id)

select member_id from members m where exists (select 1 from loans l where m.member_id=l.member_id)
group by member_id
having COUNT(*)>=1

select name from authors a where exists (select author_ID from books b where b.author_id=a.author_ID and exists(select book_id from loans))

select book_id from loans where return_date>loan_date

select name from members n where exists(select 1 from loans l where n. member_id=l.member_id and book_id=21)

----27 march---

select*from books b where not exists (select 1 from loans l where l.book_id=b.book_id)

select member_id from members m where not exists(select 1 from loans l where l.member_id=m.member_id)

select name from authors a where not exists(select 1 from books b where a.author_ID=b.author_id)

select book_id from books where not exists(select book_id from loans)

select*from books b where not exists(select 1 from loans l where b.book_id=l.book_id)

select member_id from members m where not exists(select 1 from loans l where l.member_id=m.member_id and l.return_date is  null)

select title from books where author_id=98

select book_id from books where book_id in (select book_id from loans where loan_date between '2001/01/02' and '2016/01/02')

select member_id from members where member_id in( select member_id from loans where loan_date >=dateadd(day, -7,GETDATE()));

select book_id from books where book_id in(select book_id from loans where book_id=book_id and return_date is null)

select title from books where year(publish_date)>2000

select member_id from members where member_id in(select member_id from loans where member_id=member_id and year(loan_date)<2024 and return_date is null)

select book_id from books where book_id in(select book_id from loans where return_date>=dateadd(day,-30,getdate()))

select book_id from books where author_id not in(select book_id from loans)

select*from authors where author_ID not in(select author_ID from books where book_id in (select book_id from loans))

select member_id from members where member_id in(select member_id from loans)
group by member_id
having COUNT(member_id)>5

select*from books where book_id in(select book_id from loans)
group by book_id,title,author_id,publish_date
having COUNT(book_id)>3

---28 march---
use library
select book_id from books b where exists (select book_id from loans l where l.book_id=b.book_id)
group by book_id
having COUNT(book_id)>=1

select member_id  from members m where member_id in (select member_id from loans l where l.member_id=m.member_id)

select title from books where author_id in(98)

select book_id from books where book_id in(select book_id from loans where loan_date>=dateadd(day,-3,getdate()))

select member_id from members where member_id in (select member_id from loans where return_date<getdate())

select book_id from books where book_id not in (select book_id from loans)

select name from members where member_id not in (select member_id from loans)

select author_id from authors where author_ID not in(select author_ID from books)

select title from books where book_id not in(select book_id from loans where loan_date>=dateadd(MONTH,-6,getdate()))

select name from members where member_id not in (select member_id from loans where year(loan_date)=year(getdate()))

select book_id from books b where exists(select 1 from loans l where b.book_id=l.book_id)

select member_id from members where member_id in(select member_id from loans)
group by member_id
having count(member_id)>=1

select author_id from authors where author_ID in (select author_ID from books)

select book_id from books b where exists (select 1  from loans l where l.book_id=b.book_id)

select name from members m where exists (select 1 from loans l where l.member_id=m.member_id and  month(loan_date)=MONTH(getdate()))

select title from books b where not exists(select 1 from loans l where l.book_id=b.book_id)

select name from members m where not exists (select 1 from loans l where m.member_id=l.member_id)

select author_id from authors a where not exists(select author_ID from books b where a.author_ID=b.author_id)

select title from books b where not exists(select 1 from loans l where l.book_id=b.book_id and return_date is null)

select name from members m where not exists(select 1 from loans l where l.member_id=m.member_id and l.return_date is null)

 select COUNT(*) as totalbooksborrowed,member_id from loans
 group by member_id
 
 select name from members where member_id in(select member_id from loans)
 group by name
 having COUNT(*)>=8

 select top 1*from loans

 select book_id from loans where loan_date=(select max(loan_date) from loans)

 select book_id from loans where return_date=(select max(return_date) from loans)

 select book_id from books b where  exists (select book_id from loans l where l.book_id=b.book_id)
 group by(book_id)
 having count(book_id)>3

 select book_id from books b where  book_id in (select book_id from loans group by book_id having count(*)>3)

 ---29 march---
  select title from books where author_id=98

  select title from books where  title like '%python%'

  select COUNT(*) from books where author_id=98

  select title from books where year(publish_date)<2000

  select title from books where publish_date=(select max(publish_date) from books)
  group by title
  having COUNT(title)=5

  select title from books where title like 'a%'

  select COUNT(*) from books where year(publish_date)>2015

  select YEAR(publish_date) from books where publish_date=(select max(publish_date) from books)

  (select max(publish_date) from books)

  select title from books where year(publish_date) between 2010 and 2020

  select *from authors

  select title from books where len(title)>20

  select distinct year(publish_date) from books

  select name from authors where name like '%smith%'

  select*from authors

  select name from authors where name like 'j%'

  select max(name) from authors

  select name,COUNT(*) from authors 
  group by  name
  having count(*)>1

  select COUNT(*) from authors where name like '%son'

  select name from authors
  order by name asc

  select min(len(name)) from authors

  select name from authors where len(name)=5

select name from members where name like '%john%'

select loan_date from loans where  loan_date=(select max(loan_date) from loans)

select*from loans where loan_date=dateadd(day,-30, getdate())

select*from loans where return_date is null


select loan_date from loans where  loan_date=(select min(loan_date) from loans)

select COUNT(*) from books where book_id in (select book_id from loans)

select*from loans where return_date<loan_date

select member_id from members where member_id in (select member_id from loans)
group by member_id
having COUNT(*)>3

select*from loans where loan_date>dateadd(day,-60,getdate())


select COUNT(*) from members

---april 3---

select distinct books.*into mames from books
inner join loans on books.book_id=loans.book_id

select*into recentloans from loans where loan_date=dateadd(day,-30,getdate())

select distinct members.*into mmm from members
inner join loans on members.member_id=loans.member_id

select title,name into books_with_authours from books b
inner join authors a on b.author_id=a.author_ID

select*from loans

select*into loan_history from loans

select book_id,title,author_id into authors_bing from books  where author_id=3

select*into overdueloans from loans where return_date is null

select name into frequent_redears from members
inner join loans on members.member_id=loans.member_id

update loans
set return_date=dateadd(day,7,getdate()) where loan_date>=dateadd(day,-7,getdate())

select book_id,
           case
		   when book_id not in(select book_id from loans) Then 'available'
		   else 'loaned'
		   end as status
		   from loans

update authors
set name='pius' where author_ID=4


select title,name from books b
inner join authors a on b.author_id=a.author_ID

select name,title from loans l
inner join members m on l.member_id=m.member_id
inner join books b on b.book_id=l.book_id
 
 select title from books b
 inner join loans l on l.book_id=b.book_id where member_id=3

 select count(*) as numberoftimes,title from books b
 inner join loans l on l.book_id=b.book_id
 group by title

 ---5 april---

 select title,name from authors a
 inner join books b on a.author_id=b.author_ID

 select name,title from members m
 inner join loans l on m.member_id=l.member_id
 inner join books b on l.book_id=b.author_id

 select l.loan_date,l.loan_id,l.return_date,l.book_id,m.name,b.title
 from loans l
  inner join members m on m.member_id=l.member_id
 inner join books b on l.book_id=b.author_id

 select name from books b
 inner join authors a on b.author_id=a.author_ID

 select l.loan_date,l.return_date,l.book_id,l.loan_id,name from loans l
 inner join members m on l.member_id=m.member_id

 select b.title,m.name
 from loans l
  inner join members m on l.member_id=m.member_id
   inner join books b on b.author_id=l.member_id

   select name,membership_date from members m
   inner join loans l on m.member_id=l.member_id

   select title,publish_date,birthdate from books b
   inner join authors a on b.author_id=a.author_ID

   select title,return_date,name from loans l
   inner join members m on l.member_id=m.member_id
   inner join books b on l.book_id=b.book_id

   select name from books b
   inner join authors a on b.author_ID=a.author_id where year(publish_date)>2020

   select l.return_date,l.loan_date,l.book_id,l.loan_id,title from loans l
   inner join books b on l.book_id=b.book_id where  return_date=dateadd(day,7,getdate())

   select name,title from loans l
inner join books b on l.book_id=b.book_id
inner join members m on l.member_id=m.member_id

select name,title from authors a
left join books b on a.author_ID=b.author_id

select title,name from loans l
left join members m on l.member_id=m.member_id
left join books b on l.book_id=b.book_id

select name,title from loans l
left join members m on l.member_id=m.member_id
left join books b on l.book_id=b.book_id

select l.loan_id,l.loan_date,l.return_date,l.book_id,l.member_id,title from loans l
left join books b on l.book_id=b.book_id

select title,name from authors a
left join books b on a.author_ID=b.author_id

select count(*) as numberofbooks,name from loans l
left join members m on l.member_id=m.member_id
group by name

select name,title from authors a
left join books b on a.author_ID=b.author_id

select title,loan_id from books b
left join loans l on b.book_id=l.book_id

select m.name,l.loan_id from loans l
left join members m on l.member_id=m.member_id

select b.title,a.name from books b
left join authors a on b.author_id=a.author_id

 select m.name,b.book_id from members m
 right join  loans l on m.member_id=l.member_id
 right join books b on l.book_id=b.book_id

 select name from authors where book_id=any(select book_id from books )

 select title from books where book_id!=any(select author_id from books)

 --6 april--

 select title,name from books b
 inner join authors a on b.author_id=a.author_ID

 select b.title,m.name,l.loan_id from loans l
 left join members m on l.member_id=m.member_id
 left join books b on l.book_id=b.book_id

select m.name,b.author_id from loans l
inner join members m on l.member_id=m.member_id
inner join books b on l.book_id=b.book_id

select l.loan_id,l.loan_date,l.return_date,l.book_id,l.member_id,a.name from loans l
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID where year(birthdate)>1970


select m.name,m.member_id from members m
join loans l  on m.member_id=l.member_id 
join books b on l.book_id=b.book_ID  
join authors a on b.author_ID=a.author_id where a.name='kojo'

select m.name,m.member_id,count(*) as numberofbooks from members m
join loans l on m.member_id=l.member_id
group by m.name,m.member_id
having count(*)>1

select a.name,count(*) as numberofbooks from authors a
inner join books b on a.author_ID=b.author_id
group by a.name

select title from books where book_id not in(select book_id from loans)

select title from books b where not exists(select 1 from loans l where l.book_id=b.book_id)

select m.name,m.member_id,count(*) as total from members m
inner join loans l on m.member_id=l.member_id
group by m.name,m.member_id

select m.name,b.title from loans l
 join books b on l.book_id=b.book_id
 join  members m on m.member_id=l.member_id where l.loan_date>=dateadd(day,-30,getdate())

 select m.member_id,b.title from loans l
 join members m on l.member_id=m.member_id
 join books b on l.book_id=b.book_id where title like '%science%'

 select COUNT(*) from books

select count(*) from loans where month(loan_date)=-1 

select AVG(datediff(day,loan_date,return_date)) as avgborrowedbooks
from loans where return_date is not  null

--7 April---
select name from members where membership_date=dateadd(month,-6,getdate()) and member_id not in (select member_id from loans)

select m.name,a.name from members m
join loans l on m.member_id=l.member_id
join books b on l.book_ID=b.book_id
join authors a on b.author_id=a.author_ID  where a.name='Daavi'

select name from members m
inner join loans l on m.member_id=l.member_id where loan_date>return_date

select name from members m
inner join loans l on m.member_id=l.member_id and l.loan_date=m.membership_date

select name,count(*) from members m
join loans l on l.member_id=m.member_id 
group by name
having count(*)>1

select m.name,a.name from members m
join loans l on m.member_id=l.member_id
join books b on l.book_id=l.book_id
join authors a on b.author_id=a.author_ID  where a.name='daavi'

select*from loans where return_date=dateadd(day,-14,getdate())

select l.loan_id,l.loan_date,l.return_date,l.loan_date,l.member_id,DATEDIFF(day,loan_date,return_date) as daystaken from loans l
where DATEDIFF(day,loan_date,return_date)>14


select l.loan_id,l.loan_date,l.return_date, datediff(day,loan_date,return_date) as nub from loans l
where datediff(day,loan_date,return_date)>14

select avg(datediff(day,loan_date,return_date)) from loans l

select book_id from loans l where book_id in (select max((datediff(day,loan_date,return_date))))

select book_id,max((datediff(day,loan_date,return_date))) from loans l
group by book_id

select*from loans where return_date is null

select l.loan_id,l.member_id,l.loan_date,l.return_date,l.book_id,count(*),m.name from loans l
inner join members m on l.member_id=m.member_id
group by l.loan_id,l.member_id,l.loan_date,l.return_date,l.book_id,m.name

select l.loan_id,l.return_date,l.loan_date title from books b
inner join loans l on b.book_id=l.book_id and title like '%data%'


-----8 April---
select count(*) as dansaki,a.name,a.author_ID  from books b
join loans l on b.book_id=l.book_id
join authors a on b.book_id=l.book_id
group by a.name,a.author_ID

select title from books where book_id not in( select book_id from loans)

select title,m.name from loans l
join books b on l.book_id=b.book_id
join members m on l.member_id=m.member_id

select b.book_id,b.title from books b
join loans l  on b.author_id=l.book_id
group by b.book_id,b.title
having count(distinct l.member_id)=(select count(*) from members)

select*from loans where book_id=4

select a.name,b.title,count(*) from authors a
join books b on a.author_ID=b.author_id

----9 april---

select b.title,m.name from loans l
join books b on l.book_id=b.book_id
join members m on l.member_id=m.member_id where m.name='Daavi'

select b.title from books b
 where book_id not in(select book_id from loans l)

 select count(*) as total,m.name from members m
 inner join loans l on m.member_id=l.member_id
 group by m.name

 select b.title from books b
 inner join loans l on b.book_id=l.book_id
 group by title
 having COUNT(title)>3

 select m.name from members m
 inner join loans l on m.member_id=l.member_id and return_date>=dateadd(day,14,getdate())

 
 select m.name from members m
 inner join loans l on m.member_id=l.member_id where datediff(day,loan_date,return_date)>14

 select b.title from books b
 inner join loans l on b.book_id=l.book_id and MONTH(loan_date)=MONTH(return_date)

 select b.title,a.name,m.name from loans l
 join books b on l.book_id=b.book_id
 join members m on l.member_id=m.member_id
 join authors a on b.author_id=a.author_ID where a.name like 'a%'

 select b.title from loans l
  join  members m on l.member_id=m.member_id
  join books b on l.book_id=b.book_id
  group by b.title
  having COUNT(*)>2

  select a.name,b.title from loans l
  join members m on l.member_id=m.member_id
  join books b on l.book_id=b.book_id
  join authors a on b.author_id=a.author_ID
  group by a.name,b.title
  having count(*)>5

  select top 1 b.title from loans l
join books b on l.book_id=b.book_id
group by b.title
 
  select top 3 m.name from loans l
  inner join members m on l.member_id=l.member_id

  ----10 april---
   select a.name,count(*)as numberofbbooks from loans l
   join books b on l.book_id=b.book_id
   join authors a on b.author_id=a.author_ID
   group by a.name

   select avg(DATEDIFF(day,loan_date,return_date)) from loans 

   select m.name from members m
   join  loans l on l.member_id=m.member_id where loan_date<return_date

   select b.title, avg(datediff(day,loan_date,return_date)) from loans l
   inner join books b on l.book_id=b.book_id
   group by b.title

   select a.name from books b
   join loans l on b.book_id=l.book_id
   join authors a on a.author_ID=b.author_id where not exists(select book_id from loans)
   group by a.name having count(*)>=2

   
   select a.name,a.author_id from authors a
   join books b on a.author_ID=b.author_id where b.book_id not in(select book_id from loans)
   group by a.name,a.author_ID
   having count(*)>=2

   select m.name from members m
   join loans l on m.member_id=l.member_id where year(loan_date)=2018
   group by m.name
   having count(distinct month(l.loan_date))=12

   select*from loans

   select b.title from books b
   inner join loans l on l.book_id=b.book_id where datename(weekday,loan_date) in ('saturday','sunday')

   select b.title,a.name from members m
   join books b on l.book_id=b.book_id
   join authors a on b.author_id=a.author_ID
   join members m on l.member_id=m.member_id  where (year)membership_date<2022

   ---11 april--
   select m.name,a.name from members m
   join loans l on l.member_id=m.member_id
   join books b on l.book_id=b.book_id
   join authors a on b.author_id=a.author_ID

select m.name,b.title,a.name from loans l
join members m on l.member_id=m.member_id
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID where a.author_id in(12)

select a.name,b.title from authors a
join books b on a.author_ID=b.author_id
left join loans l on b.book_id=l.book_id where l.book_id is null

select COUNT(*),m.name from members m
join loans l on m.member_id=l.member_id
group by m.name
having COUNT(*)>1 and COUNT(*)=count(distinct l.book_id)

select top 3 b.title from loans l
join books b on l.book_id=b.book_id

select top 3 m.name, sum(datediff(day,loan_date,return_date)) from loans l
join members m on l.member_id=m.member_id
group by m.name

select m.name,birthdate,b.title from loans l
join members m on l.member_id=m.member_id
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID where YEAR(a.birthdate)<1970

select b.title,m.name from loans l
join members m on l.member_id=m.member_id
join books b on l.book_id=b.book_id
group by m.name,b.title
having COUNT(*)>1 and COUNT(distinct l.member_id)=1

select a.name,b.title from loans l
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID where l.return_date=DATEADD(day,987,getdate())

select m.name,b.title from loans l
join members m on l.member_id=m.member_id
join books b on l.book_id=b.book_id 

----april 12--
select a.name,count(*) as numberofbooks from authors a
join books b on a.author_ID=b.author_id
group by a.name,birthdate
having COUNT(*)>5

select b.title,a.name from authors a
inner join books b on a.author_ID=b.author_id where publish_date>'2010/01/01'

select m.name,b.title from loans l
join members m on l.member_id=m.member_id
join books b on l.book_id=b.book_id

select l.loan_date,l.return_date,l.loan_id,l.book_id,l.member_id,b.title from loans l
inner join books b on l.book_id=b.book_id where member_id=2

select top 5*from loans

select count(*) as total,a.name from authors a
group by a.name

select a.name,b.title from authors a
inner join books b on a.author_ID=b.author_id where a.name='afi'

select m.name from  loans l
right join members m on l.member_id=m.member_id where m.member_id not in(select member_id from loans)

select*from members

select b.title,m.name from loans l
join members m on l.member_id=m.member_id
join books b on l.book_id=b.book_id where l.return_date between dateadd(day,7,GETDATE()) and getdate()

select a.name,count(*) as total, count(l.loan_id) as totalloans  from loans l
join  books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID
group by a.name,title

select m.name,datediff(day,l.return_date,GETDATE()) from loans l
inner join members m on l.member_id=m.member_id where l.return_date<GETDATE();

select a.name,count(*) as total from books b
inner join authors a on a.author_ID=b.author_id
inner join loans l on b.book_id=l.book_id
group by a.name
having count(*)>10

select b.title,a.name from loans l
right join books b on l.book_id=b.book_id
right join authors a on b.author_id=a.author_ID where b.book_id not in (select book_id from loans l)

select avg(datediff(day,loan_date,return_date)) from loans l

----13 april---
select b.title,a.name from books b
inner join authors a on b.author_id=a.author_ID

select b.title,m.name from loans l
inner join members m on l.member_id=m.member_id
inner join books b on l.book_id=b.book_id

select m.name from loans l
inner join members m on l.member_id=m.member_id
inner join books b on l.book_id=b.book_id
inner join  authors a on b.author_id=a.author_ID where a.name='daavi'

select l.loan_id,l.loan_date,l.return_date,l.book_id,b.title,m.name from loans l
inner join books b on l.book_id=b.book_id
inner join members m on l.member_id=m.member_id


select b.title,m.name from loans l
right join books b on l.book_id=b.book_id
left join members m on l.member_id=m.member_id

select m.name from loans l
join members m on l.member_id=m.member_id
group by m.name
having count(distinct l.book_id)>3

select a.name from authors a
 inner join books b on a.author_ID=b.author_id
 inner join loans l on b.book_id=l.book_id where not exists(select 1 from loans l where b.book_id=l.book_id)

 select a.name from authors a where not exists(select author_ID from books b where book_id not in (select book_id from loans l))

 select m.name from loans l
 join members m on l.member_id=m.member_id
 join books b on l.book_id=b.book_id
 join authors a on b.author_id=a.author_ID 
 group by m.name
 having count(distinct a.author_ID)>1

 select l.loan_id,b.title,m.name,l.return_date from loans l
 join members m on l.member_id=m.member_id
 join books b on l.book_id=b.book_id

 ---14 april---

 select b.title from books b
 inner join loans l on b.book_id=l.book_id where l.loan_date=DATEADD(day,-7,getdate())

 select  b.title from books b
 inner join loans l on b.book_id=l.book_id where DATEDIFF(day,loan_date,return_date)>14

 select  b.title from books b
 inner join loans l on b.book_id=l.book_id where return_date is null and loan_date=dateadd(day,14,getdate())

 select m.name from members m
 inner join loans l on m.member_id=l.member_id where month(l.loan_date)=5

 select*from loans l where year(loan_date)=2013

 select DATEDIFF(day,loan_date,return_date) from loans l

 select avg(datediff(day,loan_date,return_date)) from loans l

 select m.name from members m
 inner join loans l on m.member_id=l.member_id where loan_date=DATEADD(day,-30,getdate()) and return_date is null

 select*from loans where loan_date>return_date

 select b.title from books b
 inner join loans l on b.book_id=l.book_id where month(l.return_date) in (1,2,3)

 select count(*)  as numberofbooks from books b
 inner join loans l on b.book_id=l.book_id where loan_date=DATEADD(MONTH,12,getdate())


 
 select count(*) as numberofbooks ,year(l.loan_date)  from loans l
 group by year(l.loan_date)
 order by MONTH(l.loan_date)

--april 15---
select count(*) as numberofbooks, m.member_id from loans l
inner join members m on l.member_id=m.member_id
group by m.member_id

select a.name from authors a
inner join books b on a.author_ID=b.author_id
inner join loans l on b.book_id=l.book_id where l.book_id=(select top 1 book_id from loans)

select m.name from members m
inner join loans l on m.member_id=l.member_id
group by m.name
having COUNT(*)<5

select top 5 *from loans l

select count(*) as total from books	b
inner join loans l on b.book_id=l.book_id where year(loan_date) between 2011 and 2024

select count(*) as total,m.name from loans l
inner join members m on l.member_id=m.member_id
inner join books b on l.book_id=b.book_id
group by m.name

select max(DATENAME(weekday,loan_date)) as theo,count(*) from loans l
group by loan_date
order by loan_date asc

select m.name from members m
inner join loans l on m.member_id=l.member_id where day(l.return_date)<=5

select top 1 *from loans l
inner join members m on l.member_id=m.member_id

select b.title from books b
inner join loans l on b.book_id=l.book_id where l.return_date<l.loan_date

use library

----April 16----

select a.name from authors a where YEAR(birthdate)<1980

select*from members

select title,publish_date from books b where year(publish_date)>2010

select m.name from members m where year(membership_date)=2006

select a.name, count(*) from authors a
inner join books b on a.author_ID=b.author_id
group by a.name

select min(publish_date),a.name from books b
 join authors a on b.author_id=a.author_ID
group by publish_date,a.name

select title from books  b where  b.publish_date=(select min(b.publish_date) from books b)
group by publish_date

select count(*) as numberoftimes,b.title from books b
inner join loans l on b.book_id=l.book_id
group by b.title

select COUNT(*),m.name from members m
inner join loans l on m.member_id=l.member_id
group by m.name

select AVG(datediff(day,loan_date,return_date)) from loans l where return_date is not null

select title,
              case when book_id in(select book_id from loans l) then 'loaned'
			  else 'no loans yet'
			  end as results
			  from books b

select b.title,coalesce(COUNT(l.loan_id),'not loaned') as theo from books b
left join loans l on b.book_id=l.book_id
group by b.book_id,b.title

------April 17---

select name from members  where member_id not in(select member_id from loans l)

select COUNT(*) from loans l where year(loan_date)=2024

select count(*), a.name,title from loans l
inner join books b on l.book_id=b.book_id
left join authors a on b.author_id=a.author_ID
group by a.name,title
having COUNT(*)>=1

select top 5 title,publish_date from books b

select max(month(loan_date)) as dansaki,count(*) from loans l
group by loan_date
order by loan_date

select*from loans l where DATEDIFF(day,loan_date,return_date)>30

select m.name from members m
inner join loans l on m.member_id=l.member_id where MONTH(loan_date)=03 and year(loan_date)=2024

select avg(year(publish_date)) from books b

select m.name,count(*) from members m
inner join loans l on m.member_id=l.member_id where return_date is null
group by m.name

select a.name from authors a
left join books b on a.author_ID=b.author_id where a.author_ID not in(select author_id from books b)

select m.name from members m
inner join loans l on l.member_id=m.member_id where DATEDIFF(day,loan_date,return_date)<return_date 

select*from  authors


---April 18--
select b.title,a.name from books b
left join authors a on b.author_id=a.author_id

select l.loan_id,l.loan_date,l.return_date,l.book_id,m.name,b.title from members m
 inner join loans l on m.member_id=l.member_id
 inner join books b on l.book_id=b.book_id

 select m.name from members m
 left join loans l on l.member_id=m.member_id
 inner join books b on l.book_id=b.book_id 
 inner join authors a on b.author_id=a.author_ID where a.name like 'd%'

 select b.title,l.return_date,l.book_id,l.loan_date,l.member_id,l.loan_date from books b
 left join loans l on b.book_id=l.book_id

 select b.title from books b
 inner join loans l on b.book_id=l.book_id
 group by b.title
 having COUNT(*)>1

 select m.name from members m
 join loans l on m.member_id=l.member_id
 join books b on l.book_id=b.book_id 
 group by m.name
 having COUNT(distinct b.author_id)>1

 select a.name,count(*) as numberofbooks from authors a
 inner join books b on a.author_ID=b.author_id
 group by a.name

 select m.name from members m
 left join loans l on m.member_id=l.member_id where not exists(select 1 from loans l where m.member_id=l.member_id)


 select distinct a.name,a.author_id from authors a where a.author_ID not in(select b.author_id from books b
 join loans l on b.book_id=l.book_id)

 select a.name,COUNT(*) as numberoftimes from loans l
 inner join books b on l.book_id=b.book_id
 inner join authors a on b.author_id=a.author_ID
 group by a.name

 select m.name,count(*) as numberoftimes from members m
 inner join loans l on m.member_id=l.member_id
 group by m.name

 select b.title from books b
 inner join loans l on b.book_id=l.book_id where l.return_date is null

 select b.title,b.book_id,m.name,l.loan_date from books b
 join loans l on b.book_id=l.book_id
 join members m on l.member_id=m.member_id where l.loan_date=(select max(l2.loan_date) from loans l2 where l2.book_id=b.book_id)

 select b.title,a.name from books b
 inner join authors a on b.author_id=a.author_ID where  a.name=b.title

 select l.loan_id,b.title,m.name as nenbersname,a.name as authorsname,l.return_date,l.loan_date,l.member_id from loans l
 left join books b on l.book_id=b.book_id
 left join members m on l.member_id=m.member_id
 inner join authors a on b.author_id=a.author_ID

 ---April 19--

 select m.name,b.title from loans l
 inner join members m on l.member_id=m.member_id
 inner join books b on l.book_id=b.book_id
 group by m.name,b.title
 having COUNT(distinct b.author_id)>3

 select distinct count(*) as number from members m
 inner join loans l on m.member_id=l.member_id
 
 select b.title from books b
 inner join loans l on b.book_id=l.book_id where l.return_date=l.loan_date

 select m.name,max(l.return_date) from members m
inner join loans l on m.member_id=l.member_id 
group by m.name

select b.title,m.name,max(l.return_date) from loans l
inner join members m on l.member_id=m.member_id
inner join books b on l.book_id=b.book_id
group by  b.title,m.name,l.return_date

select a.name from loans l
 join books b on l.book_id=b.book_id
 join authors a on b.book_id=a.author_ID where year(l.loan_date)>2002

 select top 5 b.title,a.name from authors a
 join books b on a.author_ID=b.author_id
 join loans l on b.book_id=l.book_id

 select m.name from members m
 inner join books b on a.author_id=b.author_id
 inner join loans l on b.book_id=l.book_id


 select a.name from authors a
 inner join books b on a.author_ID=b.author_id
 inner join loans l on b.book_id=l.book_id where year(l.loan_date)>2014

select m.name from loans l
inner join members m on l.member_id=m.member_id
inner join books b on l.book_id=b.book_id where b.author_id=12

select m.name,avg(datediff(day,l.loan_date,l.return_date)) from loans l
inner join members m on l.member_id=m.member_id
group by m.name


select m.name,b.title,l.return_date,
                   case when l.return_date in (select l.return_date from loans where year(l.loan_date)=2025) Then 'loaned'
				   else 'available'
				   end as returnstatus  
				   from loans l
				   inner join members m on l.member_id=m.member_id
				   inner join books b on l.book_id=b.book_id

select m.name from members m
inner join loans l on m.member_id=l.member_id where l.return_date<l.loan_date


select a.name from authors a where a.author_ID not in(select b.author_id from books b
join loans l on b.book_id=l.book_id)
				 
select m.name,count(*) as numberofbooks from loans l
inner join members m on l.member_id=m.member_id
group by m.name

select m.name,b.title from loans l
right join books b on l.book_id=b.book_id
inner join members m on l.member_id=m.member_id where m.name like 'd%'

select b.title,a.name,
                    case
					    when l.book_id in (select book_id from loans l) Then 'loaned'
						else 'available'
						end as status
						from books b
						left join loans l on b.book_id=l.book_id
						inner join authors a on b.author_id=a.author_ID

select m.name,count(l.loan_id) from members m
join loans l on m.member_id=l.member_id
group by m.name
having count(l.loan_id)>all(select count(l2.loan_id) from loans l2
group by l2.member_id
having count(l2.loan_id) is not null)

---April 20---

select b.book_id from books b
left join loans l on b.book_id=l.book_id where b.book_id<all(select book_id from loans l)


select b.book_id from books b where b.book_id<all(select l.book_id from loans l)

select m.name from members m
right join loans l on m.member_id=l.member_id
right join books b on l.book_id=b.book_id where b.author_id=12

select*from loans

select a.name from authors a
 join books b on a.author_ID=b.author_id 
 group by a.name
 having count(b.book_id)>all(select count(b2.book_id) from authors a2 join books b2 on a2.author_id=b2.author_id
 group by a2.author_ID)

 select b.title from books b
 inner join loans l on b.book_id=l.book_id
 inner join members m on l.member_id=m.member_id where m.name like '%darryl'

 select m.name from members m
 inner join loans l on m.member_id=l.member_id where l.return_date>any(select l.return_date from loans l)


 
 select l.loan_id,b.title,m.name as nenbersname,a.name as authorsname,l.return_date,l.loan_date,l.member_id from loans l
 left join books b on l.book_id=b.book_id
 left join members m on l.member_id=m.member_id
 inner join authors a on b.author_id=a.author_ID

 select b.title from loans l
 right join books b  on l.book_id=b.book_id where b.book_id not in(select l.book_id from loans l) 

 select a.name from authors a
 inner join books b on a.author_ID=b.author_id
 left join loans l on b.book_id=l.book_id where l.return_date>any(select l.loan_date from loans l)

 select m.name from members m
 left join loans l on m.member_id=l.member_id
 inner join books b on l.book_id=b.book_id where b.book_id>any(select b.book_id from books b where b.author_id=19)

 select*from authors where name='dada'

 select m.name from members m
 inner join loans l on m.member_id=l.member_id
 inner join books b on l.book_id=b.book_id where count(b.book_id)>all(select b.book_id from books b
 join loans l on b.book_id=l.book_id
 group by m.name
 )

 select b.title from loans l
inner join books b on b.book_id=l.book_id where b.book_id<all(select l.book_id from loans l)

select a.name from authors a
 join books b on a.author_ID=b.author_id
join loans l on b.book_id=l.book_id where year(l.loan_date)=2012
group by a.name
having count(*)>=1

select b.title from books b
left join loans l on b.book_id=l.book_id where b.book_id>any(select l.book_id from loans l where year(loan_date)=2018 and MONTH(loan_date)=5)

select*from loans

select m.name from loans l
 join members m on l.member_id=m.member_id
 join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID where a.author_ID=all(select b.author_id from books b)

select b.title from books b
inner join loans l on l.book_id=b.book_id where l.member_id > (select l.return_date from loans l where l.member_id=2)

---April 21---
select m.name from members m
left join loans l on m.member_id=l.member_id where not exists(select 1 from loans l where l.member_id=m.member_id)

select m.name,min(l.loan_date) from members m
inner join loans l on m.member_id=l.member_id where (l.loan_date)>l.return_date 
group by m.name

select*from loans
select a.name from authors a
join books b on a.author_ID=b.author_id
 join loans l on b.book_id=l.book_id
 group by a.name
 having count(*)>=1

 select b.title from books b
  join authors a on b.author_id=a.author_ID where b.book_id>any(select b.title from books b where a.name like '%s')

  select b.title,b.book_id from books b
  left join loans l on b.book_id=l.book_id where b.book_id<all(select l.book_id from loans l)

  select a.name from authors a
   join books b on a.author_ID=b.author_id
   join loans l on b.book_id=l.book_id 

   select m.name from members m
   join loans l on m.member_id=l.member_id
   join books b on l.book_id=b.book_id where b.author_id!=12

   exec wawa

   select b.title from books b
   inner join loans l on b.book_id=l.book_id where l.return_date<any(select l.loan_date from loans l where year(l.loan_date)=2012)

  exec mum

  select*from books

  insert into authors_backup
  select*from authors where author_ID=21

  
 select*into oiu from books where author_ID=21

 select m.name from members m
join loans l on m.member_id=l.member_id
 join authors a on b.author_id=a.author_ID
join books b on l.book_id=b.book_id where l.loan_date>all(select  a.name from authors a where a.name like '%k%')

  select a.name from authors a
  join books b on a.author_ID=b.author_id
  join loans l on b.book_id=l.book_id
  join members m on l.member_id=m.member_id
  group by a.name
  having count(*)=1

  select b.title from books b
  left join loans l on b.book_id=l.book_id where not exists(select 1 from loans l where l.book_id=b.book_id and year(l.loan_date)=2013)

  select m.name from members m
  inner join loans l on m.member_id=l.member_id
  inner join books b on l.book_id=b.book_id
  group by m.name
  having COUNT(*)=1

  ----April 22---
  select title from books where title like '%data%'

  select m.name from members m where m.name like '%a'

  select b.title from books b where b.book_id>10

  select a.name from authors a where YEAR(a.birthdate) between 1970 and 1990

  select*from loans l where l.return_date is null

  select a.name from authors a where a.name not in('john')

  select m.name from members m where m.membership_date>'01/01/2013'

  select b.title from books b where b.title not like '%sql fro beginners%'

  select*from loans l where l.member_id=5 and l.book_id=3

  select b.title from books b where title like '%guide'

  select b.title from books b where exists(select 1 from authors a where a.author_id=b.author_id and a.author_ID in (9,12,14))

  exec wawa

  select*from loans l where l.return_date is not null

  ---April 23---

  select m.name from members m where m.name not like 'a%'
  create index sam on authors(name)

  select a.name from authors a where a.birthdate is null

  select*from loans l where year(l.loan_date)=2024

  select b.title from books b where len(b.title)=12

  select a.name from authors a where a.name not in('mike','linda')

  select a.name from authors a where a.name like '%son'

  select b.title from books b where b.book_id not between 5 and 10

  select b.title from books b where b.title like '%heidi%' or b.title like '%database%'

  alter table authors
  add nationality varchar(23)

  alter table members
  add phonenumbers varchar(15)

  create procedure dansaki
  as 
  select*from authors
  go
  exec dansaki

  alter table books
  alter column title varchar(251)

exec sp_rename 'books.titles', 'title', 'column'


update members
set phonenumbers=0591018927 where name='daavi'

----April 24---
alter table loans
drop column return_date

alter table loans
add return_date datetime

alter table books
add foreign key (author_id) references authors(author_id)

alter table members
add library_id int unique

alter table members
alter column name varchar(200)

alter table authors
drop column nationality

alter table books
add isavilable BIT;

exec sp_rename 'librarymembers','members'

select*from loans

alter table books
alter column title varchar(255) not null

---April 25--
 begin try
  insert into loans values(2,1098,3,'2011-03-09','2021-03-09')
  end try
  begin catch
  print 'an error occured.'
  end catch

  begin try
  update books
  set book_id=null where book_id between 12 and 765
  end try
  begin catch
  print 'dansaki'
  end catch

  alter table books
  drop constraint author_id

  ---April 25--
  select b.title,a.name,a.birthdate from books b
  left join authors a on b.author_id=a.author_ID

  select count(*) as numberofbooks,a.name from authors a
  left join books b on a.author_ID=b.author_id
  group by a.name

  select m.name,l.loan_id,l.loan_date,l.return_date from loans l
  right join members m on l.member_id=m.member_id where m.membership_date>'01/01/2020'

  select*from members

  select a.name from authors a
  left join books b on a.author_ID=b.author_id
  group by a.name
  having count(*)=5

  select count(*) as total,b.title from books b
  right join loans l on l.book_id=b.book_id
  group by b.title

 begin try
 
 select b.title from loans l
 right join books b on l.book_id=b.book_id where b.book_id not in(select book_id from loans l)
 end try
 begin catch
 print'dansaki'
 end catch

 select b.title from loans l
 right join books b on l.book_id=b.book_id where b.book_id not in(select book_id from loans l)

 select m.name,l.return_date,l.loan_date,l.loan_id,l.book_id,l.member_id from loans l
 right join members m on l.member_id=m.member_id

 select*from loans l where l.loan_date=DATEADD(day,-30,getdate())

 ---April 26--
 select count(*),a.name from authors a
 right join books b on a.author_ID=b.author_id where year(b.publish_date)=2008
 group by a.name

 select top 5*from authors a
 inner join books b on a.author_ID=b.author_id
 order by a.name

 select a.name from authors a
 union
 select m.name from members m

 select*from authors

select b.title from books b
left join authors a on b.author_id=a.author_ID where a.author_ID in(12) and b.book_id in(select book_id from loans l)

select a.name from authors a where exists(select 1 from books b where b.author_id=a.author_ID and b.book_id in(select book_id from loans l))

select a.name from authors a where not exists(select 1 from books b where a.author_ID=b.author_id and b.book_id not in(select book_id from loans l))

select a.name,count(*) as total from authors a
 join books b on a.author_ID=b.author_id
 join loans l on b.book_id=l.book_id
 group by a.name

 select a.name,a.birthdate from authors a
 join authors	b on a.birthdate=b.birthdate and a.author_ID<>b.author_ID

 select l.loan_id,l.loan_date,l.return_date,l.member_id,
                                            case
											when l.member_id not in(select l.member_id from loans l) Then 'absent'
											when l.book_id not in(select l.book_id from loans l) Then 'not available'
											else 'present'
											end as status from loans l
											join members m on l.member_id=m.member_id
										 join books b on l.book_id=b.book_id

-----April 27---
create view dansaka 
as
 select b.title,b.publish_date,b.author_id from books b
 join authors a on b.author_id=a.author_ID
 left join loans l on b.book_id=l.book_id

 select*from dansaka

 select m.name,b.title,b.book_id,m.member_id from members m
 cross join books b

 select b.title from authors a
 inner join books b on a.author_ID=b.author_id where a.name='daavi'


 ----rank function---
 select a.name,count(b.book_id), rank() over(order by count(b.book_id)desc) as rank from authors a
 left join books b on a.author_id=b.author_id
 group by a.name
 order by rank

 with authorloans as(
 select a.name,
 a.author_id,
 count(l.loan_id) as total from authors a
 left join books b on a.author_ID=b.author_id
 left join loans l on b.book_id=l.book_id
 group by a.name,a.author_ID
 )
 select 
 name,
 author_id,
 total from authorloans

 select a.name,count(*) from authors a
 left join books b on a.author_ID=b.author_id
 group by a.name
 having count(*)>2

 select m.name,count(*) as loancount from members m
 inner join loans l on m.member_id=l.member_id where m.name like 'd%'
 group by m.name

 select l.loan_date from loans l where l.return_date>dateadd(day,-1,getdate())

 select b.title from loans l
 join members m on l.member_id=m.member_id
 join books b on l.book_id=b.book_id where b.author_id in(select author_id from books b) and l.return_date in(select l.return_date from loans l)


 ----April 28---
 with dansaki as(
 select a.name as name,
 count(b.book_id) as bookcount from authors a
 left join books b on a.author_ID=b.author_id
 group by a.name
)
 select
 name,
 bookcount,
 rank() over(order by bookcount desc) as rank from dansaki
order by rank

with mummy as(
select avg(datediff(day,l.loan_date,l.return_date)) as average,
m.name as name from members m
inner join loans l on m.member_id=l.member_id
group by m.name
)
select
name,
average,
rank() over(order by average desc) as rank from mummy
order by rank

with noloanedbooks as(
select b.book_id as title from loans l
 join books b on l.book_id=b.book_id
)
select title from books b where b.book_id not in(select b.book_id from noloanedbooks)

with numberofloans as(
select m.name as name,count(l.loan_id) as loancount from members m
left join loans l on m.member_id=l.member_id
group by name
)
select
name,
loancount,
rank() over(order by loancount desc) as rank from numberofloans


with oldestauthors as(
select
a.name as name,
a.birthdate as birthdate,
count(b.book_id) as total from authors a
left join books b on a.author_ID=b.author_id
group by name,birthdate
)
select
name,
birthdate,
total from oldestauthors  where total=(select max(total) from oldestauthors)
 rank() over(order by total desc) as rank from oldestauthors

 with loanfrequency as(
 select b.book_id as dansaki,
 year(l.loan_date) as bibi,
 count(l.loan_id) as theo from loans l
 right join books b on l.book_id=b.book_id
 group by l.loan_date,l.loan_id,b.book_id

 )
 select
 dansaki,
 bibi,
 theo, 
  rank() over(order by theo desc) as rank from loanfrequency

with memberduration as(
select m.name as name,DATEDIFF(day,m.membership_date,GETDATE()) as duration from members m
)
select
name, 
duration,
rank() over(order by duration desc) as rank from memberduration

with nonmembers as(
select m.name as name from members m
left join loans l on m.member_id=l.member_id where l.loan_date<>(DATEADD(YEAR,-1,getdate()))
)
select
name,
RANK() over(order by name desc) as rank from nonmembers

with totalloans as(
select a.name as name,count(l.loan_id) as total from loans l
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID
group by name
)
select
name,
total,
rank() over(order by total desc) as rank from totalloans

---April 29---

select b.title,m.name from loans l
join books b on l.book_id=b.book_id
join members m on l.member_id=m.member_id

select a.name,count(l.loan_id) as total from loans l
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID
group by a.name

select m.name,b.title from loans l
join members m on l.member_id=m.member_id
join books b on l.book_id=b.book_id

select b.title,a.name from books b
left join authors a on b.author_id=a.author_ID where a.author_ID not in(select author_id from authors a)

select a.name,b.title from authors a
join books b on a.author_ID=b.author_id

select m.name from members m
left join loans l on m.member_id=l.member_id where l.loan_id is null

select l.loan_id,l.return_date,l.loan_id,l.book_id,b.title from loans l
right join books b on l.book_id=b.book_id

select a.name as authorname,m.name as membername from loans l
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID
join members m on l.member_id=m.member_id

select count(l.loan_id) as total,b.title from loans l
left join books b on l.book_id=b.book_id
group by b.title

select b.title,count(a.author_id) as numberofauthors from books b
left join authors a on b.author_id=a.author_ID
group by b.title
having COUNT(a.author_id)>1

select m.name,m.member_id,m.membership_date,count(b.book_id) as total,rank() over(order by count(b.book_id) desc) as rank  from loans l
join books b on l.book_id=b.book_id
join members m on l.member_id=m.member_id
group by m.name,m.member_id,m.membership_date

create view loansguys as
select  m.name from loans l
right join members m on l.member_id=m.member_id where l.loan_id is not null

select*from loansguys

create view authorloans as
select count(l.book_id) as total,a.name,a.birthdate from loans l
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID
group by a.name,a.birthdate

select*from authorloans

create view loansmade as
select l.loan_id,l.loan_date,l.return_date from loans l where l.loan_date=DATEADD(month,-1,getdate())

select*from loansmade

---April 30---
create view numberofloans as
select m.name as name,count(l.loan_id) as total,rank() over(order by count(l.loan_id)) as rank  from members m 
inner join loans l on m.member_id=l.member_id
group by m.name

select*from numberofloans

with totalbooks as(
select count(b.book_id) as total,a.name as authorname,count(l.loan_id) as theo from loans l
join  books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID
group by b.book_id,a.name
)
select
total,
authorname
from totalbooks

select b.title,count(l.loan_id),year(l.loan_date) as theo,  rank() over(order by count(l.loan_id)) as rank from loans l
right join books b on l.book_id=b.book_id	
group by b.title,YEAR(l.loan_date)

with cte as(
select a.name as name,count(l.loan_id) as total from loans l
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID
group by a.name
)
select
name,
total
from cte


select m.name as name,count(l.loan_id) as total, year(l.loan_date)  as theo, rank() over(order by count(l.loan_id) desc) as rank from members m
left join loans l on m.member_id=l.member_id
group by m.name, year(l.loan_date)


with dodo as(
select b.title as title from books b
left join loans l on b.book_id=l.book_id where l.loan_id is null and l.loan_date!=(DATEADD(year,-1,getdate()))
)
select
title
from dodo

select a.name as name from authors a
  join books b  on a.author_id=b.author_ID
 join loans l on b.book_id=l.book_id where not exists(select book_id from loans l)                    
group by a.name,b.title

-----mytsql codes---
---To check if all databases are online and healthy---
select name, state_desc
from sys.databases

---to view currenntly running queries---
select
r.session_id,
r.status,
r.command,
r.cpu_time,
t.text as query_text
from sys.dm_exec_requests r
cross apply sys.dm_exec_sql_text(r.sql_handle) t

---to see database names with ids---
select database_id,name from sys.databases


--For monitoring disk usage and space---
select DB_NAME(7) as dansaki,
name as logical_name,
size*8/1024 as size
from sys.master_files

exec sp_spaceused

---backup history--
select database_name,
backup_start_date,
backup_finish_date,
type as back
from  msdb.dbo.backupset
order by backup_finish_date

----to check who is logged in and what the person is doing--
select
SESSION_ID,
login_name,
HOST_NAME,
status from sys.dm_exec_sessions where is_user_process=1

select*from sys.dm_exec_sessions

select top 5
total_worker_time/execution_count as avgcpu,
execution_count,
total_worker_time,
text as query_text 
from sys.dm_exec_query_stats qs
cross apply sys.dm_exec_sql_text(qs.sql_handle)
order by avgcpu

--- for viewing failed agent jobs---
select
j.name,
h.step_name,
h.run_status,
h.message
from msdb.dbo.sysjobhistory h
join msdb.dbo.sysjobs j on h.job_id=j.job_id
where h.run_status!=1
order by h.run_date desc, h.run_time

---To rebuild all indexes in a table--
alter index all on dbo.theo rebuild

----to fix login issues after database restores---
exec sp_change_users_login 'Report'

---running integrity check(to check no corruption is present)---
DBCC CHECKDB('library') with no_infomsgs,all_errormsgs

----automating tasks--
delete from auditlogs
where logDate <DATEADD(DAY,-30,GETDATE())

select*from INFORMATION_SCHEMA.TABLES where TABLE_NAME='auditlogs'


---query optimization---
select 
qt.query_sql_text as querytext,
rs.avg_duration/1000000.0 as avgduration_ms,
rs.count_executions as execcount,
rs.last_execution_time
from sys.query_store_query_text qt
join
sys.query_store_query q on qt.query_text_id=q.query_text_id
join sys.query_store_plan pl on q.query_id=pl.query_id
join sys.query_store_runtime_stats rs on pl.plan_id=rs.plan_id
order by
rs.avg_duration desc
offset 0 rows fetch next 10 rows only

alter database library
set query_store(query_capture_mode=ALL)

select count(*) from sys.query_store_query

alter database library
set query_store clear

encrypt=true

----security practices---
select encrypt_option from sys.dm_exec_connections where session_id=@@spid

select*from sys.database_query_store_options;

select actual_state_desc from sys.database_query_store_options

declare @i int =0
 
 update statistics poi;
 exec sp_updatestats

 set statistics io,time on
----security practices---
select encrypt_option from sys.dm_exec_connections where session_id=@@spid


alter database library
set query_store=on;

---shows what each user does----
select
s.session_id,
r.status,
r.command,
s.login_name,
t.text as query_text
from sys.dm_exec_sessions s
join sys.dm_exec_requests r on s.session_id=r.session_id
cross apply sys.dm_exec_sql_text(r.sql_handle) t where s.is_user_process=1

---to see who is connected---
select
session_id,
status,
login_name,
HOST_NAME,
program_name,
login_time
from sys.dm_exec_sessions where is_user_process=1

---To check if anyone is running a long or blocked query and to check who is blocking who---
select
r.session_id,
r.start_time,
r.command,
r.cpu_time,
r.total_elapsed_time,
r.wait_type,
r.blocking_session_id,
r.status,
t.text as query_text
from sys.dm_exec_sessions s
join sys.dm_exec_requests r on s.session_id=r.session_id
cross apply sys.dm_exec_sql_text(r.sql_handle) t where r.blocking_session_id<>0

-----To check if anyone is running a long or blocked query--------
select
r.session_id,
r.start_time,
r.command,
r.cpu_time,
r.total_elapsed_time,
r.wait_type,
r.blocking_session_id,
r.status,
t.text as query_text
from sys.dm_exec_sessions s
join sys.dm_exec_requests r on s.session_id=r.session_id
cross apply sys.dm_exec_sql_text(r.sql_handle) t where is_user_process=1 

kill 54

---may 1---
use library

select b.title,a.name,a.birthdate from books b
inner join authors a on b.author_id=a.author_ID

select count(b.book_id) as numberofbooks,m.name from loans l
join members m on l.member_id=m.member_id
join books b on l.book_id=b.book_id
group by m.name

select m.name from loans l
join members m on l.member_id=m.member_id
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID where YEAR(a.birthdate)<1970

select b.title from books b
left join loans l on b.book_id=l.book_id where b.book_id not in(select book_id from loans l)

select count(b.book_id),a.name from books b
right join authors a on b.author_id=a.author_ID
group by a.name
having COUNT(b.book_id)>=1

select count(b.book_id),b.title from books b
left join loans l on b.book_id=l.book_id
group by b.title
having COUNT(b.book_id)>=1

select b.title,m.name,l.loan_id,l.loan_date,l.return_date,l.book_id,l.member_id from loans l
join members m on l.member_id=m.member_id
join books b on l.book_id=b.book_id

select m.name,count(a.author_id) from loans l
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID
join members m on l.member_id=m.member_id
group by m.name
having COUNT(a.author_id)>1

select b.title from books b
inner join loans l on b.book_id=l.book_id where return_date is null

select m.name from members m
left join loans l on m.member_id=l.member_id where l.member_id is null

---may 2---

select avg(datediff(day,l.loan_date,l.return_date)),b.title from loans l
inner join books b on l.book_id=b.book_id
group by b.title

select m.name from members m
inner join loans l on m.member_id=l.member_id where l.loan_date=DATEADD(day,-3000,getdate())

select b.title from books b
left join loans l on b.book_id=l.book_id where l.return_date>=30

update loans 
set return_date='2018-06-30' where member_id=87


update loans 
set return_date='2019-03-12' where member_id=2

update loans 
set return_date='2025-09-20' where member_id=29

update loans 
set return_date='2021-12-11' where member_id=22

select b.title from loans l
inner join books b on l.book_id=b.book_id where l.return_date>l.loan_date

select top 1 m.name,count(*) from loans l
inner join members m on l.member_id=m.member_id where YEAR(l.loan_date)=2025 
group by m.name


select a.name from loans l
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID where year(l.loan_date)=2011

select*from loans l where l.return_date=l.loan_date


update loans 
set return_date='2011-03-09' where member_id=2

select max(l.loan_date ) as earliest,min(l.loan_date) as minimum,b.title from loans l
inner join books b on l.book_id=b.book_id
group by l.loan_date,b.title

select m.name from loans l
inner join members m on l.member_id=m.member_id where MONTH(l.loan_date) in (5,6)

select m.name,DATEDIFF(day,loan_date,return_date) from loans l
inner join members m on l.member_id=m.member_id

create procedure phina
as
select*from authors

exec phina

---may 3--
select m.name from loans l
join members m on l.member_id=m.member_id
join books b on l.book_id=b.book_id 
join authors a on b.author_id=a.author_ID where a.author_ID= 12  

create login dansaki with password='password1234?'
create user dansaki for login dansaki
exec sp_addrolemember 'db_owner',dansaki

exec sp_addrolemember 'db_owner',Theo

select b.title,count(l.loan_id) from loans l
join books b on l.book_id=b.book_id
join members m on l.member_id=m.member_id
group by b.title
having COUNT(l.loan_id)=1

select a.name from loans l
right join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID where l.loan_id is null

select b.title,count(l.loan_id) as average from books b
join loans l on b.book_id=l.book_id
group by b.title
having count(l.loan_id)>(select avg(average) from(select count(*) as average from loans
group by b.title)
as theo);

select m.name from members m
join loans l on l.member_id=m.member_id
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID where year(a.birthdate)>1980

select top 1 m.name,COUNT(l.loan_id) from members m
inner join loans l on m.member_id=l.member_id
group by m.name

select b.title,DATEDIFF(day,l.loan_date,l.return_date) from loans l
inner join books b on l.book_id=b.book_id where l.return_date is not null and DATEDIFF(day,l.loan_date,l.return_date)>(select AVG(cast(DATEDIFF(day,l.loan_date,l.return_date) as float))
from loans )

---may 4---
select   top 1 a.birthdate,a.name from loans l
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID
order by a.name desc

select  top 1 a.birthdate ,b.title from loans l
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID
order by b.title desc

select m.name from members m
inner join loans l on m.member_id=l.member_id where l.return_date is null

select m.name from members m
inner join loans l on m.member_id=m.member_id where l.return_date is not null
group by m.name
having count(distinct l.loan_id)>
3 and COUNT(*)=COUNT(l.return_date)

select m.name,count(l.loan_id) from loans l
inner join members m on l.member_id=m.member_id
group by m.name
having count(l.loan_id)=COUNT(*)

select b.title from books b
inner join loans l on b.book_id=l.book_id where l.loan_date

select  top 1 a.name,avg(datediff(day,l.loan_date,l.return_date)) as dansaki from authors a
 join books b on a.author_ID=b.author_id
 join loans l on b.book_id=l.book_id
 group by a.name
 order by dansaki desc

 select m.name,count(distinct a.author_id) from loans l
 join members m on l.member_id=m.member_id
 join books b on l.book_id=b.book_id
 join authors a on b.author_id=a.author_ID
 group by m.name
 having COUNT(distinct a.author_id)>=1 

 select top 10 count(l.loan_id),a.name from loans l
 join books b on l.book_id=b.book_id
 join authors a on b.author_id=a.author_id
 group by a.name 
 order by count(l.loan_id) desc

 with theo as(
 select m.name,
 count(l.loan_id) as dan from members m
 left join loans l on m.member_id=l.member_id
 group by m.name
 ),

 avgloan as(
 select avg(dan) as theo from theo
 )

 select m.name from theo m
 join avgloan av on m.dan>av.theo
 

 select m.name,b.title,DATEADD(day,14,l.loan_date)  from loans l
 join members m on l.member_id=m.member_id
 join books b on l.book_id=b.book_id where l.return_date is null and DATEadd(day,14,l.loan_date)<GETDATE()

 select a.name from authors a
 join books b on a.author_ID=b.author_id
 join loans l on b.book_id=l.book_id where YEAR(l.return_date)<>2024

 select m.name,count(b.book_id) from loans l
 join books b on l.book_id=b.book_id
 join members m on l.member_id=m.member_id
 group by m.name
 having count(b.book_id)>2

 select b.title from books b
 left join loans l on b.book_id=l.book_id where l.book_id is null

 select top 3 b.title from books b
 left join loans l on b.book_id=l.book_id where YEAR(l.loan_date)=2018

 select m.name from members m
 join loans l on m.member_id=l.member_id where MONTH(l.loan_date) in (1,2,3,4,5,6,7,8,9,10,11,12) and YEAR(l.loan_date)=2018

 select b.title from books b
 inner join loans l on b.book_id=l.book_id where l.return_date is null

 ----may5---
select
cast(count(*) as float)/count(distinct member_id) as thei
from loans

select b.title,COUNT(distinct m.member_id) from members m
join loans l on l.member_id=m.member_id
join books b on b.book_id=l.book_id
group by b.title
having count(distinct m.member_id)>10

select m.name,count(a.author_id) from loans l
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID
join members m on l.member_id=m.member_id
group by m.name
having COUNT(a.author_id)=1

select*from loans l where l.return_date>DATEADD(day,30,l.loan_date)

select b.title,DATEDIFF(day,l.return_date,GETDATE()) from books b
inner join loans l on b.book_id=l.book_id where l.return_date<GETDATE()

select count(l.loan_id) from loans l where YEAR(l.loan_date) in (2018,2023) and MONTH(l.loan_date) between 1 and 12

select DATEPART(year,loan_date) as loanyear,
datepart(quarter,loan_date) as theo,
count(*) as hm
from loans where loan_date>=dateadd(year,-7,getdate())
group by
DATEPART(year,loan_date),
datepart(quarter,loan_date)

select m.name from members m
join loans l1 on m.member_id=l1.member_id
join loans l2 on m.member_id=l2.member_id where MONTH(l2.loan_date)=MONTH(l1.loan_date)+1
and YEAR(l1.loan_date)=YEAR(l2.loan_date) and l1.loan_date<l2.loan_date

select DATEPART(YEAR,loan_date) as number,
DATEPART(MONTH,loan_date) as dans,
count(*) as yep
from loans where year(loan_date)=2018
group by
DATEPART(MONTH,loan_date),
DATEPART(YEAR,loan_date)

select min(datediff(day,loan_date,return_date)),max(datediff(day,loan_date,return_date)) as dan from loans 

select a.name,avg(datediff(day,l.loan_date,l.return_date))  as theo from loans l
join books b on l.book_id=b.book_id
join authors a on b.author_id=a.author_ID
group by a.name

select b.title,count(l.loan_id) from books b
join loans l on b.book_id=l.book_id where l.loan_date=DATEADD(MONTH,-91,GETDATE()) 
group by b.title
having count(l.loan_id)>1

select b.title from books b 
inner join loans l on b.book_id=l.book_id where datename(WEEKDAY,loan_date) in ('saturday','sunday')

--may 6--
select b.title from books b
inner join loans l on b.book_id=l.book_id where l.loan_date=DATEADD(day,-30,GETDATE())

select m.name from members m
left join loans l on m.member_id=l.member_id where not exists(
select 1 from loans l where l.member_id=m.member_id and l.loan_date>=DATEADD(year,-15,getdate()))

select b.title from books b
inner join loans l on b.book_id=l.book_id where l.return_date is null

select*from loans l where l.return_date>dateadd(day,14,l.loan_date)

select DATEPART(month,loan_date) as bookmonth,
DATEPART(YEAR,loan_date) as curryear,
count(b.book_id) as theo
from loans l 
inner join books b on l.book_id=b.book_id where year(l.loan_date)=2018
group by DATEPART(YEAR,loan_date),
 DATEPART(month,loan_date)

 select m.name,count(l.book_id) as number from members m
 join loans l on m.member_id=l.member_id where l.loan_date=dateadd(month,-3,getdate())
 group by m.name
 having count(l.book_id)>5

 select b.title from books b
 inner join loans l on b.book_id=l.book_id where datename(weekday,l.return_date) in ('saturday','sunday')

 select DATENAME(weekday,l.loan_date) as busyday,COUNT(l.loan_id) as hm from loans l
 group by DATENAME(weekday,l.loan_date)
 order by hm desc

 select avg(datediff(day,l.loan_date,l.return_date)),b.title from loans l
 right join books b on l.book_id=b.book_id
 group by b.title

 select b.title from books b
 left join loans l on b.book_id=l.book_id where l.book_id is null



create procedure lony
as
select*from loans 
go

exec lony

----may 7---
select DATEPART(quarter,l.loan_date) as booksquater,
count(l.loan_id) as total
from loans l where year(l.loan_date)=2018
group by DATEPART(quarter,l.loan_date)

select top 1 m.name,count(l.loan_id) as theo from members m
inner join loans l on m.member_id=l.member_id where year(l.loan_date)=2018
group by m.name
order by theo desc

select m.name from members m
inner join loans l on m.member_id=l.member_id where l.return_date>DATEADD(day,10,l.loan_date)

select m.name,DATEDIFF(day,l.loan_date,l.return_date) as theo from loans l
inner join members m on l.member_id=m.member_id
group by m.name,l.loan_date,l.return_date 

select*from loans l where DATENAME(weekday,l.loan_date) in ('saturday')

select max(datediff(day,loan_date,return_date)) from loans 

select b.title from books b
inner join loans l on b.book_id=l.book_id where (l.loan_date)=any(select l.loan_date from loans l where month(l.loan_date)=5)

select*from loans l where l.return_date<GETDATE() and l.return_date is null

select count(l.loan_id) from loans l where l.loan_date=DATEADD(day,-219,getdate())

---may 8--

select m.name from members m
inner join loans l on m.member_id=l.member_id where l.loan_date=m.membership_date

select b.title from books b
inner join loans l on b.book_id=l.book_id where l.return_date=l.loan_date

select count(l.loan_id) as totals from loans l where l.loan_date=DATEADD(MONTH,0,GETDATE())

select top 5 b.title from books b
inner join loans l  on b.book_id=l.book_id where year(l.loan_date)=2018

exec lony

select l.loan_id,l.book_id,l.loan_date,l.return_date,l.member_id,DATEDIFF(day,l.return_date,getdate()) as numberofdays from loans l

select m.name, count(l.loan_id),RANK() over(order by count(l.loan_id) desc) as rank from members m
inner join loans l on m.member_id=l.member_id
group by m.name

insert into loans values(32,21,87,'2005-03-09','2008-02-01')
insert into loans values(41,41,54,'2014-03-09','2016-01-03')
insert into loans values(09,19,12,'2021-3-09','2024-03-07')
insert into loans values(45,21,2,'2025-03-09','2023-09-02')
insert into loans values(35,53,22,'2011-08-09','2013-10-08')
insert into loans values(87,16,29,'2025-03-09','2025-02-08')
insert into loans values(98,22,29,'2016-03-09','2025-01-08')
insert into loans values(86,19,22,'2012-03-09','2021-01-07')
insert into loans values(109,19,87,'2010-03-09','2013-01-05')
insert into loans values(19,21,87,'2009-03-09','2011-01-07')
insert into loans values(82,22,21,'2019-03-09','2021-11-09')
insert into loans values(25,22,87,'2016-03-09','2025-06-21')
insert into loans values(101,16,87,'2015-03-09','2025-01-02')
insert into loans values(49,19,29,'2013-01-09','2011-02-08')
insert into loans values(5,17,7,'2012-08-09','2021-11-09')
insert into loans values(31,2,2,'2012-01-09','2017-03-09')

exec lony

select m.name from members m
inner join loans l on m.member_id=l.member_id where l.loan_date<=DATEADD(day,-30,GETDATE())

select m.name,min(l.loan_date) from members m
inner join loans l on m.member_id=l.member_id 
group by m.name,m.membership_date,l.loan_date
having  DATEDIFF(day,m.membership_date,min(l.loan_date))<=7 and DATEDIFF(day,m.membership_date,min(l.loan_date))>=0

select b.title from books b
inner join loans l on b.book_id=l.book_id where DATENAME(weekday,l.loan_date) in ('saturday','sunday') and l.loan_date=dateadd(month,-76,getdate())

select*from  loans l where l.member_id=29

select
month(l.loan_date) as theo,
year(l.loan_date) as dansaki,
count(*) from loans l where l.loan_date>=DATEADD(month,-12,getdate())
group by year(l.loan_date),month(l.loan_date)

---may 8--
select m.name from members m
inner join loans l on l.member_id=m.member_id where year(l.loan_date) in (1,12)

select min(l.loan_date) as minimum,max(l.loan_date) as maximum,m.name from members m
inner join loans l on m.member_id=l.member_id
group by m.name

select year(l.loan_date),month(l.loan_date) from loans l  where month(l.loan_date) is null
group by year(l.loan_date),month(l.loan_date)

select day(l.loan_date),
cast(count(b.book_id) as float)/count(distinct m.member_id) from loans l
join books b on l.book_id=b.book_id
join members m  on l.member_id=m.member_id where l.loan_date=DATEADD(day,-90,getdate())
group by l.loan_date

select count(*)*1.0/90 as avera
from loans l where l.loan_date>=DATEADD(day,-90,getdate())

begin try
insert into loans values(31,2,2,'2012-01-09','2017-03-09')
end try 
begin catch
print 'book loaned out already'
end catch

begin try
update books
set title=null where book_id=2
print 'update successful'
end try
begin catch
print'error:'+ ERROR_MESSAGE();
end catch

begin try
delete from authors where author_ID=12
print 'delete successful'
end try
begin catch
print 'ERROR:'+ ERROR_MESSAGE()
END catch

select*from authors

create table errorlog(
errorid int identity(1,1) primary key,
errormessage nvarchar(4000),
errorline int,
errorprocedure nvarchar(230),
error datetime default getdate()
);

begin try
 insert into loans values(2,2,32,'2012-01-09','2017-03-09')
print 'loan record success'
end try
begin catch
insert into errorlog(errormessage,errorline,errorprocedure)
values(ERROR_MESSAGE(),ERROR_PROCEDURE(),ERROR_LINE())
print 'error occurred.logged into error table.'
end catch

select*from errorlog

drop table errorlog

exec lony


begin try
update loans
set return_date='2020/01/02' where member_id=98
end try
begin catch
print 'ERROR:'+ERROR_MESSAGE()
end catch

---may 9----
 select a.name,b.title ,count(l.loan_id) as amount from authors a
 join books b on a.author_ID=b.author_id
 left join loans l on b.book_id=l.book_id 
 group by a.name,b.title
 having COUNT(l.loan_id)=0

 create view dasakire as
 select m.name,m.member_id,b.title from loans l
 join members m on l.member_id=m.member_id
 join books b on l.book_id=b.book_id
 group by m.name,m.member_id,b.title

 select*from dasakire

 select a.name,count(l.loan_id) as total  from authors a
 join books b on a.author_ID=b.author_id
 join loans l on b.book_id=l.book_id
 group by a.name
 having COUNT(l.loan_id)>7

 select count(a.author_id),a.name from authors a
 join books b on a.author_ID=b.author_id
 group by a.name

 select*from loans

 select count(l.loan_id),m.name,b.book_id from loans l
 inner join members m on l.member_id=m.member_id
 join books b on l.book_id=b.book_id
 group by m.name,b.book_id
 having COUNT(distinct l.loan_id)>1

 select b.title,COUNT(l.loan_id) from books b
 inner join loans l on b.book_id=l.book_id where l.return_date>DATEADD(day,13,l.loan_date)
 group by b.title
 having COUNT(l.loan_id)>1

 alter table loans
 add status varchar(79) null

 update loans 
 set status='flagged' where return_date>DATEADD(day,30,getdate())

 alter table loans
 drop column flagged

 select a.name,count(distinct l.member_id) as total from authors a
 join books b on a.author_ID=b.author_id
 join loans l on b.book_id=l.book_id
group by a.name
order by total desc

 exec lony

 select count(*)*1.0/90 as dansaki from loans l


 ---may 10-----

 select m.name,count(l.loan_id) as total ,DATEDIFF(day,m.membership_date,getdate()) as memberduration from loans l
 inner join members m on l.member_id=m.member_id
 group by m.name,m.membership_date

 select count(b.book_id) as total,count(l.loan_id) as theo,count(m.member_id) as members,year(m.membership_date) from members m
 join loans l on m.member_id=l.member_id
 join books b on l.book_id=b.book_id
 group by m.membership_date

 select top 3 b.title,count(l.loan_id) as total,m.name from loans l
 inner join books b on l.book_id=b.book_id
 join members m on l.member_id=m.member_id
 group by m.name,b.title
 having count(l.loan_id)>1

 select b.title,l.loan_id,l.status,l.book_id,l.loan_date,l.return_date,l.member_id from loans l 
 inner join books b on  l.book_id=b.book_id where member_id=2

 exec lony


 select top 5 count(l.loan_id) as total,datediff(month,-6,l.loan_date),m.name from loans l
 inner join members m on m.member_id=l.member_id
 group by m.name,l.loan_date
 
 select COUNT(l.loan_id) as total,avg(datediff(day,l.loan_date,l.return_date)) as duration, m.name as myname from loans l
 inner join members m on l.member_id=m.member_id where  year(l.loan_date)>=2024
 group by m.name


 select m.name,count(distinct a.author_id),b.book_id from loans l
 join books b on l.book_id=b.book_id
 join members m on l.member_id=m.member_id
 join authors a on b.author_id=a.author_ID
 group by m.name,b.book_id
 having count(distinct a.author_id)>1

 select a.name,max(datediff(day,l.loan_date,l.return_date)) as duration from loans l
 join books b on l.book_id=b.book_id
 join authors a on b.author_id=a.author_ID
 group by a.name

 select m.name,count(distinct l.loan_id),b.book_id from loans l
 right join members m on l.member_id=m.member_id
 join books b on l.book_id=b.book_id
 group by m.name,l.return_date,b.book_id
 having COUNT(distinct l.loan_id)>1 and l.return_date is not null

 ---may 11----

 delete from books  where book_id in(select b.book_id from books b
 left join loans l on b.book_id=l.book_id
 group by b.book_id,loan_date
 having loan_date<DATEADD(year,-5,getdate()))

 select m.name,count(l.loan_id) from members m
 left join loans l on m.member_id=l.member_id
 group by m.name
 having COUNT(l.loan_id)>all(select COUNT(l.loan_id) from loans l2
 group by l2.member_id
 having count(l2.loan_id) is not null
 );

 select count(l.loan_id),m.name from members m
 inner join loans l on m.member_id=l.member_id
 group by m.name

 select b.title from books b
 inner join loans l on b.book_id=l.book_id where l.return_date is null

 select b.title,m.name from books b
 join loans l on b.book_id=l.book_id
 join members m on l.member_id=m.member_id where l.loan_date=(select max(l2.loan_date) from loans l2 where l2.book_id=b.book_id
 )

 select b.title,a.name from books b
 join authors a on b.author_id=a.author_ID where a.name=b.title

 select m.name,count(l.loan_id),a.author_id from members m
 join loans l on m.member_id=l.member_id
 join books b on l.book_id=b.book_id
 join authors a on b.author_id=a.author_ID
 group by m.name,a.author_ID
 having count(l.loan_id)>3

 exec lony

 select count(distinct m.member_id) from loans l
 inner join members m on l.member_id=m.member_id

 select b.title from books b
 inner join loans l on b.book_id=l.book_id where l.return_date=l.loan_date

 select m.name,max(l.return_date) from loans l
 inner join members m on l.member_id=m.member_id
 group by m.name

 ---may 12---
 select top 1 l.return_date,b.title from books b
 inner join loans l on b.book_id=l.book_id

 select a.name from authors a
 join books b on a.author_ID=b.author_id
 join loans l on b.book_id=l.book_id where year(l.loan_date)>2024

 select top 5 b.title,a.name from books b
 join loans l on l.book_id=b.book_id
 join authors a on b.author_id=a.author_ID

 select m.name from members m
 join loans l on m.member_id=l.member_id
 join  books b on l.book_id=b.book_id
 join authors a on b.author_id=a.author_ID where a.author_ID=12

 select*from authors

 select m.name,avg(datediff(day,l.loan_date,l.return_date)) as duration from loans l
 inner join members m on l.member_id=m.member_id
 group by m.name

 select m.name,status from members m
 inner join loans l on m.member_id=l.member_id where year(l.loan_date)=2025

 select m.name from members m
 inner join loans l on m.member_id=l.member_id where l.loan_date<l.return_date
 group by m.name

 select a.name from authors a
 join books b on a.author_ID=b.author_id
 join loans l on b.book_id=l.book_id  where l.loan_id  is null
 group by a.name

 select count(*) from authors

 ---may 13---
 select count(l.loan_id),m.name from members m
  inner join loans l on m.member_id=l.member_id
 group by m.name

 select b.title from books b
 left join loans l on b.book_id=l.book_id where b.title like 'a%'
 group by b.title

 select b.title,a.name,
                          case 
						  when book_id in (select book_id from loans l) Then 'loaned'
						  else 'available'
						  end as status
						  from books b
						   join authors a on b.author_id=a.author_ID


select b.title from books b
inner join loans l on b.book_id=l.book_id where b.book_id<all(select book_id from loans l)

select a.name from authors a
 

 select m.name from members m
  join loans l on m.member_id=l.member_id
 group by m.name,l.loan_date
 having count(distinct year(l.loan_date))>=3

 select top 1 a.name,min(a.birthdate) as hmm from authors a
  join books b on a.author_ID=b.author_id
 join loans l on b.book_id=l.book_id
  group by a.birthdate,a.name
 order by a.birthdate desc

 select b.title from books b
 left join loans l on b.book_id=l.book_id where l.loan_date!>DATEADD(year,-1,getdate())
 group by title 

 exec lony
 select*from books

 ---may 14---
 select count(l.loan_id) as numberofbooks,count(distinct b.book_id) as authorsbooks ,b.title  as books from books b
 join authors a on  b.author_id=a.author_ID
 join loans l on b.book_id=l.book_id
 group by  b.title
 having count(l.loan_id)>=1

 select count(a.author_id),a.name from authors a
 join books b on a.author_ID=b.author_id
 group by a.name

 select b.title  from books b
 inner join loans l on b.book_id=l.book_id where datediff(day,l.loan_date,l.return_date)>(select avg(datediff(day,loan_date,return_date))  from loans l where return_date is null)
 
 select top 1 a.name,count(l.loan_id) from authors a
 join books b on a.author_ID=b.author_id
 join loans l on b.book_id=l.book_id
 group by a.name,b.book_id
 order by a.name desc

 select count(a.author_id),a.name from authors a
 left join books b on a.author_ID=b.author_id
 group by a.name

 select*from loans where return_date>DATEADD(day,10,loan_date)
  update statistics loans

 exec lony

 create index dansaki on loans(member_id,loan_date,return_date)

 create index theo on loans (loan_id)

  create index hmmm on books(book_id) include(title)

  set statistics io,time on

  alter database library
  set query_store=on

  ----may 15----
----identifying heaviest queries over the last month using execution stats--

select top 10
qt.query_sql_text,
sum(rs.count_executions) as dansaki,
sum(rs.avg_duration*rs.count_executions)/100000.0 as total,
sum(rs.avg_cpu_time*rs.count_executions)/100000.0 as totalcpu_ms
from sys.query_store_query q
join sys.query_store_query_text qt on q.query_text_id=qt.query_text_id
join sys.query_store_plan p on q.query_id=p.query_id
join sys.query_store_runtime_stats rs on p.plan_id=rs.plan_id
join sys.query_store_runtime_stats_interval rsi on rs.runtime_stats_interval_id=rsi.runtime_stats_interval_id 
where rsi.start_time>=dateadd(month,-5,getdate())
group by qt.query_sql_text
order by total desc

select 
cast(count(*) as float)/count(distinct member_id) from loans l

select max(DATEPART(month,l.return_date)) from loans l
group by DATEPART(month,l.return_date)

select system_user as theo
select IS_MEMBER('owner') as dansai

alter role datawriter add member theo

  dbcc opentran

  begin tran
  update books set title='locked' where book_id=2

  select*from books

  select*from sys.dm_db_index_usage_stats




