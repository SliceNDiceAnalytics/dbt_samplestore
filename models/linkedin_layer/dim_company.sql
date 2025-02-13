{{ config(
    materialized='incremental',
    unique_key='company_id',
    merge_exclude_columns = ['created_at']
) }}
 
with dim_company as (
SELECT
  DISTINCT
  company.id as company_id,
  company.name as company_name,
  company.logo as company_logo,
  company.url as company_url
FROM
  {{ source('bronzelayer', 'linkedin_job_listings') }}
 
where
 {% if is_incremental() %}
format_date('%Y-%M-%d  %H:%M:%S',created_at) > (SELECT  ifnull(max(format_date('%Y-%M-%d  %H:%M:%S',created_at)),'2024-01-01 00:00:00') FROM  `sndqa-datastewards.sliverlayer.dim_company`) and
{% endif %}
 company.id is not null
order by 1,2
)
 
  select
    GENERATE_UUID() AS company_key,
    *
   from dim_company