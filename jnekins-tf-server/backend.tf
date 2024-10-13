terraform {
  backend "s3" {
    bucket = "nayan-backend-bucnket-tf"
    region = "ap-south-1"
    key = "end-to-end-threetire-project"
    dynamodb_table = "Lock-File"
    encrypt = true
  }
  required_version = ">= 0.13.0"
  required_providers {
    aws = {
        version = ">= 2.7.0"
        source = "hashicorp/aws"
    }
  }
}