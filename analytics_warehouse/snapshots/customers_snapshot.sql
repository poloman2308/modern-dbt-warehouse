{% snapshot customers_snapshot %}
{{
  config(
    target_schema='snapshots',
    unique_key='customer_id',
    strategy='timestamp',
    updated_at='updated_at'
  )
}}

select
    customer_id,
    first_name,
    last_name,
    email,
    created_at,
    updated_at
from {{ source('raw', 'customers') }}

{% endsnapshot %}
