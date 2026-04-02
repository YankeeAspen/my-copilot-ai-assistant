# assistant-copilot — instructions depot

Ce depot (ou copie fusionnee a la **racine** du depot applicatif) definit une methode de delivery **logicielle multi-runtime** avec GitHub Copilot. Le profil **.NET + SQL Server** est la reference documentee ; `primary_runtime` dans `module.yaml` oriente le reste.

## A lire en priorite

- Configuration : `#file:../module.yaml` (chemins, commandes build/test/format, langues). Remplissage guide par questions : `#file:./prompts/acp-bootstrap-module.prompt.md` + `#file:../templates/module-bootstrap-flow.md`.
- Contexte projet : `#file:../docs/project-context.md` si present.
- Profils runtime : `#file:../templates/runtime-profiles.md`
- Standards code et donnees (dotnet) : `#file:../templates/dotnet-sqlserver-standards.md`
- Contraintes transverses skills : `#file:../templates/skill-global-constraints.md` (inclut la lecture optionnelle de `docs/copilot-project-conventions.md` si le fichier existe).
- Conventions projet (optionnel) : attacher `#file:../docs/copilot-project-conventions.md` **uniquement** si ce fichier est present dans le depot.
- PowerShell (scripts + CI) : `#file:../templates/powershell-standards.md` ; prompt `#file:./prompts/acp-powershell-automation.prompt.md`.
- Integrations enterprise (Kafka, IBM MQ, Serilog/NLog, Splunk, Dynatrace, FTP/SFTP, Denodo, Control-M) : prompts sous `#file:./prompts/` (`acp-messaging-*`, `acp-observability-splunk-dotnet`, etc.) ; detail dans le README du pack section « Integrations enterprise ».
- Redaction d'un prompt Copilot (choix skill / persona, texte final sans code) : `#file:./prompts/acp-compose-prompt-dotnet.prompt.md`.

## Ordre de phase (resume)

1. Planning : PRD, architecture, epics/stories (`acp-create-prd`, `acp-create-architecture-dotnet`, `acp-create-epics-stories`).
2. Implementation : story + build + correction si echec (`acp-dev-story-dotnet`, `acp-build-solution-dotnet`, `acp-correct-solution-dotnet`).
3. Validation **avant** CI/release : `acp-code-review-dotnet`, `acp-security-check-dotnet`, `acp-perf-audit-dotnet-sql` si pertinent.
4. CI/CD : `acp-cicd-quality-gates`, puis `acp-ci-github-actions-dotnet` et/ou `acp-ci-azure-devops-dotnet`.
5. Release : `acp-release-orchestrator-dotnet` et checklists sous `checklists/`.
6. `acp-rollback-dotnet` : **uniquement** en incident post-deploiement.

## Gates locales

Utiliser les commandes du `module.yaml` ; par defaut : `dotnet format`, `dotnet build`, `dotnet test`. Jamais de secrets dans le code.

## Prompts reutilisables

Fichiers sous `.github/prompts/*.prompt.md` : executer le workflow du skill `acp-*` reference via `#file:` vers `skills/`.

## IDE

Dans VS Code, activer les prompt files : `"chat.promptFiles": true` (workspace) pour exposer `.github/prompts`.
