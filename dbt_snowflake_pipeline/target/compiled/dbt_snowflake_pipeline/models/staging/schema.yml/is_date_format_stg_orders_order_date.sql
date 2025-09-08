

with validation as (

    select
        order_date as date_value
    from dbt_db.dbt_schema.stg_orders

),

validation_errors as (

    select *
    from validation
    where date_value is not null
      and not regexp_like(date_value::string, '^[0-9]{4}-[0-9]{2}-[0-9]{2}$')

)

select * from validation_errors

