select
    md5(cast(coalesce(cast(user_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as user_sk,
    user_id,
    user_gender,
    user_age,
    age_group,
    age_category,
    country,
    location,
    interest_tags
from dbt_db.dbt_schema.stg_users