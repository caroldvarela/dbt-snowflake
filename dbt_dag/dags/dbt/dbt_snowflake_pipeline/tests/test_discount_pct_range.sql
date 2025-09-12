select *
from {{ ref('fact_orders') }}
where discount < 0
   or discount > 1
   or discount is null