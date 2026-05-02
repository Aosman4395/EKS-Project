## 📌 Title
Production-Grade EKS Deployment with GitOps & CI/CD Automation

## 🛠️ Tech Stack
AWS (EKS, VPC, ALB, IAM)
Terraform (Infrastructure as Code)
Docker (Containerisation)
Kubernetes (EKS)
Helm (Application Packaging)
ArgoCD (GitOps Deployment)
GitHub Actions (CI/CD)
Prometheus & Grafana (Monitoring)
ExternalDNS & Cert-Manager (DNS & TLS Automation)

## 📖 Project Overview
This project demonstrates a production-grade Kubernetes deployment on AWS EKS using modern DevOps practices.

Infrastructure is provisioned using Terraform modules, while CI/CD pipelines automate Docker image builds and deployments.

GitOps is implemented using ArgoCD, which continuously syncs Kubernetes manifests from GitHub to the cluster.

The platform includes automated DNS management and TLS certificates, along with monitoring via Prometheus and Grafana.

The result is a fully automated, secure, and scalable cloud-native application deployment accessible over HTTPS.

## 🐳 Step 1 – Docker Image Build & Local Validation

The application was first containerised and tested locally before any cloud infrastructure was introduced.

A Docker image was built from the application source code to confirm that the Dockerfile, dependencies, and runtime configuration were working correctly.

The container was then run locally and exposed through a local port to verify that the application started successfully and could be accessed in the browser.

## 🏗️ Step 2 – Infrastructure as Code (Terraform Setup)

The AWS infrastructure was designed and implemented using Terraform, following a modular and production-style approach.

A dedicated bootstrap phase was introduced to resolve the “chicken-and-egg” problem of remote state management. This bootstrap configuration provisions the S3 backend required for storing Terraform state securely. The bootstrap was executed manually once, after which all subsequent infrastructure changes are handled via CI/CD.

The main infrastructure was structured using reusable Terraform modules, separating concerns and improving maintainability. These modules were wired together in the root configuration to provision:

- VPC with public and private subnets
- Security groups for controlled network access
- Application Load Balancer (ALB)
- EKS cluster and supporting resources

The configuration ensures proper dependency management through Terraform’s internal graph, allowing resources to be created in the correct order without manual intervention.

Key outcomes of this step:

- Remote state configured using S3 with locking enabled
- Modular Terraform structure for scalability and reuse
- Clean separation between bootstrap and main infrastructure
- All infrastructure components fully defined and connected
- Environment ready for CI/CD-driven deployments