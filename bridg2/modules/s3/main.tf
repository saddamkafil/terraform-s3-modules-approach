resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  tags = merge (
    var.create_tag_name ? { Name = var.tag_name} :{},
    var.create_environment_tag ? { Environmrnt = var.environment_tag} : {},
    var.create_managed_by_tag ? { ManagedBy   = var.managed_by_tag } : {}
  )
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket" {
  bucket = var.bucket_name
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_versioning" "bucket" {
  bucket = var.bucket_name
  versioning_configuration {
    status = var.versioning_status
  }
}


resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket                  = var.bucket_name
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_website_configuration" "bucket" {
  bucket = var.bucket_name
  count  = var.create_website_configuration ? 1 : 0
  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

resource "aws_s3_bucket_policy" "bucketpolicy" {
  bucket = var.bucket_name
  count  = var.create_bucket_policy ? 1 : 0
  policy = var.policy
}

resource "aws_s3_bucket_ownership_controls" "bucket" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = var.object_ownership
  }
}
resource "aws_s3_bucket_acl" "bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket]
  bucket     = var.bucket_name
  acl        = var.acl
}

# aws_s3_bucket_lifecycle_configuration.example:
resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_rule" {
  bucket = var.bucket_name
  count  = var.bucket_lifecycle_configuration ? 1 : 0

  rule {
    id     = var.rule_id
    status = var.lifiecycle_rule_status

    abort_incomplete_multipart_upload {
      days_after_initiation = var.delete_days_after_inititation
    }

    expiration {
      days                         = 0
      expired_object_delete_marker = false
    }
  }
}
