with order_details as (
    select * from {{ ref('int_order_details') }}
)

select
    order_date,
    category,
    status,
    sum(quantity) as total_items_sold,
    sum(total_price) as total_revenue_usd,
    {{ convert_usd('sum(total_price)', 0.92) }} as total_revenue_eur,
    {{ format_currency('sum(total_price)', '$') }} as formatted_usd,
    {{ is_high_value_order('sum(total_price)', 1000) }} as is_high_volume_day
from order_details
group by order_date, category, status
order by order_date, category
