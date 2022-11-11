module "github_as_code" {
  source                      = "./modules/github-repository"
  github_owner                = "holcapek"
  github_token                = var.github_token
  github_ssh_private_key_path = var.github_ssh_private_key_path
  repository_name             = "github-as-code"
  initial_commit_author_name  = "Jan Holcapek"
  initial_commit_author_email = "holcapek@gmail.com"
}
