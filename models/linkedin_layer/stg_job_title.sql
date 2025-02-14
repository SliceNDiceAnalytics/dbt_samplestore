SELECT
  DISTINCT
  title
FROM
  {{ source('bronzelayer', 'linkedin_job_listings') }}
