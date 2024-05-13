module "cdp-data-lake" {
    source = "../modules/s3"
    bucket_name = "saddam-modulet-test-s3-bucket"
    tag_name = "test"
    environment_tag = "env-test"
    versioning_status = "Disabled"
    object_ownership = "BucketOwnerPreferred"
    acl = "private"
    create_website_configuration = false
    index_document = "index.html"
    error_document = "error.html"
    sse_algorithm = "aws:kms"
    block_public_acls = "true"
    block_public_policy = "true"
    ignore_public_acls = "true"
    create_bucket_policy = false
    policy = "na"
    managed_by_tag = "managed-tag"
    restrict_public_buckets = "true"
    rule_id = "delete-incomplete-multipart-uploads-7days"
    lifiecycle_rule_status = "Disabled"
    bucket_lifecycle_configuration = true
    delete_days_after_inititation = "7"
}
terraform {
  backend "s3" {
    bucket = "saddam-tf-state"
    key    = "tf-state/"
    region = "us-east-1"
  }
}
