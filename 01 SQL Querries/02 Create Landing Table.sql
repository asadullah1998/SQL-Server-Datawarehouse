CREATE TABLE LZ.Invoices (
    InvoiceNo     nvarchar(max),
    StockCode     nvarchar(max),
    Description   nvarchar(max),
    Quantity      INT,
    InvoiceDate   DATETIME,
    UnitPrice     DECIMAL(10,2),
    CustomerID    nvarchar(max),
    Country       nvarchar(max)
);
