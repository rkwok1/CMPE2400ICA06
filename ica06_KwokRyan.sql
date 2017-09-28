--ica 6 Ryan kwok--

--q1--
declare @lowerBound float = 17.45
declare @upperBound float = 19.45

select ProductName as 'Product Name', UnitPrice as UnitPrice from Products
where UnitPrice between @lowerBound and @upperBound --Use between operator if you cannot use mathematical operators
go

--q2--
declare @costLower float = 1150
declare @costUpper float = 5000

select ProductName as 'Product Name', UnitPrice as 'Unit Price', ReorderLevel as 'Reorder Level', (ReorderLevel * UnitPrice) as 'Reorder Cost' from Products
where (ReorderLevel * UnitPrice) between @costLower and @costUpper
go

--q3--

declare @wordEnd nvarchar(max) = 'ade'

select ProductName as 'Product Name', QuantityPerUnit as 'Quantity Per Unit' from Products
where (ProductName like '%'+ @wordEnd) --'%' means anything at the end of a word
order by ProductName --orders alphabetically based on column specified
go

--q4--
declare @discountMin float = 1375

select UnitPrice as 'Unit Price', Quantity, Discount, ((UnitPrice*Quantity)*Discount) as 'Discount Value' from [Order Details] --Must be in [] as there is a space in it
where Discount <= 1.0 and ((UnitPrice*Quantity)*Discount) >= @discountMin
order by ((UnitPrice*Quantity)*Discount) desc --Most to least expensive
go

--q5--

select Country, City, CompanyName as 'Company name'from Customers
where Phone like '([159]__)%' --Underlines first character must be one of these three, the second and third character can be anything
order by Country, City --orders by City within countries
go

--q6--
select CustomerID, OrderID, DATEDIFF(DAY,RequiredDate, ShippedDate) as 'Delay Days' from Orders
where DATEDIFF(DAY,RequiredDate, ShippedDate) > 7 and CustomerID like '[^m-z]%' --Does NOT start with letters between m-z
order by DATEDIFF(DAY,RequiredDate, ShippedDate) asc
go

--q7--
select CompanyName as 'Company Name', City, PostalCode as 'Postal Code' from Customers
where PostalCode like '[a-z][a-z,0-9]%'
go

--q8--
select Distinct Discount as 'Discount' from [Order Details] --Distinct allows you to only us values that are unique from each other
order by Discount desc
go

--q9--
declare @max float = 20

select Distinct ProductID, Round((Quantity * UnitPrice) * (1 - discount), 0) as 'Value' from [Order Details]
where Round((Quantity * UnitPrice) * (1 - discount), 0) < @max and (Quantity * UnitPrice) * (1 - discount) = Round((Quantity * UnitPrice) * (1 - discount), 0)
order by [Value] desc, ProductID desc --Value represents whats in your select statement alias 'value'