{% macro calculate_total(list_price, quantity, discount) %}
    ({{ list_price }} * {{ quantity }} * (1 - {{ discount }}))
{% endmacro %}
