{% macro convert_usd(amount_column, rate) %}
    ({{ amount_column }} * {{ rate }})
{% endmacro %}
