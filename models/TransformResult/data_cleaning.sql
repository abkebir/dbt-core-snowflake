-- models/data_cleaning.sql

WITH clean_data AS (
  SELECT
    id,
    name,
    email,
    country
  FROM
    {{ ref('raw_data_extraction') }}
  WHERE
    email IS NOT NULL
)
SELECT * FROM clean_data
