

select
    p.product_id,
    p.product_name,
    p.model_year,
    p.list_price,
    b.brand_name,
    c.category_name
from dbt_db.dbt_schema.stg_products p
left join dbt_db.dbt_schema.stg_brands b on p.brand_id = b.brand_id
left join dbt_db.dbt_schema.stg_categories c on p.category_id = c.category_id