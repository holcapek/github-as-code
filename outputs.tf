output "github_as_code_ssh_clone_url" {
  value = module.github_as_code.ssh_clone_url
}

output "oci_always_free_infra_as_code_ssh_clone_url" {
  value = module.oci_always_free_infra_as_code.ssh_clone_url
}

output "jenkins_image_ssh_clone_url" {
  value = module.jenkins_image.ssh_clone_url
}
