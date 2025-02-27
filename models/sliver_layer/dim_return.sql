  {{ config(
    materialized='table'
) }}
 
with dim_return as (
    select distinct
        *
    from 
        {{ ref('stg_return') }}
order by 1
)
 
  select
    GENERATE_UUID() AS return_key,
    *
   from dim_return