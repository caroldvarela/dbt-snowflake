{{ config(materialized='view') }}

with source as (
    select *
    from {{ source('raw_data', 'categories') }}
)

select
    category_id,
    category_name
from source
