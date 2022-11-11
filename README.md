# How to bootstrap Github repository keeping track of Github repositories including itself

## Review Terraform code in this repository

- `github_repository` module in `./modules/github-repository/`
- root module in `./`

## Login to Github

```
gh auth login --git-protocol ssh --hostname github.com --web
```

## Export Terraform variables

```
export TF_VAR_github_token=$(gh auth token)
export TF_VAR_github_ssh_private_key_path=${path_to_your_github_ssh_key}
```

## Initialize, plan and apply Terraform resources

```
terraform init
terraform plan -out tfplan
terraform apply tfplan
```

## Get the outputs of the root module

```
terraform output

```

## Initialize a local git repository

```
git init .
```

## Point the local repository to the Github repository just created

```
git remote origin ${ssh_clone_url_from_terraform_outputs}
git fetch origin
```

## Configure the local repository

```
git config --local user.name "Firstname Lastname"
git config --local user.email "firstname.lastname@example.com"
```

## Checkout main branch

```
git checkout main
```

## Create some more repositories in root module

```
module "cool_repository" {
  source                      = "./modules/github-repository"
  github_owner                = "holcapek"
  github_token                = var.github_token
  github_ssh_private_key_path = var.github_ssh_private_key_path
  repository_name             = "cool-repository"
  initial_commit_author_name  = "Firstname Lastname"
  initial_commit_author_email = "first.last@example.com"
}
```

