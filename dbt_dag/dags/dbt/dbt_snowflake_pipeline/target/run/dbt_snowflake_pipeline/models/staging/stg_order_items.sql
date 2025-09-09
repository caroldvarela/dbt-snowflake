
  create or replace   view dbt_db.dbt_schema.stg_order_items
  
  
  
  
  as (
    

with source as (
    select *
    from dbt_db.raw.order_items
)

select
    order_id,
    item_id,
    product_id,
    quantity,
    list_price,
    discount
from source
  );

