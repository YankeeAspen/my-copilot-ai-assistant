# Skill: acp-ci-github-actions-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-dev-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-architect-dotnet.md`

## But
Configurer et valider un pipeline CI GitHub Actions pour projet .NET.

## Entrees
- type de solution .NET (API, Worker, Web)
- chemin `.sln`
- besoins de tests/couverture/securite

## Workflow
1. Verifier prerequis (secrets, permissions, runners).
2. Configurer jobs: restore, build, test, couverture.
3. Ajouter scan securite (dependances/secrets) et quality gates.
4. Publier artefacts de build et rapports.
5. Definir triggers (`pull_request`, `push`, `workflow_dispatch`).
6. Valider le pipeline avec un run de reference.

## Livrables
- workflow CI GitHub Actions pret a l'emploi
- rapport de verification du run

## Conditions d'echec
- build/test non verts
- vulnerabilite critique/haute non traitee
