provider "aws" {
    region = var.region
}

terraform {
    
    backend "s3" {
        bucket = "jenkyjawnt"
        key = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "tfbackup"
    }
}