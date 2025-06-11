with orders as (
    select * from {{ ref('int_customer_orders') }}
),

products as (
    select * from {{ ref('stg_products') }}
)

select
    o.order_id,
    o.customer_id,
    o.first_name,
    o.last_name,
    o.email,
    p.product_name,
    p.category,
    o.quantity,
    p.price,
    o.quantity * p.price as total_price,
    o.status,
    o.order_date
from orders o
left join products p on o.product_id = p.product_id
