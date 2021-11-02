{{ config(
    materialized='table',
    persist_docs={
        "relation": true,
        "columns": true
    })
-}}

WITH wins_and_losses AS (
    SELECT
        winner AS winner,
        CASE
            WHEN winner = first THEN second
            ELSE first
        END AS loser
    FROM
        {{ ref('stage__combats') }}
),

wins AS (
    SELECT
        winner AS pokedex_number,
        COUNT(*) AS wins
    FROM
        wins_and_losses
    GROUP BY
        winner
),

losses AS (
    SELECT
        loser AS pokedex_number,
        COUNT(*) AS losses
    FROM
        wins_and_losses
    GROUP BY
        loser
),

per_pokemon AS (
    SELECT
        pokedex_number,
        wins.wins,
        losses.losses
    FROM
        wins
        FULL JOIN losses
        USING(pokedex_number)
)

SELECT
    pokedex_number,
    COALESCE(wins, 0) AS wins,
    COALESCE(losses, 0) AS losses,
    COALESCE(wins + losses, 0) AS combats
FROM
    per_pokemon
