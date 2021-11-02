{{ config(
    materialized='table',
    persist_docs={
        "relation": true,
        "columns": true
    })
-}}


SELECT
    pokedex_number,
    name,
    weight,
    height,
    {{ bmi() }}
FROM
    {{ ref('stage__pokemon') }}
ORDER BY
    bmi ASC
