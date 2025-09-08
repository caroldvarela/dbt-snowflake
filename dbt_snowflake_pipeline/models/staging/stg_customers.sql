{{ config(materialized='view') }}

with source as (
    select *
    from {{ source('raw_data', 'customers') }}
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
