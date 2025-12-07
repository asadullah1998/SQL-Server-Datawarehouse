USE [Project]
GO

/****** Object:  Table [STG].[FactInvoice]    Script Date: 01-Oct-25 2:57:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE DWH.[FactInvoice](
		[ID] [int]						IDENTITY(1,1) NOT NULL,
		DimProductID					int NOT NULL,
		DimCustomerID					int NOT NULL,
		DimCountryID					int NOT NULL,
		DimDateKey						int NOT NULL,
		[IsCancelledFLG] [bit]			NULL,
		[IsBadDebtFLG] [bit]			NULL,
		[InvoiceNo] [nvarchar](8)		NULL,	
		[InvoiceTimestamp] [datetime]	NULL,

		[StockCode] [nvarchar](13)		NULL,
		
		[Quantity] [int]				NULL,
		[UnitPrice] [decimal](10, 2)	NULL,
		[LineTotal] [decimal](10, 2)	NULL,
		[LoadDateTime] [datetime]		NOT NULL default getdate(),

		--Foreign Keys
		CONSTRAINT FK_FactInvoice_DimProduct FOREIGN KEY (DimProductID) 
		REFERENCES DWH.DimProduct(ID),

		CONSTRAINT FK_FactInvoice_DimCustomer FOREIGN KEY (DimCustomerID) 
		REFERENCES DWH.DimCustomer(ID),

		CONSTRAINT FK_FactInvoice_DimCountry FOREIGN KEY (DimCountryID) 
		REFERENCES DWH.DimCountry(ID),

		CONSTRAINT FK_FactInvoice_DimDate FOREIGN KEY (DimDateKey) 
		REFERENCES DWH.DimDate(DateKey)
) ON [PRIMARY];
GO





