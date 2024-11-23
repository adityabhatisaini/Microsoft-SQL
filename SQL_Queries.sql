                                                              ----- SQL By Vyankatesh Sir---------



select name from sys.databases;
create database Bhati_Capital;
use Bhati_Capital;
create table Customer(Id char(03) primary key,Name varchar(20) not null,Class char(2) not null,State varchar(20) not null);
insert into Customer values ('A01','Sagar Dalai',9588011254,'Chhattisgrah');
alter table Customer alter column Mobile_No bigint; -- use for adding column
alter table Customer add Pincode int;  -- Also use for adding column
select * from Customer;
alter table Customer add Village varchar(20);
update Customer set Village = 'Chirimiri' where Id_No='A01';
update Customer set Pincode ='341031';



select * from Employee;
insert into Employee values('A01','Aditya','10','Rajasthan');
alter table Employee add Village2 varchar(20);
select * from Employee;
update Employee set Village = 'Merta City' where Id = 'A01';

insert into Employee values ('A04','Sagar Dalai','13','Chhh.','Chirmiry'),
('A05','Sagar Dalai','13','Chhh.','Chirmiry'),
('A06','Sagar Dalai','13','Chhh.','Chirmiry'),
('A07','Sagar Dalai','13','Chhh.','Chirmiry'),
('A08','Sagar Dalai','13','Chhh.','Chirmiry');

                                                                     --02 August 2024--

select * from Customer;
update Customer set Village='Gandhinagar' where id_No= 'A09'
select Name as Naam, State as Village from Customer;
select * from Customer order by Name desc; -- High to Law
select * from Customer order by Name asc; -- Law to High
select * from Customer order by State;
select * from Customer where State= 'Rajasthan';
insert into Customer values('A11','Rohan','','Gujarat','Merta');
select * from Customer 
order by Name,State;

update Customer set Mobile_No ='4568545454' where Id_No='A11';



exec sp_help Customer; --for showing more information of creation

truncate table Employee;    --it will be all clear data but column remians
select 22/7 -- get lower nearst numer & like 3.5 get 4 and 4.5 take 4 like even number
select cast(22 as float)/7
select 13%3    --only gives reminders like 1

select cast('02/09/2024' as datetime);

update Customer set Mobile_No=Mobile_No*1.2;
update Customer set Mobile_No=Mobile_No*1.2 where Id_No='A11';



                                                                           --04 Aug 2024--

select * from Customer order by Name
offset 3 rows
fetch next 5 rows only;

select * from Customer order by id_No
offset 3 rows;  -- offset for not selection particular raws

select * from Customer order by id_No offset 0 rows
fetch next 5 rows only;



select * from Customer order by Id_No
offset 3 rows
fetch next 5 rows only;

select count(*) from Customer;


select count(Village) from Customer;

select DISTINCT(Name) from Customer;  -- for selecting only column particular

select count(distinct(Village)) as Dream_Place from Customer;   --for selecting particular column number and give name as your wish
select count(*) as DreamPlace from Customer where Village= 'Padukalan';

--How many employees have salary greater than 60000 ?

                                                                        --09 Aug 2024--

alter table Customer add Income int;
select * from Customer;

update Customer set Income=(case when Id_No='A02' then '35000'
when Id_No='A03' then '40000'
when Id_No='A04' then '55000'
when Id_No='A05' then '65000'
when Id_No='A06' then '75000'
when Id_No='A07' then '85000'
when Id_No='A08' then '95000'
when Id_No='A09' then '35000'
when Id_No='A10' then '40000'
when Id_No='A11' then '99000'
when Id_No='A01' then '35000'
end)
where Id_No in ('A01','A02','A03','A04','A05','A06','A07','A08','A09','A10','A11');   -- #by this query whithout update raw not have null

select max(Income) as Max_Income from Customer;

select avg(Income) as Avg_Income from Customer;

select round(avg(Income),2) as Avg_Income from Customer;

select distinct(avg(Income)) as Avg_Income from Customer;
 
 select * from Customer where Income>40000;

 select Id_No,Village,Income from Customer where Income>40000;

 select Id_No,Village,Income from Customer where Income>40000 and Village='Padukalan';

 select Id_No,Village,Income from Customer where Income>40000 or Village='Padukalan';

 select Id_No,Village,Income from Customer where Income>40000 or Village='Padukalan';

 select * from Customer where State in('Rajasthan','Gujarat');

 select * from Customer where State not in ('Rajasthan','Gujarat');

 select * from Customer where Income not between 30000 and 50000; 

 select * from Customer where Name like 'A%';

                                                                    --10 Aug 2024--

 select max(Income) from Customer;

 select count(Income) from Customer;

 select sum(Income) from Customer;

