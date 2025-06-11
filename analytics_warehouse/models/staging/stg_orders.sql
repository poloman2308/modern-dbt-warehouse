with source as (
    select * from {{ source('raw', 'orders') }}
)

select
    order_id,
    customer_id,
    product_id,
    quantity,
    order_date,
    lower(status) as status
from source
