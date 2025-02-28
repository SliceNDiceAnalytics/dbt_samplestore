
with fact_sales as (
SELECT 
   dim_products.product_id,
   source.order_id,
   dim_customers.customer_id,
   dim_geo.postal_code,
   dim_shipmode.shipmode_key,
   source.order_date,
   source.ship_date,
   source.sales,
   source.quantity,
   source.discount,
   source.profit,
   ifnull(return.returned, false) as return_status,
   current_timestamp() as created_at
  
FROM  {{ ref('stg_order') }} as source 
  join {{ ref('dim_customers') }} as dim_customers
    on source.customer_id = dim_customers.customer_id
  join {{ ref('dim_geo') }} as dim_geo 
    on source.postal_code = dim_geo.postal_code
  join {{ ref('dim_products') }} as dim_products 
    on source.product_id=dim_products.product_id
  join {{ ref('dim_shipmode') }} as dim_shipmode 
    on source.ship_mode = dim_shipmode.ship_mode 
--   join {{ ref('dim_order_date') }} as dim_date --`sndqa-datastewards.sliverlayer.dim_date` as dim_date
--     on source.order_date = dim_date.date_day 
  left join {{ ref('dim_return') }} as return 
    on source.order_id=  return.order_id
)
  select 
    *
   from fact_sales