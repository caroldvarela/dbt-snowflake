
    
    

select
    staff_id as unique_field,
    count(*) as n_records

from dbt_db.dbt_schema.stg_staffs
where staff_id is not null
group by staff_id
having count(*) > 1


