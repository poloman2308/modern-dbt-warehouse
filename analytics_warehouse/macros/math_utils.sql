{#
  macro: safe_divide
  description: Safely divides two numbers, returns null if denominator is 0.
  meta:
    owner: Derek Acevedo
    category: "math"
    tags: ["math", "division", "error-handling"]
#}

{% macro safe_divide(numerator, denominator) %}
    case
        when {{ denominator }} = 0 then null
        else {{ numerator }} / {{ denominator }}
    end
{% endmacro %}
