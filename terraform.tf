terraform {

  cloud {
    organization = "test-lab-ltimossi"

    workspaces {
      name = "terraformcloud-AWS"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.0"
    }
  }

  required_version = ">= 1.3.0"
}
