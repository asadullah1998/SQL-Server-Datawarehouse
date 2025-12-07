
Create Procedure DWH.SP_FactInvoices as
Begin


insert into DWH.FactInvoice (DimProductID
							 ,DimCustomerID
							 ,DimCountryID
							 ,DimDateKey
							 ,IsCancelledFLG
							 ,IsBadDebtFLG
							 ,InvoiceNo
							 ,InvoiceTimestamp
							 ,StockCode
							 ,Quantity
							 ,UnitPrice
							 ,LineTotal)

select	 coalesce(dpr.id, -1) as DimProductID
		,coalesce(dp.id, -1) as DimCustomerID
		,coalesce(dc.id, -1) as DimCountryID
		,coalesce(dd.datekey, -1) as DimDateKey
		,f.IsCancelledFLG
		,f.IsBadDebtFLG
		,f.InvoiceNo
		,f.InvoiceTimestamp
		,f.StockCode
		,f.Quantity
		,f.UnitPrice
		,f.LineTotal

from stg.factinvoice F left join dwh.DimCustomer dp on f.CustomerID = dp.CustomerID 
					   left join dwh.DimProduct dpr on f.stockCode = dpr.StockCode
					   left join dwh.DimCountry dc  on LTRIM(RTRIM(REPLACE(REPLACE(f.Country, CHAR(13), ''), CHAR(10), '') ))   = dc.CountryName
					   left join dwh.DimDate dd     on convert(Date,f.InvoiceTimestamp) = dd.FullDate


end