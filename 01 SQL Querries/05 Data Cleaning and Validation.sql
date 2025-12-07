--First we find everything that is wrong with this data
--9,291 such records with invoice number having character

SELECT  *
FROM lz.invoices
WHERE
-- This condition selects strings that contain at least one character
-- that is NOT a digit (0-9).
invoiceno LIKE '%[^0-9]%'
and quantity > 0

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


--There are 3 types of Invoice Numbers
SELECT  * --3
FROM lz.invoices
WHERE invoiceno LIKE 'A%' --Adjust bad debt

SELECT  * --9,288
FROM lz.invoices
WHERE invoiceno LIKE 'C%' --Change/Return/Manual/Bank Charges/Discount/AMAZON FEE/SAMPLES/POSTAGE


SELECT  count(1) --532,618 starts with a number
FROM lz.invoices
WHERE invoiceno LIKE '[0-9]%'


select count(1) --541,909
from lz.invoices

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SELECT  distinct description
FROM lz.invoices
WHERE invoiceno LIKE 'C%' --Change/Return/Manual/Bank Charges/Discount/AMAZON FEE/SAMPLES/POSTAGE
--and len(description) < 13
and len(stockCode) < 4


select *
from lz.invoices 
where invoiceNo = 'C541572'

select *
from lz.invoices 
where customerID = 15171.0



SELECT *
FROM lz.invoices
WHERE
	-- This condition selects strings that contain at least one character
	-- that is NOT a digit (0-9).
	stockcode LIKE '%[^0-9]%'
order by 2 ;

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

select *
from LZ.Invoices
where customerID is not null


--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--Finding business key
select InvoiceNo, StockCode, count(1)
from lz.Invoices 
group by InvoiceNo, StockCode
having count(1) > 1 


select *
from lz.Invoices 
where InvoiceNo + StockCode in (
									select InvoiceNo+StockCode
									from lz.Invoices 
									group by InvoiceNo, StockCode
									having count(1) > 1 
)
order by 1,2

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--which stock codes contain letters, try to find any pattern in them

select *
from lz.Invoices 
where StockCode LIKE '%[^0-9]%';

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- Testing all columns and trying to make sense of them

select distinct description  --4,197
from lz.Invoices

--does not make sense, but letting it go for now
select min(quantity) , max(quantity) , avg(quantity)---80995	80995    9
from lz.Invoices

select min(InvoiceDate) , max(InvoiceDate) --2010-12-01 08:26:00.000	2011-12-09 12:50:00.000
from lz.Invoices

select min(UnitPrice) , max(UnitPrice) , avg(UnitPrice)----11062.06	  38970.00	  4.611113
from lz.Invoices



--all are floats saved as nvarchar, should be 
SELECT *
FROM lz.invoices
WHERE
	convert(float,CustomerID ) LIKE '%[^0-9]%'


select distinct country  --38 distinct countries
from lz.Invoices


select max(len(stockcode)) from lz.Invoices
select max(len(InvoiceNo)) from lz.Invoices
select max(len(Description)) from lz.Invoices
select max(len(CustomerID)) from lz.Invoices --7 with decimal point
select max(len(Country)) from lz.Invoices --7 with decimal point
