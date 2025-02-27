{{
    config(
        materialized = "table"
    )
}}

with dim_order_date as (
{{ dbt_date.get_date_dimension('2020-01-01', '2025-12-31') }}
)

select
    GENERATE_UUID() AS date_key,
    *
   from dim_order_date