# a5-iim-tf-gcp-challenge

## Initialisation
Créer un bucket pour stocker l'état de Terraform, puis renseigner son nom dans un fichier backend.tfvars :
```sh
mv backend.tfvars.copy backend.tfvars
```
Puis à l'intérieur, mettre le nom du bucket :
```env
bucket = "<bucket_name>"
```

Initialiser Terraform avec le backend distant :
```sh
terraform init -backend-config=backend.tfvars
```
