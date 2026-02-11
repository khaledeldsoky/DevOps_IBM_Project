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
- Docker
- kubectl
- Terraform
- Ansible
- Helm (optional)
- Access to a cloud provider 

## 💻 Tools You’ll Use

| Tool | Purpose |
|----|----|
| Git & GitHub | Version control |
| Linux & Bash | OS & scripting |
| Docker | Containerization |
| Kubernetes | Container orchestration |
| Terraform | Infrastructure as Code |
| Ansible | Automation & configuration |
| Helm | Kubernetes package management |
| CI/CD | Build & deployment automation |



## 📁 Repository Structure

```text
DevOps_IBM-Full/
├── Ansible/           # Automation playbooks & configuration
├── Terraform/         # Infrastructure as Code modules
├── Kubernetes/        # K8s manifests and deployments
├── Docker/            # Dockerfiles & images
├── bash/              # Bash automation scripts
├── helm/              # Helm charts
└── README.md
```

Each folder focuses on **one DevOps concept** and contains scripts or configuration files that you can **run, modify, and experiment with**.



## 2️⃣ Terraform – Infrastructure as Code 🌍

Terraform is used in this project to **create, manage, and version infrastructure automatically** using code instead of manual setup.  
This approach is known as **Infrastructure as Code (IaC)** and allows you to treat infrastructure the same way you treat application code.

### 🔹 What Terraform models are included in this project

The Terraform configurations in this repository focus on building reusable and scalable infrastructure models, such as:

📌 **Network infrastructure**  
- Virtual Private Clouds (VPC)  
- Subnets  
- Networking components  

📌 **Compute resources**  
- Virtual machines  
- Worker nodes  
- Infrastructure needed to run applications  

📌 **Kubernetes-related infrastructure**  
- Resources required to support Kubernetes clusters  
- Infrastructure prepared for container orchestration  

📌 **Reusable Terraform modules**  
- Modular design for clean and organized code  
- Easy reuse across multiple environments  

### 🔹 Terraform workflow

```bash
cd Terraform
terraform init
terraform plan
terraform apply
```

## 🔹 What Terraform helps you achieve

✔ Track infrastructure changes safely  
✔ Recreate environments quickly  
✔ Apply consistent configurations  
✔ Destroy infrastructure when it is no longer needed  

---

## 3️⃣ Ansible – Automation & Configuration ⚙️

Ansible is used to **automate system configuration and application setup** after infrastructure is created.  
It ensures that servers are configured **consistently and repeatedly** without manual intervention.

### 🔹 What Ansible is used for in this project

🔧 Installing required packages and dependencies  
🔧 Configuring operating system settings  
🔧 Running automation scripts  
🔧 Deploying applications  
🔧 Managing and restarting services  

### 🔹 Running Ansible playbooks

```bash
cd Ansible
ansible-playbook -i inventory playbook.yml
```

✨ Happy Learning & Automating! ✨
