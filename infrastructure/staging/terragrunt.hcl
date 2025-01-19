# staging/s3/terragrunt.hcl
include {
  path = find_in_parent_folders()
}

inputs = {
  bucket_name = "staging-my-unique-bucket-name"
}
