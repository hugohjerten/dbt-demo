{{ config(
    materialized='view',
    persist_docs={
        "relation": true,
        "columns": true
    })
-}}

SELECT
    pokedex_number,
    name,
    type1 AS type_1,
    type2 AS type_2,
    SPLIT(TRIM(REPLACE(REPLACE(abilities, " '", ""), "'", ""), "[]")) AS abilities,
    hp,
    attack,
    defense AS defence,
    sp_attack,
    sp_defense AS sp_defence,
    base_happiness,
    speed AS base_speed,
    base_egg_steps,
    base_total,
    capture_rate,
    experience_growth,
    height_m AS height,
    weight_kg AS weight,
    percentage_male,
    generation,
    CASE
        WHEN is_legendary = 1 THEN TRUE
        ELSE FALSE
    END AS is_legendary,
    classfication AS classification,
    japanese_name,
    against_bug,
    against_dark,
    against_dragon,
    against_electric,
    against_fairy,
    against_fight,
    against_fire,
    against_flying,
    against_ghost,
    against_grass,
    against_ground,
    against_ice,
    against_normal,
    against_poison,
    against_psychic,
    against_rock,
    against_steel,
    against_water
FROM
    {{ source('raw', 'pokemon') }}
