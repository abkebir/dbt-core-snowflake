{{ config(
    materialized='table',
)}}

SELECT
    f.name,
    f.age,
    g.roles,
    g.pays
    
FROM
    {{ ref('flex') }} AS f --flex table in my bdd
JOIN
    {{ ref('gift') }} AS g -- gift table in my bdd
ON
    f.id = g.id
