{% macro percentage_change(a, b) %}
    (({{ b }} - {{ a }}) / NULLIF({{ a }}, 0)) * 100
{% endmacro %}
