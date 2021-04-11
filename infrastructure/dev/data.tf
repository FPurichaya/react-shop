data "terraform_remote_state" "network_remote_state" {
  backend = "s3"

  config = {
    bucket = "testinfbucket"
    key    = "infrastructure/global/terraform.tfstate"
    region = var.region
  }
}