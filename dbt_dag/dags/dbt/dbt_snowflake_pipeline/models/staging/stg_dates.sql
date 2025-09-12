{{ config(materialized='view') }}

with date_dim as (
    {{ dbt_date.get_date_dimension("2016-01-01", "2019-05-31") }}
)
select 
    *
from date_dim
