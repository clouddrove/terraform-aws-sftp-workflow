#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/clouddrove/terraform-aws-sftp"
  description = "Terraform current module repo"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "attributes" {
  type        = list(any)
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove'."
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `organization`, `environment`, `name` and `attributes`."
}



#Module      : SFTP Workflow
#Description : Terraform sftp workflow module variables.

variable "enable_workflow" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "delete_step_name" {
  type        = string
  default     = null
  description = "Delete step Name  (e.g. `app` or `cluster`)."
}

variable "tag_step_name" {
  type        = string
  default     = null
  description = "Tage step Name  (e.g. `app` or `cluster`)."
}

variable "custom_step_name" {
  type        = string
  default     = null
  description = "Custom step Name  (e.g. `app` or `cluster`)."
}

variable "copy_step_name" {
  type        = string
  default     = null
  description = "Copy Step Name  (e.g. `app` or `cluster`)."
}

variable "decrypt_step_name" {
  type        = string
  default     = "test-decrypt"
  description = "Decypt step Name  (e.g. `app` or `cluster`)."
}

variable "enable_tag_step" {
  type    = bool
  default = true
  description = "Set to false to prevent the step from creating tag step resources."  
}

variable "enable_delete_step" {
  type    = bool
  default = true
  description = "Set to false to prevent the step from creating delete step resources."    
}

variable "enable_custom_step" {
  type    = bool
  default = false
  description = "Set to false to prevent the step from creating custom step resources."    
}

variable "enable_copy_step" {
  type    = bool
  default = true
  description = "Set to false to prevent the step from creating copy step resources."    
}

variable "enable_decrypt_step" {
  type    = bool
  default = true
  description = "Set to false to prevent the step from creating decrypt step resources."    
}

variable "decrypt_overwrite_existing" {
  type    = any
  default = "TRUE"
  description = "(Optional) A flag that indicates whether or not to overwrite an existing file of the same name. The default is FALSE. Valid values are TRUE and FALSE."  
}

variable "copy_overwrite_existing" {
  type    = any
  default = ""
  description = "(Optional) A flag that indicates whether or not to overwrite an existing file of the same name. The default is FALSE. Valid values are TRUE and FALSE."  
}

variable "timeout_seconds" {
  type    = any
  default = "60"
  description = "(Optional) Timeout, in seconds, for the step."    
}

variable "user_name" {
  type        = string
  description = "User name for SFTP server."
  sensitive   = true
}

variable "s3_bucket_id" {
  type        = string
  description = "The landing directory (folder) for a user when they log in to the server using their SFTP client."
  sensitive   = true
}

variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket used for the transfer workflow"
  sensitive   = false
}

variable "workflow_description" {
  type        = string
  default     = "test-workflow"
  description = "(Optional) A textual description for the workflow."
}


variable "delete_step_source_location" {
  type        = any
  default     = "$${original.file}"
  description = ""
}

variable "copy_step_source_location" {
  type        = any
  default     = ""
  description = ""
}

variable "tag_step_source_location" {
  type        = any
  default     = ""
  description = ""
}

variable "custom_step_source_location" {
  type        = any
  default     = ""
  description = ""
}

variable "decrypt_step_source_location" {
  type        = any
  default     = "r "
  description = ""
}

variable "tag_key" {
  type        = any
  default     = ""
  description = "(Required) The name assigned to the tag that you create."
}

variable "tag_value" {
  type        = any
  default     = ""
  description = "(Required) The name assigned to the tag that you create."
}

variable "decrypt_bucket_name" {
  type        = string
  default     = ""
  description = "(Optional) The name assigned to the file when it was created in S3. You use the object key to retrieve the object."
}

variable "copy_bucket_name" {
  type        = string
  default     = ""
  description = "(Optional) The name assigned to the file when it was created in S3. You use the object key to retrieve the object."
}

variable "decrypt_bucket_file_key" {
  type        = string
  default     = ""
  description = "(Optional) The name assigned to the file when it was created in S3. You use the object key to retrieve the object."
}

variable "copy_bucket_file_key" {
  type        = string
  default     = ""
  description = "(Optional) The name assigned to the file when it was created in S3. You use the object key to retrieve the object."
}