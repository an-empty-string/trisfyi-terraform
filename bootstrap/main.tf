provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "tris-tf-state"
  acl = "private"
}
