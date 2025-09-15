{{ config(materialized='view') }}

with source as (
    select *
    from {{ source('raw_data', 'brands') }}
)

select
    brand_id,
    brand_name
from source
