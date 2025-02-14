{{
    config(
        materialized = "table"
    )
}}

with fact_job as (

    select Distinct * from 
(
SELECT 
id,
posterId,
company_key,
location_key,
job_title_key,
date_key,
current_timestamp() as created_at
FROM  {{ source('bronzelayer', 'linkedin_job_listings') }} as source --`sndqa-datastewards.bronzelayer.linkedin_job_listings` as source 
  join {{ ref('dim_company') }} as dim_company--`sndqa-datastewards.sliverlayer.dim_company` as dim_company 
    on dim_company.company_id = company.id
  join {{ ref('dim_location') }} as dim_location --`sndqa-datastewards.sliverlayer.dim_location` as dim_location 
    on source.location = dim_location.location
  join {{ ref('dim_job_title') }} as dim_job_title --`sndqa-datastewards.sliverlayer.dim_job_title` as dim_job_title
    on source.title=dim_job_title.title
  join {{ ref('dim_date') }} as dim_date --`sndqa-datastewards.sliverlayer.dim_date` as dim_date
    on Date(substr(postAt,0,10)) = dim_date.date_day and postAt is not null
)


)

select * from fact_job