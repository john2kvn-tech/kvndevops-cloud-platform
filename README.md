# End-to-End DevOps Platform on Google Cloud

## Overview
This project demonstrates an end-to-end DevOps workflow on Google Cloud using Terraform, Docker, Artifact Registry, Cloud Run, GitHub Actions, and Kubernetes foundations.

## Tech Stack
- Google Cloud Platform
- Terraform
- Docker
- Artifact Registry
- Cloud Run
- Kubernetes / GKE
- GitHub Actions
- Jenkins
- Python Flask

## What I Built
- Provisioned GCP infrastructure using Terraform
- Created VPC and subnet architecture
- Built a GKE cluster foundation
- Developed a Python Flask application
- Containerized the app using Docker
- Pushed the image to Artifact Registry
- Deployed the app to Cloud Run
- Configured GitHub Actions CI/CD for automated deployment

## Live Application
Cloud Run URL:
`https://kvn-demo-app-204894192447.us-central1.run.app`

Note: Access is authenticated due organization policy restrictions.

## CI/CD Flow
GitHub Push → GitHub Actions → Google Cloud Auth → Cloud Run Deploy

## Infrastructure Flow
Terraform → VPC → Subnet → GKE Cluster Foundation

## Key Learning
This project involved real enterprise-style troubleshooting around IAM, Artifact Registry access, Cloud Run deployment, and organization policy restrictions.