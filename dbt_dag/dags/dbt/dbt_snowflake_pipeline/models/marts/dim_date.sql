{{ config(materialized='table') }}

with base as (
    select * from {{ ref('stg_dates') }}
)

select
    to_number(to_char(date_day, 'YYYYMMDD')) as date_id,

    date_day as full_date,

    year_number       as year,
    month_of_year     as month,
    day_of_month      as day,
    week_of_year      as week,
    quarter_of_year   as quarter,

    day_of_week_name  as weekday_name,
    month_name        as month_name,

    case when day_of_week in (0,6) then true else false end as is_weekend
from base

