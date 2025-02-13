
with fact_sales as (
SELECT 
  `Product ID` as product_id,
  `Order ID` as order_id,
  `Customer ID` as customer_id,
  `Postal Code` as geo_id,
   sales,
   quantity,
   discount,
   profit
FROM
  `sndqa-datastewards`.`bronzelayer`.`order_raw`
)

  select 
    *
   from fact_sales