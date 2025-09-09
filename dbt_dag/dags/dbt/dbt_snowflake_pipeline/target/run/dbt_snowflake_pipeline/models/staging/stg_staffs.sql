
  create or replace   view dbt_db.dbt_schema.stg_staffs
  
  
  
  
  as (
    

with source as (
    select *
    from dbt_db.raw.staffs
)

select
    staff_id,
    first_name,
    last_name,
    email,
    phone,
    active,
    store_id,
    case
        when manager_id in ('', 'NULL', 'null') then null
        else try_cast(manager_id as integer)
    end as manager_id
from source
  );

