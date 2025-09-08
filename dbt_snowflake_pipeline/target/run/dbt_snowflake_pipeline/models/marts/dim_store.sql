
  
    

create or replace transient table dbt_db.dbt_schema.dim_store
    
    
    
    as (

select
    store_id,
    store_name,
    phone,
    email,
    street,
    city,
    state,
    zip_code
from dbt_db.dbt_schema.stg_stores
    )
;


  