{{ config(
    materialized='incremental',
    unique_key='company_id',
    merge_exclude_columns = ['created_at']
) }}
 
with dim_company as (
    select 
        *
    from 
        {{ ref('stg_company') }}
where
 {% if is_incremental() %}
    format_date('%Y-%M-%d  %H:%M:%S',created_at) > 
    (SELECT  ifnull(max(format_date('%Y-%M-%d  %H:%M:%S',created_at)),'2024-01-01 00:00:00') 
        FROM  `sndqa-datastewards.sliverlayer.dim_company`) and
{% endif %}
 company.id is not null
order by 1,2
)
 
  select
    GENERATE_UUID() AS company_key,
    *
   from dim_company