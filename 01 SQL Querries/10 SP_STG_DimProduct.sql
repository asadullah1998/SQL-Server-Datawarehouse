
Create  PROCEDURE STG.SP_DimProduct
AS
BEGIN
    SET NOCOUNT ON;

Truncate table STG.DimProduct;


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

insert into STG.DimProduct
select 
HASHBYTES('MD5', stockcode) AS ID,
stockcode, description 
from b 
where LengthRank = 1 



END;
GO

