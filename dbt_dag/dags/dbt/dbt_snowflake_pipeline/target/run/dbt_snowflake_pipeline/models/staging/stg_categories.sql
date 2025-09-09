
  create or replace   view dbt_db.dbt_schema.stg_categories
  
  
  
  
  as (
    

with source as (
    select *
    from dbt_db.raw.categories
)

select
    category_id,
    category_name
from source
  );

