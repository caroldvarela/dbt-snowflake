with source as (
    select *
    from dbt_db.raw.users
),
parsed_interests as (
    select
        user_id,
        user_gender,
        user_age,
        age_group,
        country,
        location,
        split(interests, ',') as interest_tags
    from source
),
age_categorized as (
    select *,
        case 
            when user_age < 18 then 'Under_18'
            when user_age between 18 and 24 then '18_24'
            when user_age between 25 and 34 then '25_34'
            when user_age between 35 and 44 then '35_44'
            else '45_plus'
        end as age_category
    from parsed_interests
)
select *
from age_categorized