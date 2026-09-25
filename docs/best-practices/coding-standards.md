# Coding Standards

## Purpose
This document outlines the coding standards to be followed by the engineering team to ensure consistency, readability, and maintainability of the codebase.

## Naming Conventions
- Use meaningful and descriptive names for variables, functions, and classes.
- Follow camelCase for variable and function names (e.g., `calculateTotal`).
- Use PascalCase for class names (e.g., `UserProfile`).
- Constants should be in UPPER_SNAKE_CASE (e.g., `MAX_CONNECTIONS`).

## Formatting
- Use 2 spaces for indentation.
- Limit lines to a maximum of 80 characters.
- Use spaces around operators and after commas.
- Place opening braces on the same line as the statement.

## Documentation Practices
- Write clear and concise comments to explain complex logic.
- Use docstrings for all public functions and classes, describing their purpose, parameters, and return values.
- Keep documentation up to date with code changes.
- Use relative Markdown links and verify that linked files exist.
- Keep reusable commands in the topic folder that owns the technology or workflow.

## Shell and Configuration
- Use descriptive parameter names in PowerShell and shell scripts.
- Quote paths and values that may contain spaces or special characters.
- Never commit plaintext secrets; use the SOPS guidance under `PowerShell/Sops/`.
- Replace environment-specific values with clear placeholders in reusable examples.

## Version Control
- Commit changes with clear and descriptive messages.
- Use branches for new features and bug fixes, merging back to the main branch only after thorough testing.

## Testing
- Write unit tests for all new features and bug fixes.
- Follow the same naming conventions for test files and functions as the main codebase.
- Ensure tests are run before merging any changes.