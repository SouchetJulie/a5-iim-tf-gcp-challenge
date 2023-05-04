# a5-iim-tf-gcp-challenge

## Initialisation
(Optionnel) Pour éviter de renseigner à la main les différentes variables à chaque fois, on peut créer un fichier terraform.tfvars les contenant :
```hcl
region = "europe-west1"
zone = "europe-west1-d"
project = "project-id-12345667"
backend = "uniquebucketname"
location = "EU"
dataset = "datasetname"
table = "tablename"
```

Activer les API Google Cloud nécessaires : (lien)[https://console.cloud.google.com/flows/enableapi?apiid=cloudbuild.googleapis.com,run.googleapis.com,artifactregistry.googleapis.com,cloudfunctions.googleapis.com,storage.googleapis.com]

Initialiser Terraform :
```sh
terraform init
```

Créer le bucket pour stocker le backend :
```sh
terraform plan -target=module.bucket.google_storage_bucket.backend -out=plan.tfplan
terraform apply plan.tfplan
```

Mettre à jour main.tf en ajoutant ce bloc à `terraform` (l.7) :
```hcl
  backend "gcs" {
    bucket = "<nom choisi précédemment>"
    prefix = "terraform/state"
  }
```

Puis migrer le state vers le backend distant :
```sh
terraform init -migrate-state
```

## Création
Exécuter Terraform :
```sh
terraform apply
```

Il se chargera de provisionner l'infrastructure pour nous.

## Test
Une fois la fonction prête, on peut la tester avec :
```sh
curl -H "Authorization: bearer $(gcloud auth print-identity-token)" $(gcloud functions describe hello_world --gen2 --region=europe-west1 --format="value(serviceConfig.uri)")
```
`gcloud auth print-identity-token` permet d'authentifier la requête, et `gcloud functions describe hello_world --gen2 --region=europe-west1 --format="value(serviceConfig.uri)"` permet de récupérer l'URL de la fonction.
 Remplacer `europe-west1` par la région choisie si besoin.

On peut ensuite vérifier dans la console de Google Cloud que les données ont été ajoutées à BigQuery.
