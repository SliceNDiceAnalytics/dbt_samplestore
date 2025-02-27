{{ config(
    materialized='table'
) }}
 
with dim_shipmode as (
    select distinct
        ship_mode
    from 
        {{ ref('stg_order') }}
where
 ship_mode is not null
order by 1
)
 
  select
    GENERATE_UUID() AS shipmode_key,
    *
   from dim_shipmode