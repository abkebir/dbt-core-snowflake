with source as (

    select * from {{ source('AIRBYTE_DATABASE', 'order_details') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source