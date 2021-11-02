{{ config(
    materialized='table',
    persist_docs={
        "relation": true,
        "columns": true
    })
-}}

WITH attack_levels AS (
    SELECT
        {{ total_attack() }},
        generation
    FROM
        {{ ref('stage__pokemon') }}
    WHERE
        NOT is_legendary
)

SELECT
    generation,
    COUNT(*) AS pokemons
FROM
    attack_levels
WHERE
    total_attack >= 150
GROUP BY
    generation
ORDER BY
    pokemons DESC
