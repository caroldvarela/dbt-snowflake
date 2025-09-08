
  
    

create or replace transient table dbt_db.dbt_schema.dim_campaigns
    
    
    
    as (select
    md5(cast(coalesce(cast(campaign_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as campaign_sk,
    campaign_id,
    campaign_name,
    start_date,
    end_date,
    duration_days,
    total_budget
from dbt_db.dbt_schema.stg_campaigns
    )
;


  