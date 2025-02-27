select
 `Order ID` as order_id,
  Returned as returned
FROM
  {{ source('bronzelayer', 'return_raw') }}
order by 2