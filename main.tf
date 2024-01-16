
## Managed By : CloudDrove
## Description : This Script is used to create Transfer Server, Transfer User And  TransferSSK_KEY.
## Copyright @ CloudDrove. All Right Reserved.

#Module      : labels
#Description : This terraform module is designed to generate consistent label names and tags
#              for resources. You can use terraform-labels to implement a strict naming
#              convention.
module "labels" {
  source  = "clouddrove/labels/aws"
  version = "1.3.0"

  name        = var.name
  repository  = var.repository
  environment = var.environment
  managedby   = var.managedby
  attributes  = var.attributes
  label_order = var.label_order
}

# Module      : AWS TRANSFER WORKFLOW
# Description : Provides a AWS Transfer Workflow resource.

resource "aws_transfer_workflow" "example" {
  count       = var.enable_workflow ? 1 : 0
  description = var.workflow_description
  dynamic "steps" {
    for_each = var.enable_delete_step ? [1] : []
    content {
      delete_step_details {
        name                 = var.delete_step_name
        source_file_location = "$${original.file}"
      }
      type = "DELETE"
    }
  }

  dynamic "steps" {
    for_each = var.enable_tag_step ? [1] : []
    content {
      tag_step_details {
        name                 = var.tag_step_name
        source_file_location = var.tag_step_source_location
        tags {
          key   = var.tag_key
          value = var.tag_value
        }
      }
      type = "TAG"
    }
  }

  dynamic "steps" {
    for_each = var.enable_custom_step ? [1] : []
    content {
      custom_step_details {
        name                 = "example"
        source_file_location = var.custom_step_source_location
        # target               = aws_lambda_function.example.arn
        timeout_seconds = var.timeout_seconds
      }
      type = "CUSTOM"
    }
  }

  dynamic "steps" {
    for_each = var.enable_copy_step ? [1] : []
    content {
      copy_step_details {
        name                 = var.copy_step_name
        overwrite_existing   = var.copy_overwrite_existing
        source_file_location = var.copy_step_source_location
        destination_file_location {
          s3_file_location {
            bucket = var.copy_bucket_name
            key    = var.copy_bucket_file_key
          }
        }
      }
      type = "COPY"
    }
  }

  dynamic "steps" {
    for_each = var.enable_decrypt_step ? [1] : []
    content {
      decrypt_step_details {
        destination_file_location {
          s3_file_location {
            bucket = var.decrypt_bucket_name
            key    = var.decrypt_bucket_file_key
          }
        }
        name                 = var.decrypt_step_name
        overwrite_existing   = var.decrypt_overwrite_existing
        source_file_location = var.decrypt_step_source_location
        type                 = "PGP"
      }
      type = "DECRYPT"
    }
  }

  tags = module.labels.tags
}