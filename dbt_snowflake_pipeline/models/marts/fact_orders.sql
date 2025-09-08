{{ config(materialized='table') }}

select
    oi.order_id,
    o.customer_id,
    o.store_id,
    o.staff_id,
    oi.product_id,
    to_number(to_char(o.order_date, 'YYYYMMDD')) as order_date_id,
    to_number(to_char(o.shipped_date, 'YYYYMMDD')) as shipped_date_id,
    to_number(to_char(o.required_date, 'YYYYMMDD')) as required_date_id,
    oi.quantity,
    oi.list_price,
    oi.discount,
    {{ calculate_total('oi.list_price', 'oi.quantity', 'oi.discount') }} as total_amount,
    (oi.list_price * oi.quantity * oi.discount) as discount_amount,
    datediff(day, o.order_date, o.shipped_date) as shipping_delay
from {{ ref('stg_order_items') }} oi
join {{ ref('stg_orders') }} o on oi.order_id = o.order_id
