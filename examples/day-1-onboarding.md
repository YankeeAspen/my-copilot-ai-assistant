# Day 1 Onboarding (Copilot-only)

## Etape 1: Initialisation
1. Copier `assistant-copilot/` dans le projet.
2. Adapter `module.yaml` (`primary_runtime` : `dotnet` par defaut ; autre valeur si stack differente — voir `templates/runtime-profiles.md`).
3. Creer `docs/project-context.md` depuis le template.

## Etape 2: Cadrage
1. Lancer `acp-create-prd`.
2. Produire `docs/planning/PRD.md`.

## Etape 3: Solutioning
1. Lancer `acp-create-architecture-dotnet`.
2. Produire `docs/architecture/architecture.md`.
3. Lancer `acp-create-epics-stories`.

## Etape 4: Build
1. Selectionner une story `ready-for-dev`.
2. Lancer `acp-dev-story-dotnet`.
3. Executer gates qualite.

## Etape 5: Validation
1. Lancer `acp-code-review-dotnet`.
2. Lancer `acp-security-check-dotnet`.
3. Lancer `acp-perf-audit-dotnet-sql` si impact hot path.

## Etape 6: CI/CD
1. Lancer `acp-cicd-quality-gates`.
2. Lancer `acp-ci-github-actions-dotnet` et/ou `acp-ci-azure-devops-dotnet` selon votre plateforme.

## Etape 7: Release
1. Lancer `acp-release-orchestrator-dotnet` si promotion multi-environnements.
2. Passer `checklists/release-gate.md`.
3. Tagger et deployer selon runbook.

## Incident (hors flux lineaire)
- `acp-rollback-dotnet` uniquement en cas d'incident apres deploiement.
