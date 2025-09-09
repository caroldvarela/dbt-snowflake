

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