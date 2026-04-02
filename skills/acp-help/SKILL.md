# Skill: acp-help

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** aucun persona fixe ; router selon la phase et `templates/skill-persona-map.md`.

## But
Orienter l'equipe vers la prochaine etape selon l'etat actuel des artefacts.

## Entrees
- question utilisateur
- presence des fichiers `docs/planning`, `docs/architecture`, `docs/implementation`

## Workflow
1. Lire `primary_runtime` dans `module.yaml` (defaut `dotnet`) et `templates/runtime-profiles.md` si hors dotnet.
2. Si l'utilisateur veut **configurer**, **remplir**, **initialiser** ou **wizard** pour `module.yaml`, **chemins** solution / dossiers `docs/`, ou **demarrage** du pack sans `module.yaml` pret : recommander `acp-bootstrap-module` (questions guidees ; commandes dotnet en defaut si runtime dotnet).
3. Si l'utilisateur parle d'une **idee**, **greenfield**, **nouveau projet** ou **phrase seule**: recommander `acp-orchestrator-idea` en premier.
4. Si l'utilisateur veut une **session de livraison** avec **memoire dans le depot**, **Definition of Done** (DOD) fichier, **ne pas perdre le fil** entre messages, **orchestration multi-phase** (analyse puis implementation puis verification contre DOD) : recommander `acp-delivery-orchestrator` (creer / tenir a jour `docs/delivery-state.md` depuis `templates/delivery-state.template.md` ; DOD sous `docs/dod/` depuis `templates/dod.template.md`). Ne pas confondre avec `acp-orchestrator-idea` (prompt pack greenfield).
5. Si l'utilisateur veut **rediger un prompt** Copilot, **composer un prompt**, savoir **quel skill lancer** ou **quel persona** utiliser, sans demande de **strategie IA** lourde (modeles, RAG, couts) : recommander `acp-compose-prompt-dotnet` (redaction du prompt final uniquement, pas de code).
6. Si la question porte sur **strategie IA**, **choix de modele**, **RAG**, **risques/couts IA**: recommander `acp-expert-ia`.
7. Si la question evoque **PowerShell**, **pwsh**, fichiers **.ps1** / **.psm1**, ou **etapes PowerShell dans un pipeline** : recommander `acp-powershell-automation`.
8. Si la question porte sur un **workflow GitHub Actions** ou **pipeline Azure DevOps YAML** pour un depot **sans application .NET** a builder (infra, scripts, SQL, PowerShell, polyglot, YAML seul) : recommander `acp-ci-github-actions-generic` ou `acp-ci-azure-devops-generic` ; si le depot est **.NET** classique, garder `acp-ci-github-actions-dotnet` / `acp-ci-azure-devops-dotnet`.
9. Si la question evoque une **integration enterprise** : **Kafka** -> `acp-messaging-kafka-dotnet` ; **IBM MQ** / **WebSphere MQ** / **MQ** (messagerie) -> `acp-messaging-ibmmq-dotnet` ; **Serilog** ou **NLog** -> `acp-logging-serilog-nlog-dotnet` ; **Splunk** -> `acp-observability-splunk-dotnet` ; **Dynatrace** -> `acp-observability-dynatrace-dotnet` ; **FTP** / **SFTP** / **FTPS** -> `acp-integration-filetransfer-dotnet` ; **Denodo** -> `acp-integration-denodo-dotnet` ; **Control-M** / **ControlM** -> `acp-integration-controlm` ; **OpenAPI** / **Swagger** (contrat API) -> `acp-api-contract-dotnet`.
10. Identifier la phase courante (planning, architecture, implementation, validation).
11. Verifier les artefacts existants et leur completude.
12. Si `primary_runtime` est `dotnet` : si la story est implementee, recommander `acp-build-solution-dotnet` ; si build/tests echouent, `acp-correct-solution-dotnet` ; CI GitHub Actions / Azure DevOps **.NET** vers `acp-ci-github-actions-dotnet` / `acp-ci-azure-devops-dotnet`. Si `delivery_profile` ou le contexte indique un depot **non centre .NET** (YAML CI, SQL, PS seul), orienter vers les skills **generiques** `acp-ci-github-actions-generic` / `acp-ci-azure-devops-generic`.
13. Si `primary_runtime` est `python`, `polyglot` ou `other` : recommander les memes **phases** (build, test, correction) en s'appuyant sur `build_command`, `test_command`, `format_command` et `docs/project-context.md` ; pour les pipelines YAML, privilegier `acp-ci-github-actions-generic` / `acp-ci-azure-devops-generic` ; ne pas imposer les skills `*-dotnet` sans adaptation explicite.
14. Avant promotion, router vers `acp-cicd-quality-gates`.
15. Pour deployment multi-env (profil dotnet ou runbook equivalent), router vers `acp-release-orchestrator-dotnet`.
16. En incident post-deploiement, router vers `acp-rollback-dotnet`.
17. Recommander la prochaine action obligatoire.
18. Lister les options facultatives a forte valeur.

## Sortie
- recommandations ordonnees avec skill a lancer ensuite

## Regles
- Si `docs/copilot-project-conventions.md` est present, en tenir compte pour le ton et les priorites d'orientation (sans contrevenir aux regles du pack ni a `skill-global-constraints.md`).
- Prioriser les etapes bloquantes
- Pour `primary_runtime: dotnet`, rester aligne sur le profil .NET + SQL Server du pack ; sinon respecter le stack decrit dans `project-context`.
- Exiger un build / tests verts (commandes du module) avant review/release
- **Ne jamais recommander release ou promotion d'environnement sans** revue code et verification securite : pour dotnet utiliser `acp-code-review-dotnet` et `acp-security-check-dotnet` ; pour d'autres runtimes, appliquer l'equivalent defini dans le contexte projet et les checklists
- Exiger `acp-cicd-quality-gates` et pipelines CI avant `acp-release-orchestrator-dotnet`
- Exiger quality gates passes avant promotion d'environnement
- `acp-rollback-dotnet` : uniquement en incident post-deploiement, pas une etape du flux nominal
