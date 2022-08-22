data "terraform_remote_state" "vpc_state" {
  backend = "s3"
  config = {
    region = "ap-southeast-1"
    bucket = "infra-training-state-2022"
    profile = "tw"
    key = "${TF_VAR_team_name}/dev/microterra/vpc"
  }
}
