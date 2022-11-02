# --------------------------------------------------------------------------------
# Amazon S3 Contents Bucket モジュール
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
# --------------------------------------------------------------------------------

# https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/3.3.0
module "s3" {
  source             = "terraform-aws-modules/s3-bucket/aws"
  acl                = "private"
  bucket             = "${var.tags.service}-${var.tags.env}-test-bucket-${count.index}"
  tags               = var.tags
}
