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
    combats,
    CASE
        WHEN name = "Squirtle" THEN "Data Engineer"
        WHEN name = "Pikachu" THEN "Analytics Engineer"
        WHEN name = "Bulbasaur" THEN "Data Analyst"
    END AS data_role
FROM
    {{ ref('intermediate__individuals__combats') }}
    LEFT JOIN {{ ref('stage__pokemon') }}
    USING(pokedex_number)
WHERE
    name = "Squirtle"
    OR name = "Pikachu"
    OR name = "Bulbasaur"
ORDER BY
    winner_ratio DESC,
    combats DESC,
    name
