with source as (
    select * from {{ source('raw', 'customers') }}
)

select
    customer_id,
    lower(first_name) as first_name,
    lower(last_name) as last_name,
    lower(email) as email,
    created_at,
    updated_at
from source

