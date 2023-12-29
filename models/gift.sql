-- Define the 'gift' dbt model
{{ config(
    materialized='table'
) }}

SELECT
    id,
    roles,
    pays
FROM gift