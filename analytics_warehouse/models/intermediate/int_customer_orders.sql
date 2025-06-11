with customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
)

select
    o.order_id,
    o.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    o.product_id,
    o.quantity,
    o.status,
    o.order_date
from orders o
left join customers c on o.customer_id = c.customer_id
