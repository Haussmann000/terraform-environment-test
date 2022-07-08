# --------------------------------------------------------------------------------
# Amazon S3 Contents Bucket モジュール
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
# --------------------------------------------------------------------------------

module "s3" {
  source             = "../../../../resources/s3/bucket_object"
  acl                = "private"
  bucket             = "${var.tags.service}-${var.tags.env}-postgres-dump-bucket-1"
  tags               = var.tags
  # --------------------------------------------------------------------------------
  # ロギング設定
  # --------------------------------------------------------------------------------

  logging = [
      {
        target_bucket = "${var.tags.service}-bucket-access-logs"
        target_prefix = "${var.tags.env}/"
      }
  ]
  # --------------------------------------------------------------------------------
  # サーバ側の暗号化設定
  # --------------------------------------------------------------------------------

  server_side_encryption_configuration = [
    {
      rule  = [
        {
          apply_server_side_encryption_by_default = [
            {
              sse_algorithm = "AES256"
            }
          ]
        }
      ]  
    }
  ]
}
