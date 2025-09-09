
    
    

select
    brand_id as unique_field,
    count(*) as n_records

from dbt_db.dbt_schema.stg_brands
where brand_id is not null
group by brand_id
having count(*) > 1


