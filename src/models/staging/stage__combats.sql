{{ config(
    materialized='view',
    persist_docs={
        "relation": true,
        "columns": true
    })
-}}

SELECT
    First_pokemon AS first,
    Second_pokemon AS second,
    Winner AS winner
FROM
    {{ source('raw', 'combats') }}
