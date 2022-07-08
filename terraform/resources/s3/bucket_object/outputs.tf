# --------------------------------------------------------------------------------
# Amazon S3 Bucket Object アウトプット定義
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object
# --------------------------------------------------------------------------------

output "s3_bucket_object" {
  value = aws_s3_bucket_object.this
}
