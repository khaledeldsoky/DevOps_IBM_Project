# 🚀 DevOps IBM Full

A hands-on DevOps learning repository covering core DevOps tools and practices including
Git, Linux, Docker, Kubernetes, Terraform, Ansible, CI/CD, and automation scripts.

This project is designed to help you **learn by doing** through real-world examples and labs.



## 🔍 Overview

This repository provides practical DevOps labs and automation examples inspired by
IBM DevOps learning paths.

You will learn how to:

- Manage source code with Git & GitHub
- Automate tasks using Bash and Ansible
- Provision infrastructure using Terraform
- Build and run containers with Docker
- Deploy and manage applications on Kubernetes
- Apply DevOps best practices end-to-end

## 📥 Prerequisites

Before using this project, make sure you have:

- Linux environment (Ubuntu recommended)
- Git
- Terraform
- Ansible
- Access to a cloud provider 

## 💻 Tools You’ll Use

| Tool | Purpose |
|----|----|
| Git & GitHub | Version control |
| Linux & Bash | OS & scripting |
| Kubernetes | Container orchestration |
| Terraform | Infrastructure as Code |
| Ansible | Automation & configuration |



## 📁 Repository Structure

```text
DevOps_IBM-Full/
├── Ansible/           # Automation playbooks & configuration
├── Terraform/         # Infrastructure as Code modules
├── bash/              # Bash automation scripts
└── README.md
```

Each folder focuses on **one DevOps concept** and contains scripts or configuration files that you can **run, modify, and experiment with**.

## 🌩️ Using IBM Cloud

If you are using **IBM Cloud**, you must export your API key before running Terraform.

Add your IBM Cloud API key to your `~/.bashrc` file:

```bash
export IBMCLOUD_API_KEY="your_api_key_here"
```

Then reload your shell:

```bash
source ~/.bashrc
```

This allows Terraform to authenticate and provision resources in IBM Cloud.


## 1️⃣ Terraform – Infrastructure as Code 🌍


## 🧱 Terraform Modules Structure

This project uses **Terraform modules** to make the code:

- ✔ More readable  
- ✔ Reusable  
- ✔ Organized  
- ✔ Scalable  
- ✔ Easy to maintain  

Using modules allows us to create multiple resources using clean and structured code.

Inside the `modules/` folder, you will find three main modules:

---

### 🖥️ Compute Module

The **Compute** module is responsible for:

- Creating virtual machine instances  
- Managing compute configurations  
- Provisioning server resources  

---

### 🌐 Network Module

The **Network** module is responsible for:

- Creating the VPC  
- Creating subnets  
- Managing networking components  
- Handling routing and connectivity  

---

### 🔐 Security Module

The **Security** module is responsible for:

- Creating SSH keys  
- Creating security groups  
- Managing firewall rules  
- Controlling instance access  

---

## 🔑 Important: Create SSH Key Before Running Terraform

Before running Terraform:

1. Create your SSH key manually.
2. Add the SSH key path inside your `terraform.tfvars` file.

Example:

```hcl
ssh_key_path = "/home/user/.ssh/id_rsa.pub"
```

Terraform will use this key when provisioning compute instances.

---

## 🚀 Running Terraform

To provision your infrastructure, run:

```bash
terraform apply -var-file=Environments/Prod/terraform.tfvars
```

This command will:

- ✔ Load production variables  
- ✔ Create network resources  
- ✔ Create compute instances  
- ✔ Configure security components  

---

## 2️⃣ Ansible – Automation & Configuration ⚙️

## ⚙️ Running Ansible

After Terraform finishes provisioning the infrastructure, configure the servers using Ansible:

```bash
ansible-playbook main.yaml
```

Ansible will:

- ✔ Install required packages  
- ✔ Configure the system  
- ✔ Deploy applications  
- ✔ Prepare the environment  

---

## 🧠 Infrastructure Workflow

The recommended workflow:

1. Export IBM Cloud API key  
2. Create SSH key  
3. Configure `terraform.tfvars`  
4. Run Terraform  
5. Run Ansible  

✨ Happy Learning & Automating! ✨
