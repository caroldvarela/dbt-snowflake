
  create or replace   view dbt_db.dbt_schema.stg_products
  
  
  
  
  as (
    

with source as (
    select *
    from dbt_db.raw.products
)

select
    product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    list_price
from source
  );

