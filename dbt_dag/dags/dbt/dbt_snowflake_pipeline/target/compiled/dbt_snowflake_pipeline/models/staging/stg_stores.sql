

with source as (
    select *
    from dbt_db.raw.stores
)

select
    store_id,
    store_name,
    phone,
    email,
    street,
    city,
    state,
    zip_code
from source