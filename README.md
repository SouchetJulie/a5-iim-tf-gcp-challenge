# a5-iim-tf-gcp-challenge

## Initialisation
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
