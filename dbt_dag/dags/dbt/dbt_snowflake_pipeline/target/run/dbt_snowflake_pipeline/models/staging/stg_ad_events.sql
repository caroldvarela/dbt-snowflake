
  create or replace   view dbt_db.dbt_schema.stg_ad_events
  
  
  
  
  as (
    with source as (
    select *
    from dbt_db.raw.ad_events
)

select
    event_id,
    ad_id,
    user_id,
    timestamp as event_timestamp,
    day_of_week,
    time_of_day,
    event_type,
    date_part('hour', timestamp) as event_hour,
    case when day_of_week in ('Saturday','Sunday') then 1 else 0 end as is_weekend,
    case
        when time_of_day in ('Morning','Afternoon') then 'Day'
        else 'Night'
    end as day_period

from source
  );

