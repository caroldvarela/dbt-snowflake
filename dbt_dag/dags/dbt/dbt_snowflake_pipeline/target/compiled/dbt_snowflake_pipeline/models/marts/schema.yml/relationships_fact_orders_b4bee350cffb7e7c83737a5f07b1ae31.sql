
    
    

with child as (
    select shipped_date_id as from_field
    from dbt_db.dbt_schema.fact_orders
    where shipped_date_id is not null
),

parent as (
    select date_id as to_field
    from dbt_db.dbt_schema.dim_date
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


