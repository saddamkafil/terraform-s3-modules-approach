variable "bucket_name" {
  description = "The name of the bucket"
}

variable "tag_name" {
  description = "The tag name"
}

variable "environment_tag" {
  description = "The environment name"
  # default = ""
}

variable "managed_by_tag" {
  description = "Resource managed by"
  # default = ""
}

variable "versioning_status" {
  description = "The status of the version enable"
  # default = "Disabled"
}

variable "object_ownership" {
  description = "Type of object owner"
  # default = "BucketOwnerPreferred"
}

variable "acl" {
  description = "Type of acl"
  # default ="private"
}

variable "create_website_configuration" {
  description = "define the availability of website configuration"
  type        = bool
  # default = false
}

variable "index_document" {
  description = "Index document context"
}

variable "error_document" {
  description = "Error document context"
}

variable "sse_algorithm" {
  description = "Valid value for server-side encryption algorithm to use"
  # default = "aws:kms"
}

variable "block_public_acls" {
  description = "The state(T/F) of block public acls"
  # default = "true"
}

variable "block_public_policy" {
  description = "The state(T/F) of block public policy"
  # default = "true"
}

variable "ignore_public_acls" {
  description = "The state(T/F) of ignore public acls"
  # default = "true"
}

variable "restrict_public_buckets" {
  description = "The state(T/F) of restrict public acls"
  # default = "true"
}

variable "create_bucket_policy" {
  description = "define the availability of website configuration"
  type        = bool
  # default = false
}

variable "policy" {
  description = "S3 bucket policy"
}

variable "rule_id" {
  description = "The rule name for S3 bucket lifecycle rule"
  #default     = "delete-incomplete-multipart-uploads-7days"
}

variable "delete_days_after_inititation" {
  description = "No of day to Delete incomplte multipart uplaod objects"
  #default     = "7"
}

variable "lifiecycle_rule_status" {
  description = "Enter value either to Enable  or Disable"
}

variable "bucket_lifecycle_configuration" {
  description = "Enter false to not configure and true to cnfigure"
}

variable "create_tag_name" {
  description = "Enter true or false"
}

variable "create_environment_tag" {
  description = "enter true or false"
}

variable "create_managed_by_tag" {
  description = "Enter true or false"
}
