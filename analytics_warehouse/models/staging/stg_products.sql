with source as (
    select * from {{ source('raw', 'products') }}
)

select
    product_id,
    initcap(product_name) as product_name,
    price,
    category,
    created_at
from source
