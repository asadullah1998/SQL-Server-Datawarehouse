
Create procedure LZ.Invoices_Data_Load
AS
BEGIN

Truncate table LZ.Invoices;


BULK INSERT LZ.Invoices
FROM 'C:\Users\helpdesk\Desktop\Project Case Study\00 online_retail.csv\online_retail.csv' 
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,              -- skip header row
    FIELDTERMINATOR = ',',     -- CSV delimiter
    ROWTERMINATOR = '0x0a',    -- newline
    TABLOCK
);

END
GO

