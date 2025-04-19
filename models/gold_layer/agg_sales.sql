with agg_sales as (
    SELECT
  cust.customer_name,
  cust.customer_id,
  cust.segment,
  cust.country,
  cust.region,
  cust.state,
  cust.city,
  cust.postal_code,
  fact.order_date,
  fact.ship_date,
  pro.category,
  pro.sub_category,
  pro.product_name,
  pro.product_id,
  fact.order_id,
  fact.sales,
  fact.quantity,
  fact.discount,
  fact.profit
FROM
  `sliverlayer.dim_customers` cust
  INNER JOIN `sliverlayer.fact_sales` fact 
    ON cust.customer_id = fact.customer_id
  INNER JOIN `sliverlayer.dim_products` pro 
    ON pro.product_id = fact.product_id)

select * from fact_job

