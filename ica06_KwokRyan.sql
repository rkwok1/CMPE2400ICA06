--ica 6 Ryan kwok--

--q1--
declare @lowerBound float = 17.45
declare @upperBound float = 19.45

select ProductName as 'Product Name', UnitPrice as UnitPrice from Products
where UnitPrice between @lowerBound and @upperBound --Use between operator if you cannot use mathematical operators
go