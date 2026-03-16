variable "region" {
  description = "AWS region to deploy resources in."
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "eks_version" {
  description = "Kubernetes version for the EKS cluster."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster."
  type        = list(string)
}

variable "cluster_log_types" {
  description = "List of EKS cluster log types to enable."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}

variable "node_group_name" {
  description = "Name of the EKS node group."
  type        = string
}

variable "node_instance_types" {
  description = "List of EC2 instance types for the node group."
  type        = list(string)
}

variable "disk_size" {
  description = "Disk size in GiB for worker nodes."
  type        = number
}

variable "ssh_key_name" {
  description = "SSH key name for node group access."
  type        = string
}

variable "desired_size" {
  description = "Desired number of worker nodes."
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes."
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes."
  type        = number
}
