

with source as (
    select *
    from dbt_db.raw.orders
)

select
    order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    case
        when shipped_date in ('', 'NULL', 'null') then null
        else try_cast(shipped_date as date)
    end as shipped_date,
    store_id,
    staff_id
from source