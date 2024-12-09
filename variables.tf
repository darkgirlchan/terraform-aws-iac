variable "aws_region" {
  default = "us-east-2"
  description = "Region where AWS resources will be deployed."
}

variable "ami_id" {
  default     = "ami-0c80e2b6ccb9ad6d1"
  description = "AMI image ID for the instance (Amazon Linux 2 on us-east-1)."
}

variable "instance_type" {
  default     = "t2.micro"
  description = "AWS Instance Type."
}
