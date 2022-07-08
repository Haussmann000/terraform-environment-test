
## terragrunt terraform
terraform {
  source = "../../../modules/s3"
}


## terragrunt include
include {
  path = find_in_parent_folders()
}

