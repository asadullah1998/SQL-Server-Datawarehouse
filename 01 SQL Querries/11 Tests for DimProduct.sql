
--with a as(
--	select distinct StockCode, Description --5634
--	from stg.FactInvoice
--	)

	



--select distinct StockCode, Description
--from stg.FactInvoice
--where StockCode in (
--						select  stockcode 
--						from a 
--						group by StockCode
--						having count(1)>1
--)
--and len(Description)>6
--order by 1 
	

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


with a as(
	select distinct StockCode, Description --5634
	from stg.FactInvoice
	)

, b as(
			SELECT *, 
			DENSE_RANK() OVER (partition by stockcode    ORDER BY LEN(description) DESC, description asc /*description is added to break tie*/) AS LengthRank
			FROM a
		--order by StockCode 
)

, c as( --4014
select stockcode, description 
from b 
where LengthRank = 1 
)

select count(distinct stockcode ), count(1)
from c 

--select *
--from c 
--where StockCode in (

--					select  stockcode --3958
--					from c 
--					group by StockCode
--					having count(1)> 1
--)
--order by StockCode
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


exec [STG].[SP_DimProduct]

select top 10 *
from stg.dimproduct 
where id = 0xA7D3366468D757E899FE31819817FEE9