# Azure DevOps Enterprise Flow

## Trigger
- Push sur `main` ou PR

## Sequence
1. CI execute `templates/ci-cd/azure-devops-dotnet-ci.yml`
2. Build + tests + scan vuln
3. Gate `acp-cicd-quality-gates`
4. CD execute `templates/ci-cd/azure-devops-dotnet-cd.yml`
5. Promotion dev -> stage -> prod avec checks

## Verification
- quality gate vert
- approvals stage/prod valides
- verification post-deploiement reussie

## Issue path
- incident en prod: activer `acp-rollback-dotnet` et valider etat stable
