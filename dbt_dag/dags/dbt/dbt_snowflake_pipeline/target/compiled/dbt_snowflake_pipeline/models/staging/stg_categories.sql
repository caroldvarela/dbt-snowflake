

with source as (
    select *
    from dbt_db.raw.categories
)

select
    category_id,
    category_name
from source