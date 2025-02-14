{{ config(
    materialized='table'
) }}
 
with dim_company as (
    select 
        *
    from 
        {{ ref('stg_company') }}
where
 company_id is not null
order by 1,2
)
 
  select
    GENERATE_UUID() AS company_key,
    *
   from dim_company