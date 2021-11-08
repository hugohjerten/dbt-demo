# Welcome
This repo aims to show-case how you can setup your [`dbt`](https://www.getdbt.com/) project, using a basic example data set.

It is recommended to start in the branch `first-step` to find a "smaller" project with less data models, and then check out the `main` branch for a more extensive example.

## Data used
The data that is used in this demo is fetched from Kaggle ([pokemon](https://www.kaggle.com/rounakbanik/pokemon) & [combats](https://www.kaggle.com/terminus7/pokemon-challenge?select=combats.csv)).

## Setup
### python
To setup your local machine, you need to have python `3.9` as well as [`poetry`](https://python-poetry.org/).
It is recommended to manage your local python version using [`pyenv`](https://github.com/pyenv/pyenv).
You can find a guide on how to setup these two tools up [here](https://github.com/hugohjerten/poetry-pyenv-demo/blob/master/demo.md).

### BigQuery
In this example, [GCP's `BigQuery`](https://cloud.google.com/bigquery) is used as the Data Warehouse of choice.
To follow along in the demo, it is recommended to setup your own project in GCP, with the appropriate IAM settings.
Upload the data mentioned in [Data used](#data-used) into a dataset called `raw` in your BigQuery instance, to be able to follow along.

Please check out the `profiles.yml` file to configure the access to your GCP project.

## To do
- [ ] Add section on how to host this on GCP
