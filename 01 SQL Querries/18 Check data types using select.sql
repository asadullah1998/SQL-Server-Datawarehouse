
-- Columns and datatypes
SELECT 
    c.name AS ColumnName,
    t.name AS DataType,
    c.max_length,
    c.is_nullable,
    c.is_identity
FROM sys.columns c
JOIN sys.types t ON c.user_type_id = t.user_type_id
WHERE c.object_id = OBJECT_ID('STG.DimProduct');



-- For one procedure
SELECT OBJECT_DEFINITION(OBJECT_ID('STG.SP_DimCountry')) AS ProcedureDefinition;

-- Or using sys.sql_modules
SELECT sm.definition
FROM sys.sql_modules sm
JOIN sys.objects o ON sm.object_id = o.object_id
WHERE o.name = 'STG.SP_DimCountry';

drop table if exists DWH.DimCustomer
drop table if exists DWH.DimCountry
drop table if exists DWH.DimProduct


select top 0 *,getdate() as LoaddateTime into DWH.DimCustomer
from STG.DimCustomer

select top 0 * into DWH.DimCountry
from STG.DimCountry

select top 0 * into DWH.DimProduct
from STG.DimProduct