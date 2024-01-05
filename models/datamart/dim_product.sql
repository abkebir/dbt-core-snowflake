with source as (
   SELECT
    product_id,
    product_code,
    product_name,
    standard_cost,
    quantity_per_unit,
    category,
    current_timestamp() as insertion_timestamp
    from {{ ref('products') }}
),
unique_source as (
    select *,
            row_number() over(partition by product_id order by insertion_timestamp) as row_number
    from source
)
select 
    product_id,
    product_code,
    product_name,
    standard_cost,
    quantity_per_unit,
    category,
    insertion_timestamp
from unique_source
where row_number = 1
