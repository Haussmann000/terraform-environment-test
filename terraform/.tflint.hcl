config {
  module = false
}

plugin "aws" {
  deep_check = true
  enabled    = true
  version    = "0.15.0"
  source     = "github.com/terraform-linters/tflint-ruleset-aws"
}


rule "terraform_naming_convention" {
  enabled = true
}

rule "terraform_documented_outputs" {
  enabled = true
}

rule "terraform_documented_variables" {
  enabled = true
}

rule "terraform_module_pinned_source" {
  enabled = true
}
