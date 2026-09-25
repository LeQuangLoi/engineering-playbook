# Engineering Playbook Architecture

This document defines the ownership model for the Engineering Playbook. It is a personal knowledge repository rather than a deployable application, so its architecture is based on information boundaries and navigation flow.

## Ownership Model

### Root README

The root [README](../../README.md) explains what the playbook is, shows the top-level structure, and maps each component to its entry-point README. It should stay short enough to scan quickly.

### Shared Documentation

The [`docs/`](../README.md) tree contains guidance that applies across technologies:

- Architecture and repository boundaries.
- Coding and documentation standards.
- Onboarding and contribution flow.
- Code review and incident response.
- Shared tool references.

### Technology Components

Top-level technology folders contain practical experience that is specific to one area. Each component owns its `README.md`, commands, scripts, examples, troubleshooting notes, and lessons learned.

Examples include Azure infrastructure, Docker workflows, .NET development, Kubernetes operations, PowerShell automation, and shell scripts.

### Study Material

`CertificateExam/` contains certification preparation and learning notes. Reference files may remain in their native format, but personal explanations and repeatable study workflows use Markdown.

## Placement Decisions

Use this decision flow when adding content:

1. If the guidance applies to multiple technologies, place it under `docs/`.
2. If it is specific to one technology, place it in that technology folder.
3. If it is a reusable workflow, create a focused Markdown page and link it from the nearest README.
4. If it is executable, keep the source file beside its usage documentation.
5. If it is temporary or local-only, do not add it to the playbook.

## Navigation Contract

- Every navigable folder has one canonical `README.md` entry point.
- Parent READMEs link to child folders and reusable pages.
- Relative links must resolve from the file that contains them.
- Documentation uses Markdown; executable source keeps its native extension.
- Environment-specific values, secrets, and decrypted files do not belong in the repository.
