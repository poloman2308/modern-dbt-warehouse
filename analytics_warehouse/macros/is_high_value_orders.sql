{# 
  macro: convert_usd
  description: Returns a boolean if the amount exceeds a dynamic threshold.
  meta:
    owner: Derek Acevedo
    category: "threshold"
    tags: ["dynamic_threshold", "boolean"]
#}

{% macro is_high_value_order(amount_column, threshold) %}
    ({{ amount_column }} > {{ threshold }})
{% endmacro %}
