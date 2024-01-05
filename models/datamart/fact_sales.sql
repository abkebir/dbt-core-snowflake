with source as (
    select
        od.order_id,
        od.product_id,
        o.customer_id,
        o.employee_id,
        od.quantity,
        od.unit_price,
        od.discount,
        date(o.order_date) as order_date,
        o.paid_date,
        current_timestamp() as insertion_timestamp
    from {{ ref('orders') }} AS o
    left join {{ ref('order_details') }} AS od
    on od.order_details_id = o.order_id
    where od.order_id is not null
),
unique_source as (
    select *,
            row_number() over(partition by customer_id, employee_id, order_id, product_id, order_date order by order_date) as row_number
    from source
)
select
    order_id,
    product_id,
    customer_id,
    employee_id,
    quantity,
    unit_price,
    discount,
    order_date,
    paid_date,
    insertion_timestamp
from unique_source
where row_number = 1
