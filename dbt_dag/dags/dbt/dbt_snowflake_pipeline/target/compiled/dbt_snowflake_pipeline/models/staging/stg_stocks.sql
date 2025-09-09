

with source as (
    select *
    from dbt_db.raw.stocks
)

select
    store_id as store_id,
    product_id as product_id,
    quantity as quantity
from source