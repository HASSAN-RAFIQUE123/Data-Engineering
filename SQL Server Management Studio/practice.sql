use Northwind;
Select *from dbo.Categories;
Select *from dbo.Products;
select count(Products.ProductName) from dbo.Products;

use AdventureWorks2008;
select * from Person.Person;
select * from Sales.SalesPerson;
select * from Sales.SalesOrderHeader;



C:\Users\HASSAN\AppData\Local\Temp\~vs350E.sql

/* sum of total order first and last name*/
SELECT Top 2 pp.FirstName,pp.LastName,
ROUND(SUM(soh.TotalDue), 2) AS TotalSales FROM Person.Person pp
JOIN Sales.SalesOrderHeader soh ON soh.SalesPersonID = pp.BusinessEntityID
GROUP BY pp.FirstName,pp.LastName
ORDER BY TotalSales DESC;


/*inner join category id from both table and print product name and category as according to product

Inner join

select column from table_a
{{{inner join}}} table_b 
{{ON}} 
table_a.col_name ==table_b.col_name 
.*/
select p.ProductName,c.CategoryName from dbo.Products as p
inner join Categories as c
ON
p.CategoryID=c.CategoryID;

/* print all data*/

select * from dbo.Products as p
inner join Categories as c
ON
p.CategoryID=c.CategoryID;


select * from dbo.[Order Details];
/* maximum unit price with product ID*/
select max(od.UnitPrice) from dbo.[Order Details] as od;

/*Case statement
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;
*/

select od.Sum,
case
	when od.sum>100 AND od.sum<150 then 'Good' 
	when od.sum>150 then 'V.Good'
	Else 'Bad'
End AS markes
from dbo.[Order Details] as od;

/*  From the following table write a query in SQL to return all rows from the salesorderheader 
table in Adventureworks database 
and calculate the percentage of tax on the subtotal have decided.
Return salesorderid, customerid, orderdate, subtotal, percentage of tax column. 
Arranged the result set in ascending order on subtotal.*/
/* Devision operator*/

use AdventureWorks2008;
select ss.SalesOrderID ,ss.CustomerID, ss.OrderDate, ss.SubTotal,
Round(ss.SubTotal/ss.TaxAmt,2) as TaxPercentage from Sales.SalesOrderHeader as ss;

/*Count unique customer id*/
select count(ss.CustomerID) from Sales.SalesOrderHeader as ss;
select count(DISTINCT(ss.CustomerID)) as Orignal_ID from Sales.SalesOrderHeader as ss;

/* subtotal with group by cutomer id  */
select ssh.CustomerID,sum(ssh.SubTotal) as TotalSum from Sales.SalesOrderHeader as ssh 
group by ssh.CustomerID
Order by TotalSum DESC;

/* calculate the max subtotal with group by cutomer id  */
select TOP 1 ssh.CustomerID,sum(ssh.SubTotal) as TotalSum from Sales.SalesOrderHeader as ssh 
group by ssh.CustomerID
Order by TotalSum DESC;

/*  From the following table write a query in SQL to find the average and 
the sum of the subtotal for every customer. Return customerid, average and 
sum of the subtotal. Grouped the result on customerid and salespersonid. 
Sort the result on customerid column in descending order.*/
use AdventureWorks2008
select * from Sales.SalesOrderHeader;
select soh.CustomerID,avg(soh.SubTotal) as avg_subtotal,sum(soh.SubTotal) as sum_total from Sales.SalesOrderHeader as soh
group by soh.CustomerID,soh.SalesPersonID
order by soh.CustomerID Desc;

/*From the following tables write a query in SQL to find the persons whose last name starts with letter 'L'.
Return BusinessEntityID, FirstName, LastName, and PhoneNumber. Sort the result on lastname and firstname.*/
select * from Person.Person;
select * from Person.PersonPhone;

Select pp.BusinessEntityID,pp.FirstName,pp.LastName,ppp.PhoneNumber from Person.Person as pp
inner join Person.PersonPhone as ppp
ON pp.BusinessEntityID=ppp.BusinessEntityID
WHERE pp.LastName LIKE 'L%' AND pp.FirstName LIKE 'A%';


/*From the following table write a query in SQL to find the total quantity for each locationid and 
calculate the grand-total for all locations. 
Return locationid and total quantity. Group the results on locationid.*/
select * from Production.ProductInventory;
select ppi.LocationID, sum(ppi.Quantity) as Total_Quantity from Production.ProductInventory as ppi
group by ppi.LocationID;


/* From the following table write a query in SQL to retrieve the total sales for each year.
Filter the result set for those orders where order year is on or before 2016. 
Return the year part of orderdate and total due amount. 
Sort the result in ascending order on year part of order date.*/
select * from Sales.SalesOrderHeader;
select year(sso.OrderDate) as order_year,sum(sso.TotalDue) as sum_TotalDue from Sales.SalesOrderHeader as sso
where year(sso.OrderDate) <= '2016'
group by year(sso.OrderDate)
order by year(sso.OrderDate) ASC;

/*
From the following tables write a query in SQL to make a list of contacts who are designated as 'Purchasing Manager'. 
Return 
BusinessEntityID, LastName, and FirstName columns. Sort the result set in ascending order of LastName, and FirstName.
*/
select * from Person.ContactType;
select * from Person.Person;
select * from Person.BusinessEntityContact;

select pp.BusinessEntityID,pp.LastName,pp.FirstName from Person.Person as pp
inner join 
Person.BusinessEntityContact as pbec
ON
pp.BusinessEntityID=pbec.BusinessEntityID
inner Join 
Person.ContactType as pc 
ON 
pbec.ContactTypeID=pc.ContactTypeID
where pc.Name='Purchasing Manager';
/*
From the following table write a query in SQL to find the sum, average, count, 
minimum, and maximum order quentity for those orders whose id are 43659 and 43664. Return SalesOrderID, 
ProductID, OrderQty, sum, average, count, max, and min order quantity.*/
select sod.SalesOrderID ,sod.ProductID,sod.OrderQty,max(sod.OrderQty) as max_qty ,
avg(sod.OrderQty)as avg_order,
min(sod.OrderQty) as min_qty
from Sales.SalesOrderDetail as sod
where sod.SalesOrderID IN (43659,43664)
group by sod.SalesOrderID,sod.OrderQty,sod.ProductID

/*From the following table write a query in SQL to retrieve the total cost of each salesorderID that exceeds 100000. 
Return SalesOrderID, total cost.*/
select * from Sales.SalesOrderDetail;

/*What is the average sales per customers?* cus first name and last name*/
select * from Sales.SalesPerson;
select * from Sales.Customer;


