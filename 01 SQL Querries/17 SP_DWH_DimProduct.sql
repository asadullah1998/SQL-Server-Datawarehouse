--CREATE OR ALTER PROCEDURE DWH.SP_DimProduct
   
--AS
--BEGIN

	insert into  dwh.dimProduct

	select *
	from stg.dimproduct 
	where not exists id in dwh.dimproduct



--END;
--GO