# Bootstrap Initialization for Terraform Projects  

The **bootstrap** directory in this repository provides a reusable setup phase for any Terraform project. It automates the foundational steps required before deploying environments by:  

- Setting up **GitHub OIDC trust** with your AWS account (no hard-coded credentials).  
- Creating a **remote backend** (S3 bucket + DynamoDB table) for Terraform state management.  
- Dynamically generating the `backend.tf` file for your project’s root directory.  

This directory is **not a full infrastructure project**. Instead, it’s a template to automate the commonly manual bootstrap process. It retrieves your current AWS `account_id` using a Terraform data block and your GitHub repository name using the `gh` CLI. These values are then passed to `bootstrap/backend-setup/generate-backend-file.sh`, which creates the `backend.tf` automatically.  

---

## Diagram  

![Diagram](./bootstrap/bootstrap_diagram.png)  

---

## Requirements  

Before running the bootstrap, ensure the following tools are installed locally:  

- **Terraform v1.12.2**  
  [Install Terraform](https://developer.hashicorp.com/terraform/downloads)  

- **AWS CLI v6.7.0**  
  [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)  

- **GitHub CLI (`gh`)**  
  [Install GitHub CLI](https://cli.github.com/manual/installation)  

Ensure your AWS CLI is authenticated with appropriate credentials and that the `gh` CLI is connected to your GitHub account (`gh auth login`).  

---

## Features  

- **Remote Backend**  
  Creates an S3 bucket (state storage) and DynamoDB table (state locking).  

- **OIDC Trust**  
  Configures an IAM role with GitHub OIDC trust to enable secure, secretless authentication for pipelines.  

- **Multi-Environment Ready**  
  Supports environment-specific workspaces (e.g., `staging`, `production`) and includes a network validation module.  

---

## Getting Started  

### Step 1: Initialize Bootstrap  

Copy the `bootstrap` directory into your project repository, then run:  

```bash
cd bootstrap
make deploy-bootstrap
```  

This will:  
- Provision the S3 bucket and DynamoDB table.  
- Configure the IAM role with GitHub OIDC trust.  
- Auto-generate the `backend.tf` file in your root directory.  

### Step 2: Define Permissions  

Update the IAM permissions in:  

```bash
bootstrap/oidc/policies/permission-policy.json
```  

This file specifies which AWS resources GitHub Actions will be allowed to access.  

### Step 3: Tear Down (Optional)  

To remove the bootstrap resources:  

```bash
make delete-bootstrap
```  

---

## Author  

**Fekri Saleh**  
Email: fekri.saleh@ucalgary.ca  
[LinkedIn](https://linkedin.com/in/your-profile) | [GitHub](https://github.com/fekri600)  
