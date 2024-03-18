module "eks" {
  source = "../eks"

  region       = "us-east-2"
  aws_profile  = "default"
  cluster_name = "test_cluster"


}
