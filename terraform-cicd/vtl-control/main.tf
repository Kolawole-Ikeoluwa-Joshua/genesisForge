# --- root/main.tf ---

locals {
  aws_creds = {
    AWS_ACCESS_KEY_ID     = var.aws_access_key_id
    AWS_SECRET_ACCESS_KEY = var.aws_secret_access_key
  }
  organization = "vtl-terraform"
}

resource "github_repository" "vtl_repo" {
  name             = "vtl-dev-repo"
  description      = "VPC and Compute Resource"
  auto_init        = true
  license_template = "mit"

  visibility = "private"
}

resource "github_branch_default" "default" {
  repository = github_repository.vtl_repo.name
  branch     = "main"
}

resource "github_repository_file" "maintf" {
  repository          = github_repository.vtl_repo.name
  branch              = "main"
  file                = "main.tf"
  content             = file("./deployments/vtl-dev/main.tf")
  commit_message      = "managed by terraform"
  commit_author       = "kolawole"
  commit_email        = "kolawoleikeoluwa2018@gmail.com"
  overwrite_on_create = true
}

resource "tfe_oauth_client" "vtl_oauth" {
  organization     = local.organization
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_token
  service_provider = "github"
}

resource "tfe_workspace" "vtl_workspace" {
  name         = github_repository.vtl_repo.name
  organization = local.organization
  vcs_repo {
    identifier     = "${var.github_owner}/${github_repository.vtl_repo.name}"
    oauth_token_id = tfe_oauth_client.vtl_oauth.oauth_token_id
  }
}

resource "tfe_variable" "aws_creds" {
  for_each     = local.aws_creds
  key          = each.key
  value        = each.value
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.vtl_workspace.id
  description  = "AWS Creds"
}