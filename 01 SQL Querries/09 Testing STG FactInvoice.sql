--First we find everything that is wrong with this data
--9,104 such records with invoice number having character

SELECT  *
FROM STG.FactInvoice
WHERE
-- This condition selects strings that contain at least one character
-- that is NOT a digit (0-9).
invoiceno LIKE '%[^0-9]%'

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


--There are 3 types of Invoice Numbers
SELECT  * --3
FROM STG.FactInvoice
WHERE invoiceno LIKE 'A%' --Adjust bad debt

SELECT  * --9,101
FROM STG.FactInvoice
WHERE invoiceno LIKE 'C%' --Change/Return/Manual/Bank Charges/Discount/AMAZON FEE/SAMPLES/POSTAGE


SELECT  count(1) --521582 starts with a number
FROM STG.FactInvoice
WHERE invoiceno LIKE '[0-9]%'


select count(1) --530686
from STG.FactInvoice

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SELECT  distinct description
FROM STG.FactInvoice
WHERE invoiceno LIKE 'C%' --Change/Return/Manual/Bank Charges/Discount/AMAZON FEE/SAMPLES/POSTAGE
--and len(description) < 13
and len(stockCode) < 4


select *
from STG.FactInvoice 
where invoiceNo = 'C541572'

select *
from STG.FactInvoice 
where customerID = 15171.0



SELECT *
FROM STG.FactInvoice
WHERE
	-- This condition selects strings that contain at least one character
	-- that is NOT a digit (0-9).
	stockcode LIKE '%[^0-9]%'
order by 2 ;

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

select *
from STG.FactInvoice
where customerID is not null


--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--Finding business key
select InvoiceNo, StockCode, count(1)
from STG.FactInvoice 
group by InvoiceNo, StockCode
having count(1) > 1 


select *
from STG.FactInvoice 
where InvoiceNo + StockCode in (
									select InvoiceNo+StockCode
									from STG.FactInvoice 
									group by InvoiceNo, StockCode
									having count(1) > 1 
)
order by 1,2

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--which stock codes contain letters, try to find any pattern in them

select *
from STG.FactInvoice 
where StockCode LIKE '%[^0-9]%';

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- Testing all columns and trying to make sense of them

select distinct description  --4,197
from STG.FactInvoice

--does not make sense, but letting it go for now
select min(quantity) , max(quantity) , avg(quantity)---80995	80995    9
from STG.FactInvoice

select min(InvoiceDate) , max(InvoiceDate) --2010-12-01 08:26:00.000	2011-12-09 12:50:00.000
from STG.FactInvoice

select min(UnitPrice) , max(UnitPrice) , avg(UnitPrice)----11062.06	  38970.00	  4.611113
from STG.FactInvoice



--all are floats saved as nvarchar, should be 
SELECT *
FROM STG.FactInvoice
WHERE
	convert(float,CustomerID ) LIKE '%[^0-9]%'


select distinct country  --38 distinct countries
from STG.FactInvoice


select max(len(stockcode)) from STG.FactInvoice
select max(len(InvoiceNo)) from STG.FactInvoice
select max(len(Description)) from STG.FactInvoice
select max(len(CustomerID)) from STG.FactInvoice --7 with decimal point
select max(len(Country)) from STG.FactInvoice --7 with decimal point
