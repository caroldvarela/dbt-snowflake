{{ 
    config(
        materialized='table'
    ) 
}}

with date_spine as (
    {{ dbt_utils.date_spine(
        start_date="'2016-01-01'",
        end_date="'2018-12-31'",
        datepart="day"
    ) }}
),

expanded as (
    select
        to_number(to_char(date_day, 'YYYYMMDD')) as date_id,
        date_day as full_date,
        extract(year from date_day) as year,
        extract(month from date_day) as month,
        extract(day from date_day) as day,
        extract(week from date_day) as week,
        extract(doy from date_day) as day_of_year,
        to_char(date_day, 'DY') as weekday_name,
        case when extract(dow from date_day) in (0,6) then true else false end as is_weekend,
        ceil(extract(month from date_day)/3.0) as quarter
    from date_spine
)

select * from expanded
