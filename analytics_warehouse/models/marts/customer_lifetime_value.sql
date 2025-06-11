with order_details as (
    select * from {{ ref('int_order_details') }}
)

select
    customer_id,
    first_name,
    last_name,
    email,
    count(distinct order_id) as total_orders,
    sum(total_price) as total_revenue,
    min(order_date) as first_order_date,
    max(order_date) as last_order_date
from order_details
group by customer_id, first_name, last_name, email
order by total_revenue desc
