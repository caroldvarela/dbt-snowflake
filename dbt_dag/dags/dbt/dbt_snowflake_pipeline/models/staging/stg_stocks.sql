{{ config(materialized='view') }}

with source as (
    select *
    from {{ source('raw_data', 'stocks') }}
)

select
    store_id as store_id,
    product_id as product_id,
    quantity as quantity
from source
