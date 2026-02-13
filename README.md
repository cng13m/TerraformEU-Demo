# Terraform EU Demo Project

This repository is a modular Terraform demo that provisions core AWS infrastructure in `eu-central-1`:

- Networking (`modules/network`)
- Compute (`modules/ec2`)
- Storage (`modules/s3`)

The current example settings deploy a `dev` environment.

## What this project creates

### 1) Network module

Creates:
- 1 VPC
- 1 Internet Gateway
- 2 public subnets
- 2 private subnets
- 1 public route table (with `0.0.0.0/0` to IGW)
- 1 NAT Gateway + 1 Elastic IP
- 1 private route table (with `0.0.0.0/0` to NAT)

### 2) EC2 module

Creates:
- 1 Security Group (ingress `22` and `80` from anywhere, all egress allowed)
- 1 EC2 instance in the first public subnet
- AMI is dynamically selected as the most recent Amazon Linux 2023 image

### 3) S3 module

Creates:
- 1 S3 bucket with account-and-region-based unique naming
- Bucket versioning enabled/suspended from variable
- `force_destroy` behavior controlled by variable

## Project structure

```text
.
|-- data.tf
|-- main.tf
|-- providers.tf
|-- variables.tf
|-- terraform.tfvars
`-- modules/
    |-- network/
    |-- ec2/
    `-- s3/
```

## Prerequisites

- Terraform `>= 1.5.0`
- AWS credentials configured in your shell/profile
- Access to deploy networking, EC2, and S3 resources in your AWS account

## How to run

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

To destroy:

```bash
terraform destroy
```

## Variables in this demo

Configured in `terraform.tfvars`:

- Region: `eu-central-1`
- Environment: `dev`
- VPC CIDR: `10.0.0.0/16`
- Public subnets: `10.0.1.0/24`, `10.0.2.0/24`
- Private subnets: `10.0.3.0/24`, `10.0.4.0/24`
- EC2 type: `t3.micro`
- S3 versioning: `true`
- S3 force destroy: `true`

## Important notes

- Security: SSH (`22`) and HTTP (`80`) are open to `0.0.0.0/0`. Restrict these CIDRs for non-demo use.
- Cost: NAT Gateway and EC2 incur charges; S3 may incur storage/request charges.
- State: Local state files (`terraform.tfstate*`) are generated. For team usage, move to a remote backend (for example S3 + DynamoDB lock).
- Lock file: `.terraform.lock.hcl` should be committed for provider version consistency.

