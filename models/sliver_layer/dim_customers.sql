{{ config(materialized='table') }}

WITH
  dim_customers AS (
  SELECT
    DISTINCT
    customer_id,
    customer_name,
    segment,
    country,
    region,
    state,
    city,
    postal_code
  FROM
    {{ ref('stg_order') }}
    )
    
SELECT
  GENERATE_UUID() AS customer_key,
  *
FROM
  dim_customers