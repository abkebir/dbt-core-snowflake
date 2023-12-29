-- models/data_aggregation.sql

SELECT
  country,
  COUNT(*) as total_clients
FROM
  {{ ref('data_cleaning') }}
GROUP BY
  country
