SELECT top 100* 
from openrowset(
    bulk 'https://olistdatastorage5000.dfs.core.windows.net/olistcontainer/silver',
    format = 'parquet'
)
as result