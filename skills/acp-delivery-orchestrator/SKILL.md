# Skill: acp-delivery-orchestrator

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-pm-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-architect-dotnet.md`

## But

Piloter une **session de livraison** avec **memoire dans le depot** : analyser une demande, choisir les personas appropries (parmi la carte `templates/skill-persona-map.md`), iterer avec questions, **geler une DOD** dans un fichier, enchainer implementation / build / tests / verification **sans declarer « termine »** sans confrontation explicite a la DOD.

Les roles « analyste metier » ou « redacteur documentaire » non presents comme fichiers `personas/` dedies sont **assumes par le persona PM** avec consignes explicites dans la sortie (cadrage, clarte, perimetre).

## Entrees

- Demande utilisateur (prompt libre ou rappel de contexte)
- `docs/delivery-state.md` (creer depuis `templates/delivery-state.template.md` si absent)
- `module.yaml`, `docs/project-context.md` si present
- Fichier DOD pointe par `dod_path` dans le state, si renseigne et si `dod_frozen` ou phase `verification` / `termine`

## Contraintes

- **Iterations d'affinage** (questions / ajustements avant gel DOD) : maximum **5** boucles. Au-dela : sortie « decision humaine requise » avec points bloquants et proposition de decoupage ou d'ADR.

## Workflow

### 1. Lecture obligatoire

1. Lire `docs/delivery-state.md`. S'il est absent : indiquer de le creer depuis `templates/delivery-state.template.md`, proposer le contenu initial minimal, puis poursuivre.
2. Lire `module.yaml` (`primary_runtime`, commandes, chemins).
3. Si present, lire `docs/project-context.md`.
4. Si `dod_path` dans le state est non vide et le fichier existe, lire ce fichier DOD.

### 2. Analyse

- Reformuler la demande en une ligne.
- Choisir **1 a n personas** parmi les fichiers sous `personas/` (via `templates/skill-persona-map.md`) avec **justification courte** par persona. Exemples : architecture -> `acp-architect-dotnet` ; implementation -> `acp-dev-dotnet` ; tests / acceptance -> `acp-qa-dotnet` ; revue -> `acp-reviewer-dotnet` ; securite -> `acp-security-dotnet` ; SQL Server -> `acp-db-sqlserver`.
- Lister quels documents ou dossiers `docs/` lire ensuite (planning, architecture, stories, etc.) selon la phase.

### 3. Iteration (affinage)

- Produire une **proposition** (plan, decoupage, risques) et des **questions ciblees** pour l'utilisateur.
- Apres reponse utilisateur : mettre a jour le contenu de `docs/delivery-state.md` (fournir le bloc Markdown a remplacer ou le fichier complet) : `decisions`, `questions_ouvertes`, `personas_actifs`, `iteration_affinage` (+1), `phase` (`affinage` tant que DOD non gelee).
- Si `iteration_affinage` > 5 avant gel DOD : arreter selon la contrainte ci-dessus.

### 4. Gel DOD

- Uniquement apres **validation explicite** utilisateur (oui / valide / go) sur le contenu de la DOD :
  - Ecrire ou mettre a jour le fichier sous `docs/dod/<feature_id>.md` depuis `templates/dod.template.md`.
  - Mettre a jour `docs/delivery-state.md` : `dod_path`, `dod_frozen: true`, `dod_frozen_at` (date ISO), `phase: dod_gel` puis `implementation`.

### 5. Implementation

- Recommander la **chaine** de skills `acp-*` selon `primary_runtime` et le pack (ex. `acp-dev-story-dotnet` pour une story .NET).
- Pour **chaque** etape suivante, indiquer le **fichier prompt** sous `.github/prompts/*.prompt.md` a ouvrir.
- **Obligation** : rappeler d'**attacher** ou d'inclure dans le contexte `docs/delivery-state.md` et le fichier DOD (`dod_path`) a chaque prompt d'implementation, pour ne pas perdre le fil.

### 6. Build et tests

- .NET : `acp-build-solution-dotnet` puis commandes `test_command` du module ; en echec : `acp-correct-solution-dotnet` en **pairing** explicite (diagnostic + correctif, une cause racine par echec majeur).
- Autres runtimes : memes **intentions** avec `build_command` / `test_command` du `module.yaml` ; adapter les prompts ou workflows sans imposer `*-dotnet` sans justification.
- Mettre a jour `docs/delivery-state.md` : `phase: build_test`, resultats succincts (vert / echec + lien erreur).

### 7. Cloture (verification contre DOD)

- **Interdiction** de declarer la livraison **terminee** sans une section **Checklist DOD** qui reprend **chaque critere** du fichier DOD et son statut (ok / ko / n/a) avec **preuve** (test, PR, fichier).
- Recommander selon le perimetre : `acp-code-review-dotnet`, `acp-security-check-dotnet`, `acp-perf-audit-dotnet-sql` si pertinent.
- Mettre a jour `docs/delivery-state.md` : `phase: termine` uniquement si tous les criteres **obligatoires** de la DOD sont ok ; sinon `phase: verification` et liste des ecarts.

## Livrables

- `docs/delivery-state.md` tenu a jour (ou propositions de diff)
- Fichier DOD sous `docs/dod/` une fois gelee
- Enchainement clair des prompts / skills suivants

## Sortie

- Paragraphe initial **Contexte lu** (phase, feature_id, DOD gelee ou non, prochaine action)
- Reste de la reponse selon l'etape courante

## Regles

- La **source de verite** est les fichiers sous `docs/` ; ne pas contredire le state sans proposer une mise a jour.
- Reutiliser `acp-orchestrator-idea` pour une **idee greenfield** / phrase seule sans state ; ce skill est centre sur **livraison avec etat fichier** et DOD.
