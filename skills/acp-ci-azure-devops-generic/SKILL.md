# Skill: acp-ci-azure-devops-generic

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-dev-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-architect-dotnet.md`

## But
Configurer et valider un **pipeline CI Azure DevOps** (YAML) pour un depot **sans build .NET obligatoire** : infra, scripts, polyglot, SQL ou PowerShell, selon `module.yaml` et `project-context`.

## Entrees
- `module.yaml` : commandes `format_command`, `build_command`, `test_command`
- `docs/project-context.md` : chemin du YAML pipeline, agent pool / `vmImage`, triggers
- Service connections et politique de branches si imposee par l'organisation

## Workflow
1. Si le depot est une application .NET standard a `dotnet build` / `dotnet test`, privilegier `acp-ci-azure-devops-dotnet`.
2. Partir de `templates/ci-cd/azure-devops-generic-ci.yml` ; positionner le fichier selon la convention du projet (ex. racine ou `azure-pipelines/ci.yml`).
3. Mapper chaque commande non vide du `module.yaml` vers une etape `script`, `bash`, `PowerShell@2` ou tache officielle (NodeTool, UsePythonVersion, etc.) selon le stack.
4. Configurer `trigger` / `pr` et pool ; ajouter scans et gates coherentes avec `acp-cicd-quality-gates`.
5. Publier les resultats de tests / couverture avec les taches Azure DevOps adaptees au framework.
6. Lancer un run de validation et documenter le statut.

## Livrables
- definition YAML Azure DevOps prete a l'emploi
- rapport de run et liste des gates

## Conditions d'echec
- etape critique en erreur
- gate qualite / securite non respectee sans mitigation documentee
