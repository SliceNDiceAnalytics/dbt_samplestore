SELECT
  DISTINCT
  company.id as company_id,
  company.name as company_name,
  company.logo as company_logo,
  company.url as company_url
FROM
  {{ source('bronzelayer', 'linkedin_job_listings') }}