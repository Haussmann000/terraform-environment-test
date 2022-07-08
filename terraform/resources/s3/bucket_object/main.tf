# --------------------------------------------------------------------------------
# Amazon S3 Bucket Object リソース定義
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object
# --------------------------------------------------------------------------------

resource "aws_s3_bucket_object" "this" {
    for_each               = var.objects
    acl                    = lookup(each.value, "acl", "private")
    bucket                 = var.bucket
    bucket_key_enabled     = var.bucket_key_enabled
    content                = lookup(each.value, "content", null)
    content_type           = lookup(each.value, "content_type", null)
    key                    = each.value.key
    metadata               = lookup(each.value, "metadata", {})
    server_side_encryption = lookup(each.value, "server_side_encryption", "AES256")
    source                 = lookup(each.value, "source", null)
    storage_class          = lookup(each.value, "storage_class", "STANDARD")
    tags                   = merge(var.tags, { "Name" = each.value.key })
}
