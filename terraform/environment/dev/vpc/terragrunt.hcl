
## terragrunt terraform
terraform {
  source = "../../../modules/vpc"
}


## terragrunt include
include {
  path = find_in_parent_folders()
}

