SELECT
  DISTINCT
  location
FROM
  {{ source('bronzelayer', 'linkedin_job_listings') }}
