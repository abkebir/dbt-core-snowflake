with source as (
    select
        c.customer_id,
        c.company         as customer_company,
        c.last_name       as customer_last_name,
        c.first_name      as customer_first_name,
        c.email_address   as customer_email_address,
        c.job_title       as customer_job_title,
        c.mobile_phone    as customer_mobile_phone,
        c.address         as customer_address,
        c.city            as customer_city,
        c.state_province  as customer_state_province,
        c.zip_postal_code as customer_zip_postal_code,
        c.country_region  as customer_country_region,
        e.employee_id,
        e.last_name       as employee_unique_employee_id,
        e.company         as employee_company,
        e.last_name       as employee_last_name,
        e.first_name      as employee_first_name,
        e.email_address   as employee_email_address,
        e.job_title       as employee_job_title,
        e.mobile_phone    as employee_mobile_phone,
        e.address         as employee_address,
        e.city            as employee_city,
        e.state_province  as employee_state_province,
        e.zip_postal_code as employee_zip_postal_code,
        e.country_region  as employee_country_region,
        p.product_id,
        p.product_code,
        p.product_name,
        p.standard_cost,
        p.quantity_per_unit,
        p.category,
        s.order_id,
        s.quantity,
        s.unit_price,
        s.discount,
        s.order_date,
        s.paid_date,
        current_timestamp() as insertion_timestamp
    from {{ ref('fact_sales') }}  AS s
    left join {{ ref('dim_customer') }} AS c
    on c.customer_id = s.customer_id
    left join {{ ref('dim_employee') }} AS e
    on e.employee_id = s.employee_id
    left join {{ ref('dim_product') }} AS p
    on p.product_id = s.product_id
)
select *
from source
