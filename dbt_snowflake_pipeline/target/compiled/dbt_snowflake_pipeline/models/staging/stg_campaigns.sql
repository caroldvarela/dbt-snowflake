select
    campaign_id,
    name as campaign_name,
    start_date,
    end_date,
    duration_days,
    total_budget
from dbt_db.raw.campaigns