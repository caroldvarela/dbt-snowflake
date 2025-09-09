

with source as (
    select *
    from dbt_db.raw.brands
)

select
    brand_id,
    brand_name
from source