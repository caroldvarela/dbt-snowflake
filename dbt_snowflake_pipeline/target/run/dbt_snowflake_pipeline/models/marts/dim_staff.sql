
  
    

create or replace transient table dbt_db.dbt_schema.dim_staff
    
    
    
    as (

select
    staff_id,
    first_name,
    last_name,
    email,
    phone,
    active,
    store_id,
    manager_id
from dbt_db.dbt_schema.stg_staffs
    )
;


  