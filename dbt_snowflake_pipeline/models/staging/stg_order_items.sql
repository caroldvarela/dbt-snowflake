{{ config(materialized='view') }}

with source as (
    select *
    from {{ source('raw_data', 'order_items') }}
)

select
    order_id,
    item_id,
    product_id,
    quantity,
    list_price,
    discount
from source
