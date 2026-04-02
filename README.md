# assistant-copilot

Cadre de travail IA "Copilot-only" pour **delivery logiciel multi-runtime**, avec un **profil de reference .NET + SQL Server** (skills, templates CI, standards).

## Objectif

Fournir une methode standard, reusable et previsible pour livrer des changements avec GitHub Copilot:

- exigences claires (PRD),
- architecture explicite,
- stories implementables,
- implementation testee,
- revue code/securite/performance,
- gates de release.

Le champ `primary_runtime` dans [module.yaml](module.yaml) et [templates/runtime-profiles.md](templates/runtime-profiles.md) indiquent comment appliquer les skills nommes `*-dotnet` vs adapter le flux pour Python, polyglot ou autre.

## Installation dans un projet

Le pack est concu pour vivre a la **racine du depot applicatif** (meme niveau que votre code), pour que les references `#file:` des prompts pointent vers `skills/`, `module.yaml` et `docs/` sans retouches.

### Prerequis

- Un depot Git ouvert dans l'IDE ; **VS Code** est a privilegier pour les **prompt files** Copilot.
- Abonnement / activation **GitHub Copilot** dans l'IDE.

### Etapes

1. **Copier ou fusionner** l'integralite du dossier `assistant-copilot` a la racine du projet cible : conserver la structure (`skills/`, `personas/`, `templates/`, `checklists/`, `scripts/`, `examples/`, [module.yaml](module.yaml), [.github/](.github/)).
2. **Fusionner `.github/`** si le depot en a deja un : ne pas supprimer vos `workflows/` ; ajouter ou fusionner `prompts/`, `instructions/` et [copilot-instructions.md](.github/copilot-instructions.md) (combiner avec vos regles existantes pour eviter les contradictions).
3. **Configurer le module** : editer [module.yaml](module.yaml) a la main, ou lancer le prompt **`acp-bootstrap-module`** (questions guidees par Copilot, priorite aux chemins et a la solution `.sln` ; commandes `dotnet` en defaut si runtime dotnet — voir [templates/module-bootstrap-flow.md](templates/module-bootstrap-flow.md)).
4. **Contexte projet** : copier [templates/project-context.template.md](templates/project-context.template.md) vers `docs/project-context.md` et le remplir.
5. **Conventions projet (optionnel)** : copier [templates/copilot-project-conventions.template.md](templates/copilot-project-conventions.template.md) vers `docs/copilot-project-conventions.md` et le remplir — regles equipe / produit qui completent le pack (voir [Conventions](#conventions)).
6. **VS Code** : activer les fichiers prompt dans le workspace, par exemple dans `.vscode/settings.json` :
   ```json
   "chat.promptFiles": true
   ```
7. **Verifier** : parcourir [checklists/module-yaml-validation.md](checklists/module-yaml-validation.md) ; depuis la racine du depot, sous Windows : `powershell -File scripts/validate-module.ps1`.
8. **Demarrer** : ouvrir un prompt sous [.github/prompts/](.github/prompts/) (ex. `acp-help`) ou suivre le [Quick Start](#quick-start-parcours-classique) ci-dessous.

### Si le pack n'est pas a la racine

Les chemins `#file:../../skills/...` des prompts supposent que `.github/prompts/` est sous la racine du repo. Si vous installez le pack dans un sous-dossier (ex. `tools/assistant-copilot/`), il faut **reecrire les chemins relatifs** dans chaque `.prompt.md` ou deplacer `.github` a la racine — voir le detail dans [examples/copilot-setup.md](examples/copilot-setup.md).

### Autres IDE

Souvent seul [copilot-instructions.md](.github/copilot-instructions.md) est pris en charge : executer les workflows en copiant le contenu des fichiers `skills/acp-*/SKILL.md` dans le chat si besoin (voir aussi [examples/copilot-setup.md](examples/copilot-setup.md)).

## Demarrage depuis une idee

Si vous partez d'une **phrase d'idee** (nouveau besoin, greenfield, nouveau projet):

1. Lancer `acp-orchestrator-idea` — produit un prompt pack (`templates/idea-prompt-pack.template.md`), validations avec vous, personas et chaine de skills.
2. Pour les questions **strategie IA** (modele, RAG, risques, couts) avant de figer le design: `acp-expert-ia`.
3. Executer ensuite la chaine `acp-*` dans l'ordre indique par l'orchestrateur.

Voir `examples/orchestrator-idea-flow.md`.

## Quick Start (parcours classique)

1. Completer `module.yaml` pour votre projet (notamment `primary_runtime` ; defaut `dotnet`) — a la main ou via le prompt **`acp-bootstrap-module`** pour un parcours question par question.
2. Remplir `templates/project-context.template.md` en `docs/project-context.md`.
3. Valider le module : `checklists/module-yaml-validation.md` ; sous Windows, `powershell -File scripts/validate-module.ps1` depuis la racine du pack.
4. Si `primary_runtime` est **`dotnet`**, lancer les skills dans cet ordre:
   - `acp-help`
   - `acp-create-prd`
   - `acp-create-architecture-dotnet`
   - `acp-create-epics-stories`
   - `acp-dev-story-dotnet`
   - `acp-build-solution-dotnet`
   - `acp-correct-solution-dotnet` (si build/tests en echec)
   - `acp-code-review-dotnet`
   - `acp-security-check-dotnet`
   - `acp-perf-audit-dotnet-sql` (si hot path / charge / SQL sensible)
   - `acp-cicd-quality-gates`
   - `acp-ci-github-actions-dotnet` et/ou `acp-ci-azure-devops-dotnet`
   - `acp-release-orchestrator-dotnet`
   - `acp-rollback-dotnet` (uniquement en incident post-deploiement, pas une etape lineaire)
5. Passer les checklists `checklists/*.md` avant merge/release.

Si `primary_runtime` est **`python`**, **`polyglot`** ou **`other`** : conserver `acp-create-prd`, `acp-create-epics-stories`, `acp-cicd-quality-gates`, checklists et ADR ; remplacer les etapes `*-dotnet` par les memes **intentions** (story, build, test, review, securite) en utilisant les commandes du `module.yaml` et le detail dans `docs/project-context.md` (voir `templates/runtime-profiles.md`).

### Skills complementaires (selon contexte)

- `acp-bootstrap-module` : guider le remplissage de `module.yaml` (chemins, runtime, `.sln`, dossiers `docs/` ; commandes allegees si dotnet).
- `acp-compose-prompt-dotnet` : a partir d'un besoin court, choisir persona / skill `acp-*` et **rediger seulement** le prompt Copilot final (sans code ni modification de fichiers).
- `acp-test-strategy-dotnet` : une fois en debut de projet ou avant une release majeure.
- `acp-record-adr-dotnet` + `templates/adr.template.md` : decisions d'architecture structurantes.
- `acp-api-contract-dotnet` : lors de changements de surface API ou OpenAPI.
- `acp-observability-dotnet` + `checklists/observability-post-release.md` : avant mise en production ou release sensible.
- `acp-db-schema-sqlserver`, `acp-db-migration-sqlserver`, `acp-quick-dev-dotnet` : selon le besoin.
- `acp-powershell-automation` + `templates/powershell-standards.md` : scripts `.ps1` / `.psm1` et etapes PowerShell en CI (GitHub Actions / Azure DevOps).

### Integrations enterprise (complementaires)

Skills declenches selon le besoin (prompts `acp-*` dans `.github/prompts/`) :

- **OpenAPI / contrat API** : `acp-api-contract-dotnet` (pas de skill separe ; spec, versioning, tests).
- **Kafka** : `acp-messaging-kafka-dotnet`
- **IBM MQ** : `acp-messaging-ibmmq-dotnet`
- **Serilog / NLog** : `acp-logging-serilog-nlog-dotnet`
- **Splunk** : `acp-observability-splunk-dotnet`
- **Dynatrace** : `acp-observability-dynatrace-dotnet`
- **FTP / SFTP / FTPS** : `acp-integration-filetransfer-dotnet`
- **Denodo** : `acp-integration-denodo-dotnet`
- **Control-M** : `acp-integration-controlm` (runbooks, coordination batch ; transverse ops)

## GitHub Copilot

- **Instructions depot** : `.github/copilot-instructions.md` (charge par Copilot Chat / agent / review selon produit).
- **Prompts reutilisables** : `.github/prompts/*.prompt.md` (y compris integrations enterprise : `acp-messaging-*`, `acp-observability-splunk-dotnet`, etc.) — dans VS Code activer `"chat.promptFiles": true`, puis attacher un prompt ou utiliser `/NomDuPrompt`.
- **Instructions par chemin** : `.github/instructions/dotnet.instructions.md` (`*.cs` / `*.csproj`) ; `.github/instructions/powershell.instructions.md` (`*.ps1` / `*.psm1`).
- **Installation** : procedure pas a pas dans [Installation dans un projet](#installation-dans-un-projet) ; cas limites (fusion `.github`, sous-dossier, VS Code) dans [examples/copilot-setup.md](examples/copilot-setup.md).
- **JetBrains / autres IDE** : voir la sous-section *Autres IDE* dans [Installation dans un projet](#installation-dans-un-projet).

### Personas et skills

Chaque skill `acp-*` indique un **persona primaire** (et un secondaire optionnel) dans `skills/acp-*/SKILL.md` (section `Persona par defaut`). La vue d’ensemble et l’index par persona sont dans [templates/skill-persona-map.md](templates/skill-persona-map.md). Les prompts [`.github/prompts/*.prompt.md`](.github/prompts/) attachent le `personas/*.md` du role par defaut via `#file:` (le prompt `acp-help` attache la matrice a la place d’un persona unique). Chaque fichier sous `personas/` liste les skills ou ce persona est primaire ou secondaire et inclut **Conventions communes** (alignement sur `skill-global-constraints.md` et optionnellement `docs/copilot-project-conventions.md`).

## Extensions (hors socle)

Non fournies dans ce pack ; a adapter en copiant la structure des skills CI existants :

- **GitLab CI** : modele `skills/acp-ci-github-actions-dotnet/SKILL.md` + YAML equivalent.
- **Docker / Kubernetes** : ajouter templates et un skill dedie si besoin.
- **PostgreSQL** (ou autre SGBD) : dupliquer les skills `acp-db-*-sqlserver` et les standards associés.
- **Skills Python / Node** dedies : non inclus dans cette version ; prevus comme extension sur le meme squelette (commandes dans `module.yaml`).

## Conventions

**Deux niveaux de regles :**

1. **Pack (commun)** : [`templates/skill-global-constraints.md`](templates/skill-global-constraints.md) — lu en premier par tout skill `acp-*` via la ligne « Contraintes globales » de chaque `SKILL.md` ; les [personas](personas/) renvoient aussi a ce fichier (`## Conventions communes`).
2. **Projet (optionnel, enrichissable)** : `docs/copilot-project-conventions.md` — a creer depuis [`templates/copilot-project-conventions.template.md`](templates/copilot-project-conventions.template.md) ; regles equipe / produit en complement. S'il est absent, seul le pack s'applique. Il ne doit pas affaiblir les interdits du pack (secrets, gates minimales).

Autres points :

- Prefixe skills: `acp-`
- Profil reference : ASP.NET Core, EF Core, SQL Server (`primary_runtime: dotnet`)
- Autres runtimes : declarer dans `module.yaml` + `docs/project-context.md` + `templates/runtime-profiles.md`
- Tests (profil dotnet) : xUnit + integration tests
- Gates : `format_command`, `build_command`, `test_command` du module (defauts dotnet)
- Secrets: jamais dans le repo

## Arborescence

```text
assistant-copilot/
  module.yaml
  docs/                    # apres installation : project-context.md ; optionnel copilot-project-conventions.md
  .github/
    copilot-instructions.md
    instructions/
    prompts/
  personas/
  scripts/
    validate-module.ps1
  skills/
  templates/
  checklists/
  examples/
```

## Sequence recommandee

(Ci-dessous pour `primary_runtime: dotnet` ; sinon adapter les etapes implementation / CI comme dans `templates/runtime-profiles.md`.)

1. Cadrer le besoin avec PM (`acp-create-prd`)
2. Designer la solution avec architecte (`acp-create-architecture-dotnet`)
3. Decouper le delivery (`acp-create-epics-stories`)
4. Implementer une story (`acp-dev-story-dotnet`)
5. Construire la solution (`acp-build-solution-dotnet`)
6. Corriger les echecs (`acp-correct-solution-dotnet`) puis reconstruire jusqu'au vert
7. Valider (`acp-code-review-dotnet`, `acp-security-check-dotnet`, `acp-perf-audit-dotnet-sql` si pertinent)
8. Gates CI/CD (`acp-cicd-quality-gates`, puis pipelines `acp-ci-github-actions-dotnet` / `acp-ci-azure-devops-dotnet`)
9. Release (`acp-release-orchestrator-dotnet`, `checklists/release-gate.md`)

## Flux CI/CD enterprise

1. Build local + tests
2. CI pipeline (`acp-ci-github-actions-dotnet` ou `acp-ci-azure-devops-dotnet`)
3. Quality gates (`acp-cicd-quality-gates`)
4. Promotion environnements (`acp-release-orchestrator-dotnet`)
5. Monitoring post-deploiement (`acp-observability-dotnet`, `checklists/observability-post-release.md`, variables `templates/ci-cd/shared-variables.example.md`)
6. Rollback si besoin (`acp-rollback-dotnet`, exception)

## Pack inclus

- Personas: `personas/*.md`
- Skills: `skills/acp-*/SKILL.md`
- Contraintes globales skills : `templates/skill-global-constraints.md`
- Profils runtime : `templates/runtime-profiles.md`
- Templates: `templates/*.template.*` (dont `adr.template.md`, `project-context.template.md`, `copilot-project-conventions.template.md`, `idea-prompt-pack.template.md`) ; flux `module.yaml` : `templates/module-bootstrap-flow.md`
- CI/CD templates: `templates/ci-cd/*`
- Standards: `templates/dotnet-sqlserver-standards.md`, `templates/powershell-standards.md`
- Checklists: `checklists/*.md` (dont `module-yaml-validation.md`, `observability-post-release.md`)
- Scripts: `scripts/validate-module.ps1`
- GitHub Copilot: `.github/copilot-instructions.md`, `.github/prompts/*.prompt.md` (dont `acp-bootstrap-module`, messaging, observabilite Splunk/Dynatrace, logging, filetransfer, Denodo, Control-M), `.github/instructions/*.instructions.md`
- Guides d'adoption:
  - `examples/day-1-onboarding.md`
  - `examples/flow-simulation.md`
  - `examples/orchestrator-idea-flow.md`
  - `examples/copilot-setup.md`
  - `examples/framework-retro-metrics.md`
- Orchestration idee: `skills/acp-orchestrator-idea/SKILL.md`
- Expert IA (cadrage): `skills/acp-expert-ia/SKILL.md`
