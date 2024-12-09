# terraform-aws-iac
---

# Infrastructure as Code (IaC) with Terraform for AWS

This project implements an EC2 instance on AWS using Terraform. It is configured to launch an EC2 instance with Amazon Linux 2, an instance type of `t2.micro`, and the AWS region `us-east-1`. This repository is designed to be used in a development environment, enabling the rapid deployment of cloud resources using Terraform.

---

## **Table of Contents**

1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Initial Setup](#initial-setup)
4. [Usage](#usage)
   - [Step 1: Clone the Repository](#step-1-clone-the-repository)
   - [Step 2: Initialize Terraform](#step-2-initialize-terraform)
   - [Step 3: Validate the Configuration](#step-3-validate-the-configuration)
   - [Step 4: Apply the Execution Plan](#step-4-apply-the-execution-plan)
   - [Step 5: Destroy the Infrastructure](#step-5-destroy-the-infrastructure)
5. [Maintenance](#maintenance)
   - [Update Resources](#update-resources)
   - [Monitoring and Management](#monitoring-and-management)
6. [Troubleshooting](#troubleshooting)
   - [Common Errors](#common-errors)
   - [Error Resolution](#error-resolution)
7. [Notes](#notes)

---

## **Introduction**

This project uses **Terraform** to create infrastructure on **AWS**. Specifically, it is used to launch an EC2 instance using Amazon Linux 2, with a minimum configuration (`t2.micro`) and the region set to `us-east-1`. Terraform allows you to manage infrastructure as code, making it easier to create, update, and destroy cloud resources in an automated way.

---

## **Prerequisites**

Before you run this project, ensure you have the following:

- **AWS Account**: You need an active AWS account to create resources.
- **Terraform**: You must have Terraform installed on your local machine. Follow the installation instructions from [Terraform’s official documentation](https://www.terraform.io/downloads.html).
- **AWS Credentials**: Set up your AWS credentials so Terraform can interact with your cloud resources. You can configure them using the `aws configure` command from AWS CLI.

---

## **Initial Setup**

1. **Clone the Repository**

   Clone this repository to your local machine:
   ```bash
   git clone https://github.com/darkgirlchan/terraform-aws-iac.git
   cd terraform-aws-iac
   ```

2. **Configure Variables**

   The `variables.tf` file contains the variables that configure your AWS environment:
   
   ```hcl
   variable "aws_region" {
     default = "us-east-1"
   }

   variable "ami_id" {
     default = "ami-0c80e2b6ccb9ad6d1"
     description = "AMI ID for the instance."
   }

   variable "instance_type" {
     default     = "t2.micro"
     description = "AWS instance type."
   }
   ```
   You can customize these variables to fit your needs:
   - **aws_region**: Change it to another AWS region if needed, for example, `"eu-west-1"`.
   - **ami_id**: If you want to use a different AMI, find the AMI ID for your region and update it here.
   - **instance_type**: Change the instance type if you need more resources, such as `t3.medium`.

---

## **Usage**

### **Step 1: Clone the Repository**

To get started, clone this repository to your local machine:
```bash
git clone https://github.com/darkgirlchan/terraform-aws-iac.git
cd terraform-aws-iac
```

### **Step 2: Initialize Terraform**

Terraform needs to initialize the working directory and download the necessary providers:
```bash
terraform init
```

### **Step 3: Validate the Configuration**

Before running any Terraform plan, ensure that the configuration is valid:
```bash
terraform validate
```

### **Step 4: Apply the Execution Plan**

To create the infrastructure defined in the Terraform files, run the following command:
```bash
terraform plan -out=tfplan
terraform apply "tfplan"
```
This will apply the changes and create the EC2 instance. It will also display the result of the execution, including the public IP of the instance.

### **Step 5: Destroy the Infrastructure**

Once you no longer need the infrastructure, destroy it to avoid charges:
```bash
terraform destroy
```
This will remove all resources created by Terraform.

---

## **Maintenance**

### **Update Resources**

To make changes or update resources (e.g., change the instance type), simply edit the configuration files (`main.tf`, `variables.tf`), then run the following commands:
```bash
terraform plan
terraform apply
```

Terraform will determine what changes are required and automatically apply them.

### **Monitoring and Management**

Once the infrastructure is deployed, you can manage and monitor the EC2 instance using the AWS console or tools like **AWS CloudWatch** to view metrics and logs.

---

## **Troubleshooting**

### **Common Errors**

1. **AWS Authentication Error**:
   - If Terraform can't authenticate your credentials, make sure you’ve configured your AWS credentials using the following command:
     ```bash
     aws configure
     ```

2. **Error Validating Terraform Configuration**:
   - If you get validation errors, check the `.tf` files for any syntax errors.

### **Error Resolution**

- If errors persist, review the Terraform logs, which will provide more information about which resource is failing.
- Ensure that the AMI ID and region are configured correctly.

---

## **Notes**

- **AWS Free Tier**: If you're using the AWS Free Tier, make sure the created resources are eligible for the free tier (such as the `t2.micro` instance).
- **Costs**: Although this project uses minimal resources (`t2.micro`), it is always a good idea to check your AWS billing to ensure that no additional costs are incurred by using other services.

---

This user manual provides a complete guide for setting up, using, and maintaining the Terraform infrastructure on AWS. If you have any questions or need further assistance, feel free to consult the [official Terraform documentation](https://www.terraform.io/docs).