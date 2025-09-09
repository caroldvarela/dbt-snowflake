with dates as (
    select distinct date_trunc('day', event_timestamp) as date
    from dbt_db.dbt_schema.stg_ad_events
)
select
    to_number(to_char(date, 'YYYYMMDD')) as date_id,
    TO_CHAR(date, 'YYYY-MM-DD') as full_date,
    date_part(year, date) as year,
    date_part(month, date) as month,
    date_part(day, date) as day,
    date_part(week, date) as week_of_year,
    case when date_part(dow, date) in (0,6) then 1 else 0 end as is_weekend,
    trim(to_char(date, 'Day')) as day_name,
    trim(to_char(date, 'Month')) as month_name
from dates
order by date