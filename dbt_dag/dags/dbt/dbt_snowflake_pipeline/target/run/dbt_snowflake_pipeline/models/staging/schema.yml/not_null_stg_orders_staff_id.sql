
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select staff_id
from dbt_db.dbt_schema.stg_orders
where staff_id is null



  
  
      
    ) dbt_internal_test