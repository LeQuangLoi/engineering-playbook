# Engineering Playbook

A personal engineering knowledge base for recording practical experience, reusable commands, operating procedures, lessons learned, and study notes.

This repository is a **playbook**, not an application. The root README is the overview and index. Detailed guidance belongs in the README or Markdown pages of the relevant component.

## Start Here

1. Read [Getting Started](docs/onboarding/getting-started.md) for the repository workflow.
2. Use [Documentation](docs/README.md) for shared engineering guidance.
3. Choose a component from the [Component Index](#component-index).
4. Open that component's README for detailed notes, commands, and links.

## Repository Structure

```text
engineering-playbook/
|-- README.md                 # Overview and component index
|-- docs/                     # Shared engineering guidance
|   |-- README.md             # Documentation index
|   |-- architecture/         # Repository boundaries and ownership
|   |-- best-practices/       # Shared standards
|   |-- onboarding/           # Setup guidance
|   |-- processes/            # Repeatable team workflows
|   `-- tools/                # Tool references
|-- Azure/                    # Azure, ARM, and Bicep
|-- CertificateExam/          # Certification study material
|-- Docker/                   # Container workflows
|-- Dotnet/                   # .NET development
|-- Kubernetes/               # Kubernetes and AKS operations
|-- PowerShell/               # PowerShell-specific automation
`-- Script/                   # Cross-platform shell scripts
```

## Component Index

| Component | Purpose | Entry point |
| --- | --- | --- |
| `docs/` | Shared architecture, standards, onboarding, processes, and tools | [Documentation](docs/README.md) |
| `Azure/` | Azure CLI, ARM/Bicep, and Azure Container Registry | [Azure README](Azure/README.md) |
| `CertificateExam/` | Azure certification study material | [Certificate Exam README](CertificateExam/README.md) |
| `Docker/` | Container build, runtime, and troubleshooting notes | [Docker README](Docker/README.md) |
| `Dotnet/` | .NET development, testing, packaging, and operations | [.NET README](Dotnet/README.md) |
| `Kubernetes/` | Kubernetes and AKS operational commands | [Kubernetes README](Kubernetes/README.md) |
| `PowerShell/` | PowerShell workflows and SOPS secret management | [PowerShell README](PowerShell/README.md) |
| `Script/` | Bash and PowerShell automation | [Scripts README](Script/README.md) |

## How To Use This Repository

The root README is an overview and index. It intentionally does not contain technology-specific commands or detailed procedures. Follow the [architecture overview](docs/architecture/overview.md) for ownership boundaries and the [coding standards](docs/best-practices/coding-standards.md) for documentation rules.

## Adding Experience

1. Identify the component that owns the experience.
2. Add or update its `README.md`.
3. Create a focused `.md` page when the subject is reusable.
4. Link the page from its parent README.
5. Check links, placeholders, secrets, and destructive commands before committing.
