{{ config(materialized='table') }}

with distinct_status as (
    select distinct order_status as order_status_id
    from {{ ref('stg_orders') }}
)

select
    order_status_id,
    case order_status_id
        when 1 then 'Pending'
        when 2 then 'Processing'
        when 3 then 'Rejected'
        when 4 then 'Completed'
    end as order_status_name
from distinct_status

