# GitHub Actions Enterprise Flow

## Trigger
- Pull Request sur `main`

## Sequence
1. CI execute `templates/ci-cd/github-actions-dotnet-ci.yml`
2. Build + tests + scan securite
3. Gate `acp-cicd-quality-gates`
4. CD manuel `templates/ci-cd/github-actions-dotnet-cd.yml` vers dev/stage/prod
5. Approvals d'environnement avant prod

## Verification
- artefacts disponibles
- quality gate passe
- smoke tests post-deploiement OK

## Issue path
- en cas d'echec deployment: lancer `acp-rollback-dotnet`
