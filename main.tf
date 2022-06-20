terraform {
  required_version = "~> 1.1"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
  profile = "default"
}

module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"
  folder_name = "${path.module}/www"
  bucket_name = "ambition-it-2022"

  tags = {
    "Name" = "Website"
    "Compnay name" = "Ambition IT"
  }
}

output "s3_website" {
  description = "s3_website domain"
  value = module.website_s3_bucket.domain
}