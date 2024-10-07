output "tags" {
  value       = module.labels.tags
  description = "A mapping of tags to assign to the resource."
}

output "workflow_id" {
  value       = join("", aws_transfer_workflow.example[*].id)
  description = "The Workflow id."
}
output "workflow_arn" {
  value       = join("", aws_transfer_workflow.example[*].arn)
  description = "The Workflow arn."
}
