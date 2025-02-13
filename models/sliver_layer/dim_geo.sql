{{ config(materialized='table') }}

WITH
  dim_geo AS (
  SELECT
    DISTINCT
    country AS country,
    region AS region,
    state AS state,
    city AS city,
    `Postal Code` AS postal_code
  FROM
    `sndqa-datastewards`.`bronzelayer`.`order_raw`)
SELECT
  GENERATE_UUID() AS geo_key,
  *
FROM
  dim_geo