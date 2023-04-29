// Provided at runtime

variable "region" {
  type = string
  description = "us-east-2"
}


variable "aws_profile" {
  type = string
  description = "AWS profile"
}

variable "author" {
  type = string
  description = "Created by"
}

// Default values

variable "cluster_name" {
  type = string
  description = "EKS cluster name"
}
