{{ config(materialized='table') }}

select
    store_id,
    store_name,
    phone,
    email,
    street,
    city,
    state,
    zip_code
from {{ ref('stg_stores') }}
