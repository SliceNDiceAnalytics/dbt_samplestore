{{ config(materialized='table') }}

WITH
  dim_geo AS (
  SELECT
    DISTINCT
    country,
    region,
    state,
    city,
    postal_code
  FROM
    {{ ref('stg_order') }}
    )

SELECT
  GENERATE_UUID() AS geo_key,
  *
FROM
  dim_geo