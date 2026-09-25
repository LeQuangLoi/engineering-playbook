# Getting Started with the Engineering Playbook

This guide helps new team members find the repository content and prepare the tools needed to use it. The playbook has no application dependencies or build step.

## Prerequisites

Install the tools required for the topic you are using:

- **Git**: Version control and contribution workflow.
- **PowerShell**: Windows automation and the scripts in `PowerShell/` and `Script/Powershell/`.
- **Azure CLI**: Azure and Azure Container Registry commands in `Azure/`.
- **kubectl**: Kubernetes and AKS commands in `Kubernetes/`.
- **Docker**: Container workflows in `Docker/`.
- **.NET SDK**: .NET work documented in `Dotnet/`, when applicable.

See [Recommended Tools](../tools/recommended-tools.md) for the complete list and installation guidance.

## Setting Up Your Development Environment

1. **Clone the Repository**
   Open your terminal and run the following command to clone the repository:
   ```
   git clone https://github.com/your-organization/engineering-playbook.git
   ```

2. **Navigate to the Project Directory**
   Change into the project directory:
   ```
   cd engineering-playbook
   ```

3. **Choose a topic**
   Start with the relevant folder: `Azure/`, `Docker/`, `Dotnet/`, `Kubernetes/`, `PowerShell/`, or `Script/`.

4. **Validate commands safely**
   Review placeholders such as `<namespace>`, `<context-name>`, and `<deployment-name>` before running commands. Use a non-production context for testing and follow the applicable operational process.

## Accessing Resources

- **Documentation**: Start with the [repository README](../../README.md), then use the relevant section under `docs/`.
- **Operational notes**: Use the topic folders for command references and scripts.
- **Communication**: Join the team chat or preferred communication channel to stay updated and ask questions.

## Next Steps

Once your environment is set up, you can start exploring the codebase and contributing to the project. Check out the following documents for more information:

- [Architecture Overview](../architecture/overview.md)
- [Coding Standards](../best-practices/coding-standards.md)
- [Code Review Process](../processes/code-review.md)
- [Recommended Tools](../tools/recommended-tools.md)

Welcome aboard, and happy coding!