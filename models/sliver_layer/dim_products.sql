{{ config(materialized='table') }}

with dim_product as (
SELECT distinct
  product_id,
  category,
  sub_category,
  product_name
FROM
  {{ ref('stg_order') }}
order by 2,3
)

  select 
    GENERATE_UUID() AS product_key,
    *
   from dim_product