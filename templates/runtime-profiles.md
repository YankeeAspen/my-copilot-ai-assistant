# Profils runtime (`primary_runtime` dans module.yaml)

Le pack est **agnostique sur le cadrage** (PRD, stories, ADR) et **profile** l'implementation / CI sur le runtime declare.

## Automation PowerShell (tous profils)

- Skill `acp-powershell-automation` et `templates/powershell-standards.md` : utile des qu'il y a des scripts `.ps1` / `.psm1` ou des etapes `pwsh` / `PowerShell@2` dans les pipelines, quel que soit `primary_runtime`.

## Integrations enterprise (principalement dotnet)

Les skills `acp-messaging-*-dotnet`, `acp-logging-serilog-nlog-dotnet`, `acp-observability-splunk-dotnet`, `acp-observability-dynatrace-dotnet`, `acp-integration-filetransfer-dotnet`, `acp-integration-denodo-dotnet` ciblent un depot **`primary_runtime: dotnet`**. Exception : **`acp-integration-controlm`** (runbooks / ops, sans suffixe dotnet). OpenAPI : `acp-api-contract-dotnet`. Voir README section « Integrations enterprise ».

## dotnet (reference)

- Skills : `acp-*-dotnet`, `acp-db-*-sqlserver` (si SQL Server).
- Standards : `templates/dotnet-sqlserver-standards.md`.
- Gates typiques : `format_command`, `build_command`, `test_command` (defauts `dotnet format` / `dotnet build` / `dotnet test`).
- CI templates : `templates/ci-cd/*dotnet*`, skills `acp-ci-github-actions-dotnet`, `acp-ci-azure-devops-dotnet`.

## python

- Utiliser les memes etapes **conceptuelles** (story, build, test, review, securite) avec les **commandes** renseignees dans `module.yaml` (`build_command`, `test_command`, `format_command` / lint).
- Les skills nommes `*-dotnet` ne s'appliquent pas tel quel : adapter les workflows manuellement ou ajouter des skills dedies dans une future version du pack.
- Documenter stack (pytest, ruff, poetry/uv, etc.) dans `docs/project-context.md`.

## polyglot / other

- Preciser dans `project-context.md` chaque runtime, ses commandes et les dossiers sources.
- Reutiliser `acp-cicd-quality-gates`, checklists release/securite, `acp-record-adr-dotnet` (contenu runtime-agnostique) autant que possible.
