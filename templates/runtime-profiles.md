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

## Depot principalement YAML (CI / infra)

- Cas : repository centre sur des **pipelines** GitHub Actions ou Azure DevOps, IaC, ou livrables YAML sans application .NET dans le meme depot.
- `primary_runtime` : souvent **`other`** ou **`polyglot`** ; renseigner `delivery_profile: ci_yaml_only` (ou equivalent) dans `docs/project-context.md`.
- **Skills CI** : `acp-ci-github-actions-generic`, `acp-ci-azure-devops-generic` — YAML pilote par `module.yaml` (`format_command`, `build_command`, `test_command`) et `project-context` (triggers, chemins, runners).
- **Ne pas forcer** `acp-ci-github-actions-dotnet` / `acp-ci-azure-devops-dotnet` sauf si le depot contient reellement du .NET a builder.
- Gates : adapter `acp-cicd-quality-gates` (pas de binaire .NET obligatoire ; s'appuyer sur les commandes declarees et scans secrets / qualite YAML si politique equipe).

## Scripts SQL seuls (depot sans app metier)

- Cas : migrations / scripts `.sql`, eventuellement outil de deploiement schema.
- Declarer `delivery_profile: sql_scripts` et l'outil (Flyway, Liquibase, sqlcmd, SSDT, etc.) dans `project-context.md`.
- **Skills** : `acp-db-schema-sqlserver`, `acp-db-migration-sqlserver` si SQL Server ; sinon adapter la demarche dans le contexte.
- **CI** : `acp-ci-github-actions-generic` ou `acp-ci-azure-devops-generic` avec `build_command` / `test_command` pointant vers validation SQL (syntaxe, dry-run, tests base) selon l'outil.

## Depot PowerShell seul

- Cas : modules `.psm1`, scripts d'automation, peu ou pas d'autre runtime.
- Declarer `delivery_profile: powershell` dans `project-context.md`.
- **Skill** : `acp-powershell-automation` + `templates/powershell-standards.md`.
- **CI** : `acp-ci-github-actions-generic` (ou Azure DevOps generique) avec etapes `pwsh` / Pester / `Invoke-Build` ; exemple optionnel : `templates/ci-cd/github-actions-powershell-ci.yml`.