--Q.How many employees are working in company?
 select count(Name) from Customer;

 select * from Customer;



 --Q. How many employees are working in company?
 select count(Name) from Customer;

 select * from Customer;

 --Q. How many employees in production department?

 select count(Village) from Customer where Village='Padukalan';
 select count(*) as opt from Customer where Village='Padukalan';

 --Q.How many managers are working in company?
 select count(*) as opt from Customer where State='Rajasthan';

 --Q.How many subordinates are working in company with more than 40000 salary?
 select count(*) from Customer where Income>40000;
 select * from Customer;
 select count(*) from Customer where Village ='Padukalan' and Income>40000;

 --Q. How many Designations are defined in company?
 select count(distinct(State)) from Customer;

 --Q. How many total salary paid to Rajasthan and gujarat state combinedly?
 select sum(Income) from Customer where State = 'Rajasthan' or state= 'Gujarat';
 --                      Or
 select sum(Income) from Customer where state in ('Rajasthan','Gujarat');

 --Q.What is the average salary of Subordinates?

 select avg(Income) from Customer where state= 'Rajasthan';

 --Q.What is max salary paid to clerk(Rajasthan)?
 select max(Income) from Customer where state='Rajasthan';

 select * from Customer where Name like 'A%';

 select * from Customer where Village not in ('Padukalan');

 select * from Customer where Income >= 40000 and Income <= 75000 ;


 --23 Sept 2024

 select Village,sum(Income) as Total from Customer group by Village;

 --Q. How many employees are working at each job State
 select State,count(Name) as Total from Customer group by State;

 --Q. How many number of employees are working at each job designation sorted lower to higher
 select State,count(Name) as Total from Customer group by State 
 order by count(Name) desc;
                                      -- Or
select State,count(Name) as Total from Customer group by State 
 order by count(Name);

 --Q. Max Salary in Designation 
 select State,max(Income) as Total from Customer group by State;

 --Q. What is total salary expenditure in each state
 select State,sum(Income) from Customer
 group by State;


--Q. What is the max salary in hr and production

select State,max(Income) from Customer
where State in ('Rajasthan','Gujarat') group by State,Village;

--Q.WAQ to fetch average salary in each dept sorted high to low other than dispatch and account.

select State,avg(Income) from Customer
                                      where State not in ('Rajasthan','Gujarat') group by State order by avg(Income) desc;

--Q.What are the top 2 Designations with highest avg salary and fetch only designation

select top 2 State from Customer group by State order by avg(Income);



select State,count(*) as npr from Customer group by State having count(*)<5;

--Q. Fetch the dept with total salary expenditure less than 100000.
select State,sum(Income) as total from Customer group by State having sum(Income)<100000;

--Q. Fetch the 3rd highest dept with max total salary expenditure.
select State,sum(Income) as Total from Customer group by State order by Sum(Income) desc offset 2 rows fetch next 1 row only;

---------------------------**********----------------------------------*********************----------------------------------*********-------
                                                
												/*Moving Databases and Join operations*/


select name from sys.tables;
select * from student;
select * from laptop;
create table laptop(Lid char(5) primary key, Lmodel char(7),studentid char(2));

insert into laptop values('98765','HP54321','22'),
('98766','HP54354','11'),
('98767','HP53214','44'),
('98768','HP54568','33'),
('98769','HP51234','66'),
('98770','HP58765','55'),
('98771','HP57865','88');

insert into student values('99','Baswaraj','Banglore','India');

select student.id,student.name,laptop.lid from student inner join laptop on student.id=laptop.studentid;

select student.id,student.name,laptop.lid from student left join laptop on student.id=laptop.studentid;
select student.id,student.name,laptop.lid from student right join laptop on student.id=laptop.studentid;
select student.id,student.name,laptop.lid from student full outer join laptop on student.id=laptop.studentid;


create table EMP
(empno char(4) primary key, ename varchar, job varchar, mgr char, hiredate date,sal int, comm int, deptno int);




--10 Oct 2024

create database EMP;

create table emp(empno char(10) primary key,ename varchar(20),job varchar(20),mgr char(10),hiredate date,sal int,comm int,deptno int);

create table salgrade(grade int primary key,losal int,hisal int);

create table dept(deptno int primary key,dname varchar(20),loc varchar);


INSERT INTO EMP VALUES
(7839, 'Anup', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
(7698, 'Sanket', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
(7782, 'Darshan', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
(7566, 'Reema', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
(7788, 'Subhash', 'ANALYST', 7566, '1987-07-13', 3000, NULL, 20),
(7902, 'Jyoti', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
(7369, 'Swaroop', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
(7499, 'Durva', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);

INSERT INTO SALGRADE (grade, losal, hisal) VALUES
(1, 700, 1200),
(2, 1201, 1400),
(3, 1401, 2000),
(4, 2001, 3000),
(5, 3001, 9999);



drop table dept;

CREATE TABLE DEPT (
    deptno INT,
    dname VARCHAR(50),
    loc VARCHAR(50));

INSERT INTO DEPT (deptno, dname, loc) VALUES (10, 'ACCOUNTING', 'NAGPUR');
INSERT INTO DEPT (deptno, dname, loc) VALUES (20, 'RESEARCH', 'HYDERABAD');
INSERT INTO DEPT (deptno, dname, loc) VALUES (30, 'SALES', 'RAIPUR');
INSERT INTO DEPT (deptno, dname, loc) VALUES (40, 'OPERATIONS', 'BANGALORE');

select * from emp;
select * from dept;
select * from salgrade;

--Q.
select Dept,avg(salary) from emp group by dept;

select *
from emp as e1 
where salary <(select avg(salary) from emp as e2 where e1.dept=e2.dept);

--DATA CLEANING
SELECT * FROM cricket;
UPDATE cricket 
SET SR=(Runs/Balls)*100 WHERE SR IS NULL AND Balls>0;

UPDATE cricket set Mins=60*Balls where Mins is NULL
