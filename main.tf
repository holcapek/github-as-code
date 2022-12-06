module "github_as_code" {
  source                      = "./modules/github-repository"
  github_owner                = "planet-devops-xyz"
  github_token                = var.github_token
  github_ssh_private_key_path = var.github_ssh_private_key_path
  repository_name             = "github-as-code"
  initial_commit_author_name  = "Jan Holcapek"
  initial_commit_author_email = "holcapek@gmail.com"
}

module "oci_always_free_infra_as_code" {
  source                      = "./modules/github-repository"
  github_owner                = "planet-devops-xyz"
  github_token                = var.github_token
  github_ssh_private_key_path = var.github_ssh_private_key_path
  repository_name             = "oci-always-free-infra-as-code"
  initial_commit_author_name  = "Jan Holcapek"
  initial_commit_author_email = "holcapek@gmail.com"
}

module "jenkins_image" {
  source                      = "./modules/github-repository"
  github_owner                = "planet-devops-xyz"
  github_token                = var.github_token
  github_ssh_private_key_path = var.github_ssh_private_key_path
  repository_name             = "jenkins-image"
  initial_commit_author_name  = "Jan Holcapek"
  initial_commit_author_email = "holcapek@gmail.com"
}
