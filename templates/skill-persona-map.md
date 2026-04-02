# Cartographie skills `acp-*` ↔ personas

Reference unique pour le **persona primaire** (et **secondaire** optionnel) associe a chaque skill du pack. Chaque [skills/acp-*/SKILL.md](../skills) repete la section `## Persona par defaut` ; ce fichier sert de vue d’ensemble et de routage pour `acp-help`.

## Regles

- **Primaire** : role attendu par defaut quand on invoque le skill (prompts Copilot attachent ce fichier sous `personas/`).
- **Secondaire** : role utile en renfort (pairing, handoff) ; optionnel.
- **`acp-help`** : aucun persona fixe ; router selon la phase du projet et le tableau ci-dessous.

## Tableau par skill

| Skill | Persona primaire | Persona secondaire |
|-------|------------------|---------------------|
| acp-help | *(aucun — voir regles)* | — |
| acp-bootstrap-module | `personas/acp-architect-dotnet.md` | `personas/acp-dev-dotnet.md` |
| acp-compose-prompt-dotnet | `personas/acp-pm-dotnet.md` | `personas/acp-architect-dotnet.md` |
| acp-create-prd | `personas/acp-pm-dotnet.md` | — |
| acp-create-epics-stories | `personas/acp-pm-dotnet.md` | — |
| acp-orchestrator-idea | `personas/acp-pm-dotnet.md` | `personas/acp-architect-dotnet.md` |
| acp-create-architecture-dotnet | `personas/acp-architect-dotnet.md` | — |
| acp-record-adr-dotnet | `personas/acp-architect-dotnet.md` | — |
| acp-api-contract-dotnet | `personas/acp-architect-dotnet.md` | `personas/acp-dev-dotnet.md` |
| acp-cicd-quality-gates | `personas/acp-architect-dotnet.md` | `personas/acp-dev-dotnet.md` |
| acp-observability-dotnet | `personas/acp-architect-dotnet.md` | `personas/acp-dev-dotnet.md` |
| acp-perf-audit-dotnet-sql | `personas/acp-architect-dotnet.md` | `personas/acp-dev-dotnet.md` |
| acp-messaging-kafka-dotnet | `personas/acp-architect-dotnet.md` | `personas/acp-dev-dotnet.md` |
| acp-messaging-ibmmq-dotnet | `personas/acp-architect-dotnet.md` | `personas/acp-dev-dotnet.md` |
| acp-logging-serilog-nlog-dotnet | `personas/acp-architect-dotnet.md` | `personas/acp-dev-dotnet.md` |
| acp-observability-splunk-dotnet | `personas/acp-architect-dotnet.md` | `personas/acp-dev-dotnet.md` |
| acp-observability-dynatrace-dotnet | `personas/acp-architect-dotnet.md` | `personas/acp-dev-dotnet.md` |
| acp-integration-filetransfer-dotnet | `personas/acp-architect-dotnet.md` | `personas/acp-dev-dotnet.md` |
| acp-integration-denodo-dotnet | `personas/acp-architect-dotnet.md` | `personas/acp-dev-dotnet.md` |
| acp-integration-controlm | `personas/acp-architect-dotnet.md` | `personas/acp-dev-dotnet.md` |
| acp-release-orchestrator-dotnet | `personas/acp-architect-dotnet.md` | `personas/acp-pm-dotnet.md` |
| acp-expert-ia | `personas/acp-architect-dotnet.md` | `personas/acp-pm-dotnet.md` |
| acp-test-strategy-dotnet | `personas/acp-qa-dotnet.md` | `personas/acp-architect-dotnet.md` |
| acp-dev-story-dotnet | `personas/acp-dev-dotnet.md` | — |
| acp-build-solution-dotnet | `personas/acp-dev-dotnet.md` | — |
| acp-correct-solution-dotnet | `personas/acp-dev-dotnet.md` | — |
| acp-quick-dev-dotnet | `personas/acp-dev-dotnet.md` | — |
| acp-ci-github-actions-dotnet | `personas/acp-dev-dotnet.md` | `personas/acp-architect-dotnet.md` |
| acp-ci-azure-devops-dotnet | `personas/acp-dev-dotnet.md` | `personas/acp-architect-dotnet.md` |
| acp-rollback-dotnet | `personas/acp-dev-dotnet.md` | `personas/acp-architect-dotnet.md` |
| acp-powershell-automation | `personas/acp-dev-dotnet.md` | — |
| acp-db-schema-sqlserver | `personas/acp-db-sqlserver.md` | `personas/acp-architect-dotnet.md` |
| acp-db-migration-sqlserver | `personas/acp-db-sqlserver.md` | `personas/acp-dev-dotnet.md` |
| acp-code-review-dotnet | `personas/acp-reviewer-dotnet.md` | — |
| acp-security-check-dotnet | `personas/acp-security-dotnet.md` | — |

## Index par persona (primaire)

- **PM** (`acp-pm-dotnet`) : `acp-compose-prompt-dotnet`, `acp-create-prd`, `acp-create-epics-stories`, `acp-orchestrator-idea`
- **Architecte** (`acp-architect-dotnet`) : `acp-bootstrap-module`, `acp-create-architecture-dotnet`, `acp-record-adr-dotnet`, `acp-api-contract-dotnet`, `acp-cicd-quality-gates`, `acp-observability-dotnet`, `acp-perf-audit-dotnet-sql`, `acp-messaging-kafka-dotnet`, `acp-messaging-ibmmq-dotnet`, `acp-logging-serilog-nlog-dotnet`, `acp-observability-splunk-dotnet`, `acp-observability-dynatrace-dotnet`, `acp-integration-filetransfer-dotnet`, `acp-integration-denodo-dotnet`, `acp-integration-controlm`, `acp-release-orchestrator-dotnet`, `acp-expert-ia`
- **QA** (`acp-qa-dotnet`) : `acp-test-strategy-dotnet`
- **Developpeur** (`acp-dev-dotnet`) : `acp-dev-story-dotnet`, `acp-build-solution-dotnet`, `acp-correct-solution-dotnet`, `acp-quick-dev-dotnet`, `acp-ci-github-actions-dotnet`, `acp-ci-azure-devops-dotnet`, `acp-rollback-dotnet`, `acp-powershell-automation`
- **DB SQL Server** (`acp-db-sqlserver`) : `acp-db-schema-sqlserver`, `acp-db-migration-sqlserver`
- **Reviewer** (`acp-reviewer-dotnet`) : `acp-code-review-dotnet`
- **Securite** (`acp-security-dotnet`) : `acp-security-check-dotnet`
