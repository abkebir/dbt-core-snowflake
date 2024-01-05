with source as (
    SELECT
        customer_id,
        company,
        last_name,
        first_name,
        email_address,
        job_title,
        mobile_phone,
        address,
        city,
        state_province,
        zip_postal_code,
        country_region,
        current_timestamp() as insertion_timestamp
    from {{ ref('customers') }}
),
unique_source as (
    select *,
        row_number() over(partition by customer_id order by insertion_timestamp) as row_number
    from source
)
select 
    customer_id,
    company,
    last_name,
    first_name,
    email_address,
    job_title,
    mobile_phone,
    address,
    city,
    state_province,
    zip_postal_code,
    country_region,
    insertion_timestamp
from unique_source
where row_number = 1
