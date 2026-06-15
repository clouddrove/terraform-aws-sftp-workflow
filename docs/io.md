## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`). | `list(any)` | `[]` | no |
| copy\_bucket\_file\_key | (Optional) The name assigned to the file when it was created in S3. You use the object key to retrieve the object. | `string` | `""` | no |
| copy\_bucket\_name | (Optional) The name assigned to the file when it was created in S3. You use the object key to retrieve the object. | `string` | `""` | no |
| copy\_overwrite\_existing | (Optional) A flag that indicates whether or not to overwrite an existing file of the same name. The default is FALSE. Valid values are TRUE and FALSE. | `any` | `""` | no |
| copy\_step\_name | Copy Step Name  (e.g. `app` or `cluster`). | `string` | `null` | no |
| copy\_step\_source\_location | n/a | `any` | `""` | no |
| custom\_step\_source\_location | n/a | `any` | `""` | no |
| decrypt\_bucket\_file\_key | (Optional) The name assigned to the file when it was created in S3. You use the object key to retrieve the object. | `string` | `""` | no |
| decrypt\_bucket\_name | (Optional) The name assigned to the file when it was created in S3. You use the object key to retrieve the object. | `string` | `""` | no |
| decrypt\_overwrite\_existing | (Optional) A flag that indicates whether or not to overwrite an existing file of the same name. The default is FALSE. Valid values are TRUE and FALSE. | `any` | `"TRUE"` | no |
| decrypt\_step\_name | Decypt step Name  (e.g. `app` or `cluster`). | `string` | `"test-decrypt"` | no |
| decrypt\_step\_source\_location | n/a | `any` | `"r "` | no |
| delete\_step\_name | Delete step Name  (e.g. `app` or `cluster`). | `string` | `null` | no |
| enable\_copy\_step | Set to false to prevent the step from creating copy step resources. | `bool` | `true` | no |
| enable\_custom\_step | Set to false to prevent the step from creating custom step resources. | `bool` | `false` | no |
| enable\_decrypt\_step | Set to false to prevent the step from creating decrypt step resources. | `bool` | `true` | no |
| enable\_delete\_step | Set to false to prevent the step from creating delete step resources. | `bool` | `true` | no |
| enable\_tag\_step | Set to false to prevent the step from creating tag step resources. | `bool` | `true` | no |
| enable\_workflow | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "environment",<br>  "name"<br>]</pre> | no |
| managedby | ManagedBy, eg 'CloudDrove'. | `string` | `"hello@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-aws-sftp"` | no |
| tag\_key | (Required) The name assigned to the tag that you create. | `any` | `""` | no |
| tag\_step\_name | Tage step Name  (e.g. `app` or `cluster`). | `string` | `null` | no |
| tag\_step\_source\_location | n/a | `any` | `""` | no |
| tag\_value | (Required) The name assigned to the tag that you create. | `any` | `""` | no |
| timeout\_seconds | (Optional) Timeout, in seconds, for the step. | `any` | `"60"` | no |
| workflow\_description | (Optional) A textual description for the workflow. | `string` | `"test-workflow"` | no |

## Outputs

| Name | Description |
|------|-------------|
| tags | A mapping of tags to assign to the resource. |
| workflow\_arn | The Workflow arn. |
| workflow\_id | The Workflow id. |

