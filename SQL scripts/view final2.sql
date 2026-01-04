create view gold.final2 as 
select * 
from openrowset(
    bulk 'https://olistdatastorage5000.dfs.core.windows.net/olistcontainer/silver/',
    format = 'parquet'
) as result2
where order_status = 'delivered';

select * from gold.final2;