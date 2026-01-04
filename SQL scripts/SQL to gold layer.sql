CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'uaY4L)52j89&';

CREATE DATABASE SCOPED CREDENTIAL nihalr5000 WITH IDENTITY = 'Managed Identity';

select * from sys.database_credentials;

CREATE EXTERNAL FILE FORMAT extfileformat WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);

CREATE EXTERNAL DATA SOURCE silverlayer WITH (
    LOCATION = 'https://olistdatastorage5000.dfs.core.windows.net/olistcontainer/gold/',
    CREDENTIAL = nihalr5000
);

CREATE EXTERNAL TABLE gold.finaltable WITH (
        LOCATION = 'Serving',
        DATA_SOURCE = silverlayer,
        FILE_FORMAT = extfileformat
) AS
SELECT * FROM gold.final2;

select * from gold.finaltable;