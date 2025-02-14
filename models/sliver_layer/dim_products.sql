{{ config(materialized='table') }}

with dim_product as (
SELECT distinct
  `Product ID` as product_id,
  Category as category,
  `Sub-Category`as sub_category,
  `Product Name` as product_name
FROM
  `sndqa-datastewards`.`bronzelayer`.`order_raw`
order by 2,3
)

  select 
    GENERATE_UUID() AS product_key,
    *
   from dim_product