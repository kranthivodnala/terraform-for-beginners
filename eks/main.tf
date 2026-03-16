# Create EKS Cluster with AWS as a profile instead of access key and one node group
provider "aws" {
  profile = "default"
  region  = var.region
}


resource "aws_eks_cluster" "sample-devops-cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.eks_version

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  enabled_cluster_log_types = var.cluster_log_types

  tags = var.tags
}

resource "aws_eks_node_group" "sample-devops-node-group" {
  cluster_name    = aws_eks_cluster.sample-devops-cluster.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  instance_types = var.node_instance_types
  disk_size      = var.disk_size
  tags           = var.tags
}

# --- Best Practices ---
# - Attach security groups to EKS cluster and node group for least privilege
# - Use IAM roles with minimal permissions for EKS and node group
# - Enable encryption for secrets (KMS)
# - Consider using launch templates for advanced node configuration

output "cluster_endpoint" {
  value = aws_eks_cluster.sample-devops-cluster.endpoint
}

output "cluster_certificate_authority" {
  value = aws_eks_cluster.sample-devops-cluster.certificate_authority[0].data
}

output "node_group_arn" {
  value = aws_eks_node_group.sample-devops-node-group.arn
}
