# Azure Container Registry

## Purpose

Inspect repositories and image metadata in Azure Container Registry.

## Prerequisites

- Azure CLI installed and authenticated.
- Access to the target registry and repository.

## Workflow

```bash
az acr repository show-manifests --name <registry-name> --repository <repository-name> --query "[].{Tag: tags[0], Size: imageSize, Created: timestamp}" --output table

az acr manifest list-metadata --registry <registry-name> --name <repository-name> --query "[].{Tag: tags[0], Size: imageSize, Created: createdTime}"
```

Use placeholders for registry and repository names. Verify the subscription and tenant before running commands against shared environments.
