terraform {
  cloud {
    organization = "jdkhomelab-monitoring"
    hostname     = "app.terraform.io"
    workspaces {
      name = "lab"
    }
  }
  required_providers {
    bitwarden-secrets = {
      source  = "bitwarden/bitwarden-secrets"
      version = "0.5.4-pre"
    }
    portainer = {
      source  = "portainer/portainer"
      version = "1.24.0"
    }
  }
}

provider "bitwarden-secrets" {
  api_url      = "https://api.bitwarden.com"
  identity_url = "https://identity.bitwarden.com"
}