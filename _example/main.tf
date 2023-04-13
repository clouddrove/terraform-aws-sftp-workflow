provider "aws" {
  region = "us-east-1"
}

module "s3_bucket" {
  source  = "clouddrove/s3/aws"
  version = "1.3.0"

  name        = "clouddrove-sftp-bucket-75"
  environment = "test"
  label_order = ["environment", "name"]

  versioning    = true
  acl           = "private"
  force_destroy = true
}

module "workflow1" {
  source = "../"

  name        = "sftp-test-workflow"
  environment = "test"
  label_order = ["environment", "name"]

  # workflow name
  workflow_description = "Workflow-testing01"

  # delete step
  enable_delete_step = true
  delete_step_name   = "delete-step-1"

  # tag step
  enable_tag_step          = false
  tag_step_name            = "tag-step-1"
  tag_key                  = "tag-key-1"
  tag_value                = "tag-value-1"
  tag_step_source_location = "$${original.file}"

  # custom step  
  enable_custom_step          = false
  custom_step_source_location = "$${original.file}"
  timeout_seconds             = 60

  # copy step
  enable_copy_step          = true
  copy_step_name            = "example"
  copy_overwrite_existing   = "FALSE"
  copy_step_source_location = "$${original.file}"
  copy_bucket_name          = "test-bucket"
  copy_bucket_file_key      = "destination_file.txt"

  # decrypt step  
  enable_decrypt_step          = false
  decrypt_step_name            = "decrypt-step-1"
  decrypt_bucket_name          = "test-bucket"
  decrypt_bucket_file_key      = "decrypted/file"
  decrypt_overwrite_existing   = "FALSE"
  decrypt_step_source_location = "$${original.file}"

  s3_bucket_id = module.s3_bucket.id
  user_name    = "test-user"
  bucket_name  = "test-bucket"
}