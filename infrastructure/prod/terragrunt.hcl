# prod/s3/terragrunt.hcl
include {
  path = find_in_parent_folders()
}

inputs = {
  bucket_name = "prod-my-unique-bucket-name"
}
