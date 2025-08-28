variable "state_bucket_name" {
  description = "S3 bucket name for Terraform state"
  type        = string
}


variable "dynamodb_table_name" {
  description = "DynamoDB table name for state locking"
  type        = string
}






