{% macro bmi() %}
    ROUND(weight / (height * height), 2) AS bmi
{% endmacro %}
