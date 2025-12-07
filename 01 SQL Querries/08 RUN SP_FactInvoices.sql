exec STG.SP_FactInvoice

select count(1)
from lz.Invoices

select count(1)
from stg.FactInvoice

--select InvoiceNo, StockCode, count(1)
--from ##temp2 
--group by InvoiceNo, StockCode
--having count(1) > 1 

--select *
--from ##temp2
--where InvoiceNo + StockCode in (
--									select InvoiceNo+StockCode
--									from STG.FactInvoice 
--									group by InvoiceNo, StockCode
--									having count(1) > 1 
--)
--order by 1,4