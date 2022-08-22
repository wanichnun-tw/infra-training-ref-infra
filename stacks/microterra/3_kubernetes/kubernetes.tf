data "aws_eks_cluster" "default" {
  name = data.terraform_remote_state.eks_state.outputs.eks.cluster_id
}

data "aws_eks_cluster_auth" "default" {
  name = data.terraform_remote_state.eks_state.outputs.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.default.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.default.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.default.token
}

locals {
  application-ns-name = "application"
  team        = var.team_name
  stack       = "terralith"
  environment = var.environment
  tags = {
    team        = local.team
    stack       = local.stack
    environment = local.environment
  }
}

resource "kubernetes_namespace_v1" "application" {
  metadata {
    labels = merge(local.tags,{
      owner = "terraform"
    })
    name = local.application-ns-name
  }
}

resource "kubernetes_secret_v1" "app-a-rds-creds" {
  depends_on = [kubernetes_namespace_v1.application]
  metadata {
    name = "app-a-db"
    namespace = local.application-ns-name
  }
  data = {
    db_name = data.terraform_remote_state.rds_state.outputs.rds.cluster_database_name,
    db_endpoint = data.terraform_remote_state.rds_state.outputs.rds.cluster_endpoint,
    db_username = data.terraform_remote_state.rds_state.outputs.rds.cluster_master_username,
    db_password = data.terraform_remote_state.rds_state.outputs.rds.cluster_master_password,
  }
}
