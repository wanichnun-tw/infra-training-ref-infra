output "eks_master_subnets" {
  value = local.eks_master_subnets
}
output "eks_node_subnets" {
  value = local.eks_node_subnets
}
output "rds_endpoint" {
  value = module.cluster.cluster_endpoint
}
