# Skill: acp-orchestrator-idea

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-pm-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-architect-dotnet.md`

## But

Transformer une **idee en une phrase** (ou courte description) en **prompt pack** exploitable avec Copilot, valider avec l'utilisateur, puis proposer la **cartographie personas** et la **chaine ordonnee de skills** `acp-*` jusqu'a l'execution finale.

Les « agents » du framework sont les **personas** documentes sous `personas/*.md` ; ce skill les reference et enchaine les skills correspondants. Cartographie formalisee **skill → persona** : `templates/skill-persona-map.md`.

## Entrees

- Phrase d'idee ou besoin brut
- Optionnel: `docs/project-context.md`, artefacts existants sous `docs/`

## Contraintes

- **Iterations de validation utilisateur**: maximum **3** boucles de revision du prompt pack. Au-dela: sortie explicite « decision humaine requise » avec points bloquants listes.
- Toujours produire un livrable base sur `templates/idea-prompt-pack.template.md`.

## Workflow

### 1. Capture

- Reformuler l'idee en **une ligne** claire.
- Lister les **hypotheses** explicites (ce qui est suppose vrai sans preuve).

### 2. Clarification

Poser des questions ciblees (ne pas depasser ce qui est necessaire au prompt pack):

- Objectif metier et utilisateur principal
- Perimetre in / out
- Contraintes NFR (performance, disponibilite, conformite)
- Donnees sensibles ou PII
- Impact base SQL Server (oui/non/incertain)
- `primary_runtime` prevu ou existant (`dotnet`, `python`, `polyglot`, `other`) et stack dans `docs/project-context.md`

### 3. Generation du prompt pack

Remplir `templates/idea-prompt-pack.template.md` avec:

- Prompt systeme / utilisateur pour sessions Copilot
- Criteres de succes mesurables
- Livrables attendus (fichiers sous `docs/`, code, tests)

### 4. Validation utilisateur

- Presenter le prompt pack a l'utilisateur.
- Demander confirmation ou modifications.
- Incrementer le compteur d'iteration. Si iteration > 3: arreter avec section « decision humaine requise ».

### 5. Cartographie personas

Produire un tableau:

| Persona (fichier) | Role | Quand intervenir |
|-------------------|------|------------------|
| `personas/acp-pm-dotnet.md` | PRD, priorisation | Debut |
| `personas/acp-architect-dotnet.md` | Architecture | Apres PRD |
| ... | ... | ... |

Inclure uniquement les personas pertinents (PM, architecte, dev, DB, QA, security, reviewer selon le cas).

### 6. Chaine d'execution skills

Lister les skills `acp-*` dans l'ordre d'invocation, avec **branchements**:

- Par defaut greenfield: `acp-create-prd` -> `acp-create-architecture-dotnet` -> `acp-create-epics-stories` -> `acp-dev-story-dotnet` -> `acp-build-solution-dotnet` -> si echec `acp-correct-solution-dotnet` -> `acp-code-review-dotnet` -> `acp-security-check-dotnet` -> `acp-perf-audit-dotnet-sql` si hot path -> checklists release.
- Si changement schema / SQL: inserer `acp-db-schema-sqlserver` et `acp-db-migration-sqlserver` apres architecture ou selon story.
- Si CI/CD: ajouter `acp-cicd-quality-gates`, `acp-ci-github-actions-dotnet` ou `acp-ci-azure-devops-dotnet`, `acp-release-orchestrator-dotnet`, `acp-rollback-dotnet` si deploy.
- Si question strategie IA (modele, RAG, risques): suggerer `acp-expert-ia` **avant** ou **en parallele** du design, pas a la place du build.

### 7. Handoff

- Livrer le **prompt pack** final + **sequence de skills** + **personas**.
- Indiquer que l'execution se fait en invoquant chaque skill dans l'ordre (sessions Copilot dediees recommandees).

## Sortie

- Fichier ou bloc markdown conforme au template `idea-prompt-pack.template.md`
- Tableau personas + liste ordonnee des skills avec branchements

## Regles

- Ne pas skip la validation utilisateur.
- Aligner les livrables sur les chemins definis dans `module.yaml` (`docs/planning`, `docs/architecture`, etc.).
