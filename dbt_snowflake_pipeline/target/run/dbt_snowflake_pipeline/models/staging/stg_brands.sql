
  create or replace   view dbt_db.dbt_schema.stg_brands
  
  
  
  
  as (
    

with source as (
    select *
    from dbt_db.raw.brands
)

select
    brand_id,
    brand_name
from source
  );

