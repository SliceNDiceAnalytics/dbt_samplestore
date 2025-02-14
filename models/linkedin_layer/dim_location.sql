{{ config(
    materialized='table'    
) }}
 
with dim_location as (
    select 
        location,
        SPLIT(split(location,',')[safe_ordinal(1)], '(')[OFFSET(0)]   as city,
        trim(ifnull(split(Split(location,',')[safe_ordinal(2)],'(')[OFFSET(0)],"NA")) as state,
        trim(ifnull(Split((Split(location,',')[safe_ordinal(3)]),'(')[safe_ordinal(1)],"NA")) as country,
        trim(ifnull(Split((Split(location,',')[safe_ordinal(3)]),'(')[safe_ordinal(1)], split(location,',')[safe_ordinal(1)])) as job_location,  
        rtrim(Split(location,'(')[safe_ordinal(2)],')') as Job_Location_Type
    from
        {{ ref('stg_location') }}
where
    location is not null
)
 
  select
    GENERATE_UUID() AS location_key,
    *
   from dim_location