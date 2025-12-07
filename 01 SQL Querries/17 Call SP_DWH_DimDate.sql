EXEC DWH.SP_DimDate @StartDate = '2010-01-01', @EndDate = '2030-12-31';


select *
from dwh.dimdate