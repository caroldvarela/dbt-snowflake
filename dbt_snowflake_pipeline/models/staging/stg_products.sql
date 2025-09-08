{{ config(materialized='view') }}

with source as (
    select *
    from {{ source('raw_data', 'products') }}
)

select
    product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    list_price
from source
