
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select first_name
from dbt_db.dbt_schema.stg_customers
where first_name is null



  
  
      
    ) dbt_internal_test