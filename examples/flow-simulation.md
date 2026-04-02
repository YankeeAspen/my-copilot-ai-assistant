# Simulation de flux complet

## Scenario
Feature: ajout d'un endpoint de consultation de commandes client.

## 1) PRD
- Skill: `acp-create-prd`
- Sortie: FR/NFR, AC, KPI de latence

## 2) Architecture
- Skill: `acp-create-architecture-dotnet`
- Sortie: endpoint, service, repository, ADR

## 3) Stories
- Skill: `acp-create-epics-stories`
- Sortie: story API + story DB index

## 4) Development
- Skill: `acp-dev-story-dotnet`
- Execution:
  - tests unitaires service
  - test integration endpoint
  - validation `dotnet format/build/test`

## 5) DB
- Skill: `acp-db-migration-sqlserver`
- Sortie: migration + runbook rollback

## 6) Validation
- Skills:
  - `acp-code-review-dotnet`
  - `acp-security-check-dotnet`
  - `acp-perf-audit-dotnet-sql`

## 7) CI/CD
- `acp-cicd-quality-gates`
- `acp-ci-github-actions-dotnet` ou `acp-ci-azure-devops-dotnet`

## 8) Release
- `acp-release-orchestrator-dotnet` si besoin
- Checklist `release-gate.md` passee
- Decision: go/no-go avec preuves

## Incident (exception)
- `acp-rollback-dotnet` si echec en production
