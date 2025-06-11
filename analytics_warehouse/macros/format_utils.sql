{# 
  macro: convert_usd
  description: Converts a given amount in USD to a target currency using a rate.
  meta:
    owner: Derek Acevedo
    category: "currency"
    tags: ["finance", "conversion", "revenue"]
#}

{% macro format_currency(amount_column, symbol) %}
    concat('{{ symbol }}', to_char({{ amount_column }}::numeric, 'FM999G999G999D00'))
{% endmacro %}
