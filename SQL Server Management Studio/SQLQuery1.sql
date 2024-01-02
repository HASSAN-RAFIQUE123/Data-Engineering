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



SELECT pp.Name from Production.Product as pp where pp.Name= 'Blade';


SELECT
    Product.Name AS ProductName,
    SUM(SalesOrderDetail.OrderQty) AS TotalQuantitySold
FROM Sales.SalesOrderDetail AS SalesOrderDetail
INNER JOIN Production.Product AS Product
    ON SalesOrderDetail.ProductID = Product.ProductID
GROUP BY ProductName= 'Blade';




