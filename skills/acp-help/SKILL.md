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
4. Si l'utilisateur veut **rediger un prompt** Copilot, **composer un prompt**, savoir **quel skill lancer** ou **quel persona** utiliser, sans demande de **strategie IA** lourde (modeles, RAG, couts) : recommander `acp-compose-prompt-dotnet` (redaction du prompt final uniquement, pas de code).
5. Si la question porte sur **strategie IA**, **choix de modele**, **RAG**, **risques/couts IA**: recommander `acp-expert-ia`.
6. Si la question evoque **PowerShell**, **pwsh**, fichiers **.ps1** / **.psm1**, ou **etapes PowerShell dans un pipeline** : recommander `acp-powershell-automation`.
7. Si la question evoque une **integration enterprise** : **Kafka** -> `acp-messaging-kafka-dotnet` ; **IBM MQ** / **WebSphere MQ** / **MQ** (messagerie) -> `acp-messaging-ibmmq-dotnet` ; **Serilog** ou **NLog** -> `acp-logging-serilog-nlog-dotnet` ; **Splunk** -> `acp-observability-splunk-dotnet` ; **Dynatrace** -> `acp-observability-dynatrace-dotnet` ; **FTP** / **SFTP** / **FTPS** -> `acp-integration-filetransfer-dotnet` ; **Denodo** -> `acp-integration-denodo-dotnet` ; **Control-M** / **ControlM** -> `acp-integration-controlm` ; **OpenAPI** / **Swagger** (contrat API) -> `acp-api-contract-dotnet`.
8. Identifier la phase courante (planning, architecture, implementation, validation).
9. Verifier les artefacts existants et leur completude.
10. Si `primary_runtime` est `dotnet` : si la story est implementee, recommander `acp-build-solution-dotnet` ; si build/tests echouent, `acp-correct-solution-dotnet` ; CI GitHub Actions / Azure DevOps vers `acp-ci-github-actions-dotnet` / `acp-ci-azure-devops-dotnet`.
11. Si `primary_runtime` est `python`, `polyglot` ou `other` : recommander les memes **phases** (build, test, correction) en s'appuyant sur `build_command`, `test_command`, `format_command` et `docs/project-context.md` ; ne pas imposer les skills `*-dotnet` sans adaptation explicite.
12. Avant promotion, router vers `acp-cicd-quality-gates`.
13. Pour deployment multi-env (profil dotnet ou runbook equivalent), router vers `acp-release-orchestrator-dotnet`.
14. En incident post-deploiement, router vers `acp-rollback-dotnet`.
15. Recommander la prochaine action obligatoire.
16. Lister les options facultatives a forte valeur.

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
