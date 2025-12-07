

Alter  PROCEDURE STG.SP_DimCustomer
AS
BEGIN
    SET NOCOUNT ON;

Truncate table STG.DimCustomer;

insert into STG.DimCustomer

select distinct HASHBYTES('MD5', CustomerID) AS ID,
CustomerID
from stg.FactInvoice



END;
GO
