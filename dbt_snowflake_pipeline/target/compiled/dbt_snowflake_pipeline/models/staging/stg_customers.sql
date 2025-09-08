

with source as (
    select *
    from dbt_db.raw.customers
)

select
    customer_id,
    first_name,
    last_name,
    phone,
    email,
    street,
    city,
    state,
    zip_code
from source