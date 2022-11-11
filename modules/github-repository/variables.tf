variable "github_token" {
  type      = string
  sensitive = true
  validation {
    condition     = length(var.github_token) == 40 && substr(var.github_token, 0, 4) == "gho_"
    error_message = "github_token: must be of length 40 and start with `gho_`"
  }
}

variable "github_owner" {
  type = string
}

variable "repository_name" {
  type = string
}

variable "initial_commit_author_name" {
  type = string
}

variable "initial_commit_author_email" {
  type = string
}

variable "github_ssh_private_key_path" {
  type = string
}
