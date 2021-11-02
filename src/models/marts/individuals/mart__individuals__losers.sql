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
    wins,
    losses,
    winner_ratio,
    loser_ratio,
    combats
FROM
    {{ ref('intermediate__individuals__combats') }}
    LEFT JOIN {{ ref('stage__pokemon') }}
    USING(pokedex_number)
ORDER BY
    loser_ratio DESC,
    combats DESC,
    name
LIMIT 50
