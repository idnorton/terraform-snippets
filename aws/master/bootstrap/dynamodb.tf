# Create a DynamoDB table for storing our Terraform locks
module "dynamodb_table" {
  source = "terraform-aws-modules/dynamodb-table/aws"

  name     = "terraform-locks"
  hash_key = "LockID"

  read_capacity  = 20
  write_capacity = 20

  attributes = [{
    name = "LockID"
    type = "S"
  }]
}
