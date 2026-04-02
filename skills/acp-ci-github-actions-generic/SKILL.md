# Skill: acp-ci-github-actions-generic

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-dev-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-architect-dotnet.md`

## But
Configurer et valider un **pipeline CI GitHub Actions** pour un depot **sans build .NET obligatoire** : YAML / infra, Python, Node, scripts SQL, PowerShell, ou stack hybride decrit dans `module.yaml` et `docs/project-context.md`.

## Entrees
- `module.yaml` : `format_command`, `build_command`, `test_command` (a renseigner pour le stack reel)
- `docs/project-context.md` : `delivery_profile`, chemins workflows, runner cible, triggers
- Besoins : scans secrets / dependances, artefacts, matrices OS si necessaire

## Workflow
1. Confirmer que le depot **n'est pas** centre sur une solution .NET a builder ; sinon privilegier `acp-ci-github-actions-dotnet`.
2. Partir du template `templates/ci-cd/github-actions-generic-ci.yml` ; ajuster `on:`, `runs-on`, permissions, secrets.
3. Remplacer les blocs commentes par les **commandes exactes** copiees depuis `module.yaml` (une etape par commande non vide ; supprimer les etapes sans equivalent).
4. Ajouter etapes de securite alignees sur `acp-cicd-quality-gates` (scan dependances, secrets, SARIF si applicable au stack).
5. Definir publication d'artefacts / rapports de tests selon les outils utilises.
6. Executer un run de validation (PR ou `workflow_dispatch`) et corriger les ecarts.

## Livrables
- workflow YAML sous `.github/workflows/` pret a l'emploi (ou PR)
- resume du run et des gates passees / a traiter

## Conditions d'echec
- etape critique en erreur sans plan de correction
- quality gate bloquante non satisfaite (politique equipe / `acp-cicd-quality-gates`)
