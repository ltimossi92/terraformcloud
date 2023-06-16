variable "region" {
  description = "AWS region"
  default     = "ap-southeast-2"
}

variable "ami" {
  description = "AMI of EC2"
  default = "ami-0d02292614a3b0df1"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "Provisioned by Terraform"
}

