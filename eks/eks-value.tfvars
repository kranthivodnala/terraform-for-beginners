region         = "us-east-1"
cluster_name   = "sample-devops-cluster"
node_group_name = "sample-devops-node-group"
ssh_key_name   = "" // Replace pem file
desired_size   = 2
max_size       = 3
min_size       = 1
subnet_ids     = [
  "subnet-0499bde9d380e7e81",
  "subnet-0205fff96abc57b41"
]

# Enhanced variables
eks_version    = "1.29"
node_instance_types = ["t3.medium"]
disk_size      = 20
tags = {
  Environment = "dev"
  Owner       = "cloud-team"
}
cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
