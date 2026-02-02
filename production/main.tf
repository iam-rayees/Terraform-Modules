provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "rayeez-terra-bucket-01"
    key    = "production.tfstate"
    region = "us-east-1"
  }
}
