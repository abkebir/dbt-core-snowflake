-- Define the 'flex' dbt model
{{ config(
    materialized='table'
) }}

SELECT
    id,
    name,
    age
FROM flex