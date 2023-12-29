-- models/load_final_data.sql

{{ config(
    materialized='table',
    alias='client_summary'
) }}

SELECT
  *
FROM
  {{ ref('data_aggregation') }}
