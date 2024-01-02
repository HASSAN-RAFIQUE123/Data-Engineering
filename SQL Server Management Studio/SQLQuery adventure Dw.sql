use AdventureWorksDW2022;
/*What is the total amount of internet sales to customers from Ontario in the 39th week of 2012?
Write the number and 
paste the full SQL query.*/
select *from dbo.FactInternetSales;
select sum(fis.SalesAmount) as Toatl_sale_39_ontario from dbo.FactInternetSales as fis
inner Join
dbo.DimGeography as g
ON
fis.SalesTerritoryKey=g.SalesTerritoryKey
inner join 
dbo.DimDate as dd
ON
dd.DateKey=fis.OrderDateKey
where g.City like 'ont%' and dd.WeekNumberOfYear='39' and dd.CalendarYear='2012';


select *from dbo.DimGeography as g where g.City like 'ont%';
select *from dbo.DimGeography ;
select *from dbo.DimDate as dd where dd.WeekNumberOfYear=39 and dd.CalendarYear=2012;

