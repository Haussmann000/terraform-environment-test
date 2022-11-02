
## terragrunt terraform
terraform {
  source = "../../../modules/subnet"
}


## terragrunt include
include {
  path = find_in_parent_folders()
}


locals {
  availability_zones = [
    "ap-northeast-1a",
    "ap-northeast-1c",
  ]
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    vpc_id = "vpc-01234567890abcdef"
  }
}

inputs = {
  availability_zones = local.availability_zones
  vpc_id             = dependency.vpc.outputs.vpc_id
}

