{{ config(
    materialized='table',
    persist_docs={
        "relation": true,
        "columns": true
    })
-}}

WITH bmis AS (
    SELECT
        pokedex_number,
        name,
        weight,
        height,
        ROUND(weight / (height * height), 2) AS bmi,
        generation
    FROM
        {{ ref('stage__pokemon') }}
)

SELECT
    generation,
    COUNT(*) AS pokemons,
    ROUND(AVG(bmi), 2) AS mean_bmi,
    MIN(bmi) AS min_bmi,
    MAX(bmi) AS max_bmi,
    ROUND(AVG(weight), 2) AS mean_weight,
    MIN(weight) AS min_weight,
    MAX(weight) AS max_weight,
    ROUND(AVG(height), 2) AS mean_height,
    MIN(height) AS min_height,
    MAX(height) AS max_height
FROM
    bmis
GROUP BY
    generation
ORDER BY
    mean_bmi DESC
