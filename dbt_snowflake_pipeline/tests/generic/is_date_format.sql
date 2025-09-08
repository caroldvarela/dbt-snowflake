{% test is_date_format(model, column_name) %}

with validation as (

    select
        {{ column_name }} as date_value
    from {{ model }}

),

validation_errors as (

    select *
    from validation
    where date_value is not null
      and not regexp_like(date_value::string, '^[0-9]{4}-[0-9]{2}-[0-9]{2}$')

)

select * from validation_errors

{% endtest %}
