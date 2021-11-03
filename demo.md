# Demo walkthrough

## Preparation
Commands and things to showcase during demo.
* Start by being in the branch `first-step`.
* Remove the playground dataset in GCP.

```sh
# prepare
cd src
poetry shell
dbt clean
rm -r dbt_modules
rm -r logs
```
## Overview
* Show the pokemon data in GCP first.
* Then show the dbt structure, followed by the dbt docs.

```sh
# list content
tree -L 4 -P dbt_project.yml

# generate dbt docs
dbt docs generate && dbt docs serve
```

* Give overview of the project through lineage graph.
* Also show the `stage__pokemon` model, and `mart__individual__bmi`.

Show the content of some files
```sh
# list models dir
tree models -L 4

# finished data products
bat models/marts/individuals/schema.yml
bat models/marts/individuals/mart__individuals__bmi.sql


# show bmi macro
bat macros/bmi.sql
```

## Run models
* dbt is completely stateless, it doesn't know anything about previous runs.
* Look at result in GCP
* Look at Anthropometry in datastudio
```sh
# run
dbt run
```

## Test models
* Run test for `mart__individuals__bmi`

```sh
# show syntax
bat models/marts/individuals/schema.yml

# run test
dbt test --models mart__individuals__bmi
```

## Show bigger project
* Checkout `main`
* Generate docs
* Look at lineage
* Look at dashboard

```sh
# dbt docs
dbt docs generate && dbt docs serve
```

## environments & targets

```sh
bat ../profiles.yml
```