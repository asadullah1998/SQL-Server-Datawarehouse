select *
from dwh.dimproduct

select *
from dwh.dimdate 

select *
from dwh.dimcustomer 

select *
from dwh.dimcountry 

select *
from dwh.FactInvoice 

--exec DWH.SP_FactInvoices 

 select count(1) --530686
 from stg.factinvoice

select *
from stg.FactInvoice 
where InvoiceNo = '577334'

	
select *
from dwh.FactInvoice 
where InvoiceNo = '577334'

select *
from dwh.dimproduct 
where id in (1152
,5
,6
,651)

select *
from dwh.DimCustomer
where id = 2906

select *
from dwh.DimCountry
where id = 10

select min(DimDateKey), max(DimDateKey)
from dwh.FactInvoice 
