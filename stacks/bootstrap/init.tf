terraform {
  backend "s3" {
    bucket = "infra-training-state-2022"
    region = "ap-southeast-1"
    key = "ankit/bootstrap"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}
