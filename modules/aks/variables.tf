variable "resource_group_name" {
    description = "The name of the resource group"
    type        = string
}

variable "location" {
    description = "The Azure region to deploy the AKS cluster"
    type        = string
}

variable "aks_cluster_name" {
    description = "The name of the AKS cluster"
    type        = string
}

variable "node_count" {
    description = "The number of nodes in the AKS cluster"
    type        = number
}

variable "vm_size" {
    description = "The size of the virtual machines in the AKS cluster"
    type        = string
}

variable "kubernetes_version" {
    description = "The version of Kubernetes to use for the AKS cluster"
    type        = string
}
