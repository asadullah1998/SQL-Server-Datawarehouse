
Alter  PROCEDURE STG.SP_FactInvoice
AS
BEGIN
    SET NOCOUNT ON;

    


	--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	--Step 1: Make everything consistent 
	drop table if exists ##temp1 
	drop table if exists ##temp2 
	
	select InvoiceNo,
		case when InvoiceNo LIKE 'C%'  then 1 else 0 end IsCancelledFLG,
		case when InvoiceNo LIKE 'A%'  then 1 else 0 end IsBadDebtFLG,
		StockCode,
		isnull(Description,'N/A') as [Description],
		InvoiceDate as InvoiceTimestamp,
		Quantity,
		UnitPrice,
		--Quantity*UnitPrice as LineTotal,
		--case when cast(left(customerid,5) as int) is null then -1 else cast(left(customerid,5) as int) end CustomerID, --Represents missing Value
		isnull( cast(left(customerid,5) as int), -1)  CustomerID, --Represents missing Value
		
		--customerid,
		Country
	into ##temp1
	from lz.Invoices
   where InvoiceDate < getdate() --removing future dated invoices
   and InvoiceNo is not null --Removing records where business key is null
   and StockCode is not null --Removing records where business key is null
   
   --select top 10 *
	--from ##temp1


   --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   --Step2: Fix duplicate business key issue
   -- If there was a single item with differenct quanities, but same unit price as seperate line item then we add those quantities, because that is common barcode scannng error
   --but if the unit price is seperate then we need to remove these records, as they distort our business key
    
   select  
		 InvoiceNo          
		,IsCancelledFLG     
		,IsBadDebtFLG       
		,StockCode		   
		,Description		   
		,InvoiceTimestamp   
		,sum(Quantity   ) as    Quantity     
		,UnitPrice     as      UnitPrice
		,CustomerID         
		,Country   

   into ##temp2
   from ##temp1
   group by 
    InvoiceNo        
   ,IsCancelledFLG   
   ,IsBadDebtFLG     
   ,StockCode		  
   ,Description		
   ,InvoiceTimestamp 
   ,UnitPrice          
   ,CustomerID         
   ,Country  

     --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   --Step3: Remove duplicates

   TRUNCATE TABLE STG.FactInvoice;

    -- Insert cleaned data into staging
    INSERT INTO STG.FactInvoice (
		InvoiceNo          
		,IsCancelledFLG     
		,IsBadDebtFLG       
		,StockCode		   
		,Description		   
		,InvoiceTimestamp   
		,Quantity           
		,UnitPrice          
		,LineTotal          
		,CustomerID         
		,Country            
    )
  select InvoiceNo          
		,IsCancelledFLG     
		,IsBadDebtFLG       
		,StockCode		   
		,Description		   
		,InvoiceTimestamp   
		,Quantity           
		,UnitPrice          
		   ,Quantity   *  UnitPrice   as      LineTotal 
		,CustomerID         
		,Country 
from ##temp2
where InvoiceNo + StockCode not in (
									select InvoiceNo+StockCode
									from ##temp2
									group by InvoiceNo, StockCode
									having count(1) > 1 
)


END;
GO

