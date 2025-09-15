{{ config(materialized='view') }}

with source as (
    select *
    from {{ source('raw_data', 'stores') }}
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
