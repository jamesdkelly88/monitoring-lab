# stacks

resource "portainer_stack" "stack" {
  for_each = fileset(path.module, "../stacks/*/docker-compose.yml")

  name                      = basename(dirname(each.value))
  deployment_type           = "swarm"
  method                    = "repository"
  endpoint_id               = var.portainer_endpoint_id
  repository_url            = "https://github.com/jamesdkelly88/monitoring-lab"
  repository_reference_name = "refs/heads/${var.git_branch}"
  file_path_in_repository   = replace(each.value, "..", ".")
  stack_webhook             = true
  update_interval           = "1h"
  prune                     = true

  depends_on = [portainer_docker_secret.secret]
}

resource "portainer_docker_secret" "secret" {
  for_each = { for secret in data.bitwarden-secrets_secret.secret : secret.key => secret }

  endpoint_id = var.portainer_endpoint_id
  name        = each.value.key
  data        = base64encode(each.value.value)
}

data "bitwarden-secrets_list_secrets" "all_secrets" {}

data "bitwarden-secrets_secret" "secret" {
  for_each = { for secret in data.bitwarden-secrets_list_secrets.all_secrets.secrets : secret.id => secret }
  id       = each.value.id
}