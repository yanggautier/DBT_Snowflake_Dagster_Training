# DBT Snowflake Dagster Tranining
### Using the starter project

Try running the following commands:
- dbt run
- dbt test


## Installation

Clonez le projet depuis GitHub :
```bash
git clone https://github.com/yanggautier/DBT_Snowflake_Dagster_Training.git
cd DBT_Snowflake_Dagster_Training
```


### dbt setup
Initier le répertoire pour le profile dbt Mac/Linux:
```bash
mkdir ~/.dbt
```
Dans Windows:
```bash
mkdir %userprofile%\.dbt
```

Créer un fichier nommant `profiles.yml` dans ce réperoire et remplacer les variables par vos propres valeurs 
```yaml
<project_name>:
  outputs:
    dev:
      account: <prefix_dedicated_login_url>
      database: <database_name>
      password: <password>
      role: TRANSFORM
      schema: <schema_name>
      threads: 1
      type: snowflake
      user: <user_name>
      warehouse: <warehouse_name>
  target: dev
```

Création d'un environnement virtuel
```bash
virtualenv venv
source venv/bin/activate
```
Installation des dependencies
```bash
pip install -r requirements.txt
```

Test de connection avec Snowflake
```bash
dbt debug
```

Pour peupler les données qui se trouve dans le répertoire de la racine à Snowflake
```bash
dbt seed
```

Pour vérifier le fraîcheur de données
```bash
dbt source freshness
```

Création de snapshot
```bash
dbt snapshot
```

## Test

Test sur des règles qu'on a défini dans `models/schema.yaml`
```bash
dbt test
```

Test sur une requête définie dans `tests`
```bash
dbt test --select <prefix_du_fichier>
```

## Packages
Pour consulter des packages  le site de [getdbt.com](https://hub.getdbt.com/)

Pour installer les packages mentionnées dans le fichier `packages.yaml`
```bash
dbt deps
```

## Documentation

Pour générer la documentation
```bash
dbt docs generate
````

Pour afficher la documentation sur server local
```bash
dbt docs serve
```

## Exécution
Exécuter la commande `dbt run` pour créer des views dans schema indiqué dans profile.yaml

## Analyse
Compiler les quêtes d'analyse
```bash
dbt compile
```

## Debug
Pour debug d'une commande ajouter un `--debug` dans la commande
```bash
dbt --debug test --select source:airbnb.listings
```

## Log
Exécution d'une opération
```bash
dbt run-operation learn_logging
```

Pour commenter un script jinja, utilise `{# et #}`

## Variables
Pour passer une variables dans jinja on utilse `var("variable_name")`

1. Pour passer les variables par la commande
```bash
dbt run-operation learn_variables --vars '{variable_name: my_variable}'
```

2. Ecrire dans le fichier `dbt_project.yml`
```yaml
vars:
  user_name: default_user_name_for_this_project
```

## Orchestration
1. Pour utiliser Dagster,  installer les dependencies à partir du fichier `requirements.txt` à la racine du projet  
2. Créer le répertoire de Dagster dans le projet
```bash
dagster-dbt project scaffold --project-name dbt_dagster_project --dbt-project-dir=dbtlearn --ignore-package-conflict
```
3. Pour démarrer Dagster
```bash
cd dbt_dagster_project
DAGSTER_DBT_PARSE_PROJECT_ON_LOAD=1 dagster dev
```
