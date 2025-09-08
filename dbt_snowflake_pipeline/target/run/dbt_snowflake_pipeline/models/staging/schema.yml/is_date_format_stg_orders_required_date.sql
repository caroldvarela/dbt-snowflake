
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

with validation as (

    select
        required_date as date_value
    from dbt_db.dbt_schema.stg_orders

),

validation_errors as (

    select *
    from validation
    where date_value is not null
      and not regexp_like(date_value::string, '^[0-9]{4}-[0-9]{2}-[0-9]{2}$')

)

select * from validation_errors


  
  
      
    ) dbt_internal_test