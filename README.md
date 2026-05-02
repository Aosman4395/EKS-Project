## 📌 Title
Production-Grade EKS Deployment with GitOps & CI/CD Automation

## 📚 Contents
- [Tech stack](#️-tech-stack)
- [Docker Image Build & Local Validation](#-step-1--docker-image-build--local-validation)
- [Infrastructure as Code (Terraform Setup)](#-step-2--infrastructure-as-code-terraform-setup)
- [CI/CD Pipeline & Security Scanning](#-step-3--cicd-pipeline--security-scanning)

---

## 🛠️ Tech Stack
- AWS (EKS, VPC, ALB, IAM)
- Terraform (Infrastructure as Code)
- Docker (Containerisation)
- Kubernetes (EKS)
- Helm (Application Packaging)
- ArgoCD (GitOps Deployment)
- GitHub Actions (CI/CD)
- Prometheus & Grafana (Monitoring)
- ExternalDNS & Cert-Manager (DNS & TLS Automation)

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

## ⚙️ Step 3 – CI/CD Pipeline & Security Scanning

A CI/CD pipeline was implemented using GitHub Actions to automate the build, security validation, and deployment process.

The pipeline is triggered on changes to the application and infrastructure code, ensuring that all updates are consistently validated and deployed without manual intervention.

Security and quality checks were integrated early in the pipeline to enforce best practices and prevent misconfigurations from reaching production.

The pipeline includes:

- **Terraform Validation** to ensure infrastructure code is syntactically correct  
- **Checkov** for Infrastructure as Code security scanning  
- **Trivy** for container image vulnerability scanning  
- **Docker Build & Push** to Amazon ECR using SHA-based image tagging  
- **AWS Authentication via OIDC** for secure, keyless access  
- **Terraform Plan & Apply** executed through the pipeline (post-bootstrap)  

Additional enhancements:

- **Concurrency control** to prevent overlapping infrastructure deployments  
- **Lock timeout configuration** to handle state contention safely  
- **Separation of bootstrap and main infrastructure execution**  
- **Production-style workflow** where all changes are applied through CI/CD rather than manually  

This ensures that every deployment is secure, repeatable, and fully automated, aligning with production DevOps best practices.