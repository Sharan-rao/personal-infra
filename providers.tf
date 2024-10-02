terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.69.0"
    }
  }

  backend "s3" {
    bucket         = "bknd-tf"  # Name of the S3 bucket where the state will be stored.
    key            = "state/terraform.tfstate" # Path within the bucket where the state will be read/written.
    region         = "ap-south-1" # AWS region of the S3 bucket.
    dynamodb_table = "terraform-lock" # DynamoDB table used for state locking.
    encrypt        = true  # Ensures the state is encrypted at rest in S3.
  }
}

provider "aws" {
  region = "ap-south-1"
}