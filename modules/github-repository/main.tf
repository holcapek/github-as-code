resource "github_repository" "repository" {
  name                   = var.repository_name
  allow_merge_commit     = true
  allow_squash_merge     = false
  allow_rebase_merge     = false
  merge_commit_title     = "PR_TITLE"
  merge_commit_message   = "PR_BODY"
  delete_branch_on_merge = true
}

resource "null_resource" "initialize_main_branch" {
  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = <<-EOT
      clone_dir="$(mktemp -d)"
      git clone ${github_repository.repository.ssh_clone_url} "$clone_dir"
      pushd "$clone_dir"
      git checkout main && exit 0
      git config --local user.name "${var.initial_commit_author_name}"
      git config --local user.email "${var.initial_commit_author_email}"
      git config --local core.sshCommand "ssh -i ${var.github_ssh_private_key_path}"
      git checkout -b main
      git commit -m "Initialize the repository" --allow-empty
      git push origin HEAD
      popd
    EOT
  }
  triggers = {
    always = "${timestamp()}"
  }
  depends_on = [
    github_repository.repository
  ]
}

resource "github_branch_default" "default_branch" {
  repository = github_repository.repository.name
  branch     = "main"
  depends_on = [
    null_resource.initialize_main_branch
  ]
}

resource "github_branch_protection" "default_branch_protection" {
  repository_id                   = github_repository.repository.name
  pattern                         = github_branch_default.default_branch.branch
  allows_force_pushes             = false
  allows_deletions                = false
  require_conversation_resolution = true
  enforce_admins                  = true
  required_status_checks {
    strict = true
  }
}
