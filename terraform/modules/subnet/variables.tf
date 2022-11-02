# --------------------------------------------------------------------------------
# 属性定義
# ../../terrgrunt.hcl inputsブロックで定義した属性
# --------------------------------------------------------------------------------

variable "tags" {
  type = map(string)
}

variable "vpc_id" {
  type = string
}
variable "vpc_cidr" {
  type = string
}

variable "availability_zones" {
  type    = list(string)
  default = []
}
