# --------------------------------------------------------------------------------
# ローカル属性定義
# --------------------------------------------------------------------------------

locals {
  aws_region_id    = "ap-northeast-1"
  service          = "terraform-environment-test"
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env              = local.environment_vars.locals.env
  aws_account_id   = local.environment_vars.locals.aws_account_id
  vpc_cidr         = "10.1.0.0/16"
}

# --------------------------------------------------------------------------------
# provider.tf テンプレート
# --------------------------------------------------------------------------------

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  allowed_account_ids = ["${local.aws_account_id}"]
  region              = "${local.aws_region_id}"
}
provider "aws" {
  allowed_account_ids = ["${local.aws_account_id}"]
  region              = "us-east-1"
  alias               = "us-east-1"
}
EOF
}

# --------------------------------------------------------------------------------
# backend.tf テンプレート
# --------------------------------------------------------------------------------

remote_state {
  backend = "s3"
  config = {
    bucket  = "${local.service}-${get_aws_account_id()}"
    encrypt = true
    key     = "tfstate/${local.service}/${local.env}/${basename(get_terragrunt_dir())}.tfstate"
    region  = local.aws_region_id
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

# --------------------------------------------------------------------------------
# グローバル属性定義
# --------------------------------------------------------------------------------

inputs = {
  region = {
    id = local.aws_region_id
  },
  tags = {
    env     = local.env
    service = local.service
  }
  vpc_cidr = local.vpc_cidr
}
