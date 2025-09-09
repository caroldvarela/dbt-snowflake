
  
    

create or replace transient table dbt_db.dbt_schema.dim_customer
    
    
    
    as (

select
    customer_id,
    first_name,
    last_name,
    first_name || ' ' || last_name as full_name,
    phone,
    email,
    street,
    city,
    state,
    zip_code
from dbt_db.dbt_schema.stg_customers
    )
;


  