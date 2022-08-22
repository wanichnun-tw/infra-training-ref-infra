data "terraform_remote_state" "eks_state" {
  backend = "s3"
  config = {
    region = "ap-southeast-1"
    bucket = "infra-training-state-2022"
    profile = "tw"
    key = "${TF_VAR_team_name}/dev/microterra/eks"
  }
}

data "terraform_remote_state" "rds_state" {
  backend = "s3"
  config = {
    region = "ap-southeast-1"
    bucket = "infra-training-state-2022"
    profile = "tw"
    key = "${TF_VAR_team_name}/dev/microterra/rds"
  }
}
