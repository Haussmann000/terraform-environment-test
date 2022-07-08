# --------------------------------------------------------------------------------
# Amazon CloudFront Function 属性定義
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_function
# --------------------------------------------------------------------------------

variable "bucket" {
  type    = string
  default = null
}

variable "bucket_key_enabled" {
  type    = bool
  default = false
}

variable "objects" {
  type    = any
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}