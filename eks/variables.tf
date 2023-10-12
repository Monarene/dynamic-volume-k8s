// Provided at runtime

variable "region" {
  type = string
  description = "us-east-2"
  default = "us-east-2"
}


variable "aws_profile" {
  type = string
  description = "AWS profile"
}

variable "author" {
  type = string
  description = "Created by"
  default = "monarene"
}

// Default values

variable "cluster_name" {
  type = string
  description = "EKS cluster name"
  default = "test_cluster"
}
