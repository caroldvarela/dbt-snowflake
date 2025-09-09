with base as (
    select
        e.event_id,
        e.event_timestamp,
        e.event_type,
        u.user_sk,
        a.ad_sk,
        a.campaign_id
    from dbt_db.dbt_schema.stg_ad_events e
    left join dbt_db.dbt_schema.dim_users u on e.user_id = u.user_id
    left join dbt_db.dbt_schema.dim_ads a on e.ad_id = a.ad_id
)
select
    campaign_id,
    ad_sk,
    user_sk,
    to_char(date_trunc('day', event_timestamp), 'YYYYMMDD')::int as date_id,
    extract(hour from event_timestamp) as time_id,
    count(*) as event_count,
    
    sum(case when event_type = 'Like' then 1 else 0 end)
 as total_likes,
    
    sum(case when event_type = 'Share' then 1 else 0 end)
 as total_shares,
    
    sum(case when event_type = 'Impression' then 1 else 0 end)
 as total_impressions,
    
    sum(case when event_type = 'Purchase' then 1 else 0 end)
 as total_purchases,
    
    sum(case when event_type = 'Click' then 1 else 0 end)
 as total_clicks,
    
    sum(case when event_type = 'Comment' then 1 else 0 end)
 as total_comments
from base
group by 1,2,3,4,5