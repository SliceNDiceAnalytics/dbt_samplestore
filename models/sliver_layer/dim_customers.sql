{{ config(materialized='table') }}

WITH
  dim_customers AS (
  SELECT
    DISTINCT
    `Customer ID` AS customer_id,
    `Customer Name` AS customer_name,
    segment AS segment,
    country AS country,
    region AS region,
    state AS state,
    city AS city,
    `Postal Code` AS postal_code
  FROM
    `sndqa-datastewards`.`bronzelayer`.`order_raw`)
SELECT
  GENERATE_UUID() AS customer_key,
  *
FROM
  dim_customers