select
ad_id,
campaign_id,
ad_platform,
ad_type,
target_gender,
target_age_group,
split(target_interests, ',') as target_interest_tags
from dbt_db.raw.ads