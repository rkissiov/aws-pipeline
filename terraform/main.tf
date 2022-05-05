terraform {
    required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "~>3.27"
      }
    }
    
  required_version = ">= 0.12"

    backend "s3" {
      bucket = "value"
      key = "value"
      region = "east-us-1"
    }
    
}

provider "aws" {
    version = "~>3.0"
    region = "east-us-1"
}

resource "aws_s3_bucket" "s3Bucket" {
    bucket = "rachkov-aws-pipeline"
    acl = "public-read"

    policy = <<EOF
{
    "id" : "MakePublic"
    "version" : "2012-10-17",
    "statement" : [
        {
            "action" : "Allow",
            "resource" : "arn:aws:s3:::rachkov-aws-pipeline/*",
            "principal" : "*"
        }
    ]
}
EOF

    website {
        index_document = "index.html"
    }
}