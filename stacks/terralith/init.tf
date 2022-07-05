terraform {
  backend "s3" {
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}
