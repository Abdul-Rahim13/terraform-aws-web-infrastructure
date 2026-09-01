# 🚀 Production-Style AWS Web Server Infrastructure with Terraform

A beginner-friendly, production-style AWS infrastructure project built using **Terraform**. This project provisions a highly structured AWS networking environment with a VPC, public subnets, routing, security controls, SSH access, and EC2 web servers.

The goal of this project is to understand how Terraform can be used to provision and manage AWS infrastructure as code.

---

## 🏗️ Architecture

```text
                           AWS
                            │
                            ▼
                    ┌───────────────┐
                    │      VPC      │
                    │ 10.0.0.0/16   │
                    └───────┬───────┘
                            │
                ┌───────────┴───────────┐
                │                       │
                ▼                       ▼
        ┌───────────────┐       ┌───────────────┐
        │ Public Subnet │       │ Public Subnet │
        │ 10.0.1.0/24   │       │ 10.0.2.0/24   │
        │ us-east-1a    │       │ us-east-1b    │
        └───────┬───────┘       └───────┬───────┘
                │                       │
                ▼                       ▼
        ┌───────────────┐       ┌───────────────┐
        │    EC2 #1     │       │    EC2 #2     │
        │ Web Server    │       │ Web Server    │
        └───────┬───────┘       └───────┬───────┘
                │                       │
                └───────────┬───────────┘
                            │
                    ┌───────▼────────┐
                    │ Security Group │
                    │                │
                    │ HTTP : 80      │
                    │ SSH  : 22      │
                    └────────────────┘
                            │
                    ┌───────▼────────┐
                    │ Internet       │
                    │ Gateway        │
                    └────────────────┘
```

---

## 🎯 Project Objectives

This project demonstrates how to:

* Build AWS infrastructure using Terraform
* Create a custom VPC
* Create multiple public subnets
* Configure an Internet Gateway
* Configure route tables and routes
* Associate route tables with subnets
* Configure AWS Security Groups
* Create and manage SSH key pairs
* Launch EC2 instances
* Automatically install and configure a web server
* Use Terraform variables and outputs
* Use AWS data sources
* Manage infrastructure using Terraform state

---

## 🛠️ Technologies Used

| Technology       | Purpose                |
| ---------------- | ---------------------- |
| Terraform        | Infrastructure as Code |
| AWS              | Cloud infrastructure   |
| Amazon VPC       | Networking             |
| EC2              | Web servers            |
| Internet Gateway | Internet connectivity  |
| Security Groups  | Network security       |
| SSH              | Server access          |
| Apache           | Web server             |
| Git & GitHub     | Version control        |

---

## 📁 Project Structure

```text
terraform-aws-web-infrastructure/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── .gitignore
└── README.md
```

### File Responsibilities

**`main.tf`**

Contains the AWS infrastructure resources such as:

* VPC
* Internet Gateway
* Subnets
* Route Table
* Routes
* Route Table Associations
* Security Group
* SSH Key Pair
* EC2 instances

**`variables.tf`**

Contains Terraform variable definitions.

**`terraform.tfvars`**

Contains environment-specific values such as:

* AWS region
* Availability zones
* Public IP
* SSH public key

**`outputs.tf`**

Contains useful information returned after deployment, such as:

* VPC ID
* EC2 instance IDs
* Public IP addresses
* Public DNS names

---

## 🌐 AWS Network Configuration

### VPC

```text
CIDR: 10.0.0.0/16
```

### Public Subnet 1

```text
CIDR: 10.0.1.0/24
Availability Zone: us-east-1a
```

### Public Subnet 2

```text
CIDR: 10.0.2.0/24
Availability Zone: us-east-1b
```

Both subnets are configured to automatically assign public IPv4 addresses to instances launched inside them.

---

## 🔐 Security Configuration

The Security Group allows:

| Protocol | Port | Source             | Purpose  |
| -------- | ---: | ------------------ | -------- |
| TCP      |   80 | `0.0.0.0/0`        | HTTP     |
| TCP      |   22 | My Public IP `/32` | SSH      |
| All      |  All | `0.0.0.0/0`        | Outbound |

SSH access is restricted to a specific public IP rather than exposing port 22 to the entire internet.

> **Security Note:** The IP address and SSH credentials used locally should not be exposed in a public repository.

---

## 🔑 SSH Key Pair

An SSH key pair is created for EC2 access.

The public key is provided to AWS through Terraform.

The private key remains local and is **never committed to GitHub**.

Example:

```text
terraform-web-server
terraform-web-server.pub
```

---

## 🚀 Terraform Workflow

Initialize the Terraform project:

```bash
terraform init
```

Format the configuration:

```bash
terraform fmt
```

Validate the configuration:

```bash
terraform validate
```

Preview infrastructure changes:

```bash
terraform plan
```

Create the infrastructure:

```bash
terraform apply
```

View outputs:

```bash
terraform output
```

Destroy the infrastructure when finished:

```bash
terraform destroy
```

---

## 🧪 Verification

After deployment, verify the following in AWS:

### VPC

* VPC exists
* CIDR is `10.0.0.0/16`

### Subnets

* `10.0.1.0/24` in `us-east-1a`
* `10.0.2.0/24` in `us-east-1b`

### Routing

* Route table exists
* Default route points to the Internet Gateway
* Both subnets are associated with the route table

### Security Group

* HTTP port 80 is accessible
* SSH port 22 is restricted to the configured IP
* Outbound traffic is allowed

### EC2

* Two EC2 instances are running
* Instances are located in different Availability Zones
* Instances have public IPv4 addresses
* SSH access works

### Web Server

Open the public IP of each EC2 instance:

```text
http://EC2_PUBLIC_IP
```

Expected page:

```text
Terraform Web Server

Infrastructure created using Terraform
```

---

## 📚 Terraform Concepts Practiced

This project covers the following Terraform concepts:

* Terraform configuration
* Providers
* Resources
* Data sources
* Variables
* `.tfvars`
* Resource references
* Dependencies
* Outputs
* Terraform state
* AWS provider
* VPC networking
* Security Groups
* EC2
* SSH key pairs
* Provisioners
* `terraform init`
* `terraform fmt`
* `terraform validate`
* `terraform plan`
* `terraform apply`
* `terraform destroy`

---

## 🔮 Future Improvements

This project is intentionally built in stages.

Future improvements will include:

* [ ] Terraform modules
* [ ] Remote Terraform state
* [ ] S3 backend
* [ ] State locking
* [ ] HCP Terraform
* [ ] GitLab CI/CD
* [ ] Automated `terraform fmt`
* [ ] Automated `terraform validate`
* [ ] Automated `terraform plan`
* [ ] Approval-based `terraform apply`
* [ ] Terraform security scanning
* [ ] Environment separation
* [ ] Development / staging / production environments
* [ ] Monitoring and logging
* [ ] Load Balancer
* [ ] Auto Scaling

---

## 🎓 What I Learned

Through this project, I learned how Terraform can be used to define AWS infrastructure as code instead of manually creating resources through the AWS Console.

I also practiced connecting AWS networking components together and using Terraform resource references to build dependencies between infrastructure components.

---

## 👨‍💻 Author

**Abdul Rahim**

Full Stack Developer | Cloud & DevOps Enthusiast

GitHub: `Add your GitHub profile here`

LinkedIn: `Add your LinkedIn profile here`

---

## ⭐ If You Found This Useful

Feel free to explore the repository and follow the project as it evolves from a beginner Terraform deployment into a more production-oriented Infrastructure as Code setup.
