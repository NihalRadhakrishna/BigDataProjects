create schema gold;

create view gold.final as 
select 
*
from openrowset(
    bulk 'https://olistdatastorage5000.dfs.core.windows.net/olistcontainer/silver/',
    format = 'parquet'
) as result1;

select * from gold.final;