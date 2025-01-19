# terragrunt.hcl
terraform {
  source = "./modules/s3"
}

# Global configurations
remote_state {
  backend = "s3"
  config = {
    bucket         = "my-terragrunt-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "my-terraform-lock-table"
  }
}
