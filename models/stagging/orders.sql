with source as (

    select * from {{ source('AIRBYTE_DATABASE', 'orders') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source