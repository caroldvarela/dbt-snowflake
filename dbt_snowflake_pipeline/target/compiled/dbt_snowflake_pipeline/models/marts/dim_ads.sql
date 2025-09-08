select
    md5(cast(coalesce(cast(ad_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(campaign_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as ad_sk,
    ad_id,
    campaign_id,
    ad_platform,
    ad_type,
    target_gender,
    target_age_group,
    target_interest_tags
from dbt_db.dbt_schema.stg_ads