use classicmodels;
select *from customers;
select customerName,creditLimit from customers where creditLimit>
(select avg(creditLimit)  from customers);
select avg(creditLimit) as avg_credit from customers; 
select *from customers where state is null;
select *from employees;
select *from payments;
select *from products;
select *from orderdetails;
#write a query to print productcode,productName where priceEach >100.------------
select productcode,productName,msrp from products 
where productCode and orderNumber in (select productCode from  orderdetails
where priceEach<100);
# store procedure in sql. code can be reuse over and over again.---------------
select *from products;
delimiter &&
create procedure top_msrp()
begin
select productcode,productname,msrp from products where msrp>100;
end &&
delimiter ;
call top_msrp; 
# store procedure to enter value by user--------------
select *from customers;
delimiter //
create procedure top_salaries(IN var INT)
begin 
select customerNumber,customerName,creditlimit from customers  order by creditLimit desc limit var ;
end //
delimiter ;
call top_salaries(3);
# store procedure to update the record in table:-----------------
select *from customers;
# customer name and change credit limit.
delimiter //
create procedure update_credit(IN new_id varchar(20) ,IN new_credit INT )
begin
update customers set
creditlimit=new_credit where customerNumber=new_id;
end ; //
call update_credit(103,27000);
select *from customers;
call update_credit(114,23000);
#<---------------------------new example update storage perocedure--------------->
delimiter &&
create procedure name_likes()
select customerName from customers where customerName like '%mini%';
end &&
delimiter ;
call name_likes();

# trigger in sql: it run automatically when changing have been made.
#data manupulation,data defination triger,
use advance_sql;
select *from marks;
drop table marks;
create table marks(
id int primary key auto_increment,
number int);
#now create triger here when you enter number less then 50 it automatically replace by 'fail';
delimiter //
create trigger mark_verify
before insert on marks
for each row 
if new.number < 50 then set new.number =0;
end if ; //
insert into marks(number)values(30),(40),(60),(70),(90),(56);
select *from marks;
# -----------------------another trigger example---------
#when customer_address is null it replaced to 'not available'
create table customer_address(
name varchar(30),
address varchar(40));
select *from customer_address;
delimiter //
create trigger check_address_checking
before insert on customer_address
for each row
if new.address='null' then set new.address='not available';
end  if; //
insert into customer_address(name,address) values('ali','null'),
('umer','gujrat'),('raza','null');
select *from customer_address;
# create trigger-------
# join two table and creating view.
use classicmodels;
select *from productlines;
select *from products;
create view productview
as select productcode ,productName,msrp,textdescription
from products as p inner join productLines as pl on p.productline = pl.productlines;
# out storage in table----------------------------
#< -----------------view function-------------->
create view productview
as select productcode ,productName,msrp,textdescription
from products as p inner join productLines as pl on p.productline = pl.productline;
select *from productview;
select *from products;
select *from productlines;
#< ---------------------window functio Rank function------------------>
#< rank mean when value same its have same rank for those same values.>
create table demo(num int not null);
insert into demo(num) values(2),(3),(3),(4),(5); 
select  num,
rank() over(order by num) as rank_num from demo;

#<-----------------------First value in database---------------------->
select *from payments;
select amount,checknumber,customerNumber, first_value(checkNumber) over(order  by amount desc) as heighest_amount from payments;
# partion by like department,customer nummber:
select amount,checknumber,customerNumber, first_value(checkNumber) over(partition by customerNumber order by amount desc) as heighest_amount from payments;
<#------------------------>
