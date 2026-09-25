# Recommended Tools

This document lists the tools referenced by the Engineering Playbook. Install only the tools required for the topic you are working on.

## Development Tools

- **Visual Studio Code**: A lightweight but powerful source code editor that supports various programming languages and extensions.
- **Git**: A version control system that allows for tracking changes in source code during software development.
- **PowerShell**: The shell used by the PowerShell and Windows automation notes.
- **Bash**: The shell used by the Bash automation notes.

## Testing Tools

- **.NET SDK**: The SDK for building and testing .NET applications.
- **kubectl**: The command-line client for Kubernetes and AKS operations.

## Deployment Tools

- **Docker**: A platform for developing, shipping, and running applications in containers, ensuring consistency across environments.
- **Kubernetes**: An orchestration system for automating the deployment, scaling, and management of containerized applications.
- **Azure CLI**: The command-line interface used for Azure resources and Azure Container Registry operations.

## Monitoring Tools

- **Prometheus**: An open-source monitoring and alerting toolkit designed for reliability and scalability.
- **Grafana**: A visualization tool that integrates with various data sources to provide insights into application performance.

## Secrets Management

- **SOPS**: Encrypts and decrypts configuration files using the PowerShell helpers in `PowerShell/Sops/`.
- **Azure Key Vault**: Stores the key used by the SOPS workflow.