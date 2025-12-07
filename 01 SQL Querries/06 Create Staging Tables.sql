CREATE TABLE STG.FactInvoice (
    
	
	InvoiceNo          nvarchar(8),
    IsCancelledFLG     bit,
    IsBadDebtFLG       bit,
	StockCode		   nvarchar(13),
    Description		   nvarchar(40),
    InvoiceTimestamp   DATETIME,
    Quantity           INT,
    UnitPrice          DECIMAL(10,2),
	LineTotal          DECIMAL(10,2),
    CustomerID         nvarchar(6),
    Country            nvarchar(22)
);


drop table  STG.FactInvoice