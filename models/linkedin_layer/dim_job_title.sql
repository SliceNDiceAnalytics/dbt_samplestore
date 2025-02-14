{{ config(
    materialized='table'    
) }}
 
with dim_job_title as (
    select 
        title
    from 
        {{ ref('stg_job_title') }}
where
    title is not null
)
 
  select
    GENERATE_UUID() AS job_title_key,
    *
   from dim_job_title