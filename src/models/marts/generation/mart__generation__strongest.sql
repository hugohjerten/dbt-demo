{{ config(
    materialized='table',
    persist_docs={
        "relation": true,
        "columns": true
    })
-}}

WITH attack_levels AS (
    SELECT
        attack + sp_attack AS attack_sum,
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
    attack_sum >= 150
GROUP BY
    generation
ORDER BY
    pokemons DESC
