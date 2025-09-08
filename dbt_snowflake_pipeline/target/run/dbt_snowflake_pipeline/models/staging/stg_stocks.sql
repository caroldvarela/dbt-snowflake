
  create or replace   view dbt_db.dbt_schema.stg_stocks
  
  
  
  
  as (
    

with source as (
    select *
    from dbt_db.raw.stocks
)

select
    store_id as store_id,
    product_id as product_id,
    quantity as quantity
from source
  );

