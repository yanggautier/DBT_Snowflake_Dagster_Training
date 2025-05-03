Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


## Installation

Clonez le projet depuis GitHub :
```bash
git clone [url-du-dépôt]
cd [nom-du-projet]
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
Pour utiliser Dagster,  créer un fichier 