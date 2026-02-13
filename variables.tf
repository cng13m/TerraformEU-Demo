variable "region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

# Networking

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}

# EC2

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ec2_key_name" {
  description = "EC2 key pair name"
  type        = string
  default     = null
  nullable    = true
}

variable "associate_public_ip" {
  description = "Associate public IP to EC2"
  type        = bool
}

# S3

variable "s3_versioning" {
  description = "Enable S3 versioning"
  type        = bool
}

variable "s3_force_destroy" {
  description = "Force destroy S3 bucket"
  type        = bool
}
