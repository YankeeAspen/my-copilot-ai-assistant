# Skill: acp-bootstrap-module

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-dev-dotnet.md`

## But

Guider l'utilisateur par **questions ciblees** (session Copilot interactive) pour **completer ou ajuster** le fichier `module.yaml` a la racine du depot, en privilegiant les **chemins** et la **structure** (`primary_runtime`, dossiers d'artefacts, chemin `.sln`) et en **allegeant** les questions sur les **commandes** lorsque `primary_runtime` est `dotnet` (defauts `dotnet build` / `dotnet test` / `dotnet format`).

## Entrees

- Depot avec `module.yaml` (souvent copie du pack ou deja partiellement rempli)
- Optionnel : arborescence existante (`docs/`, fichiers `*.sln`)

## Workflow

1. Lire le `module.yaml` a la racine du depot et le comparer mentalement au schema du pack (cles `project_name`, `primary_runtime`, artefacts, commandes, `directories`).
2. **Analyse preliminaire (lecture seule)** : detecter les fichiers `*.sln`, la presence de `docs/`, le nom du dossier racine du depot pour suggerer `project_name` et `dotnet_solution_path`.
3. Suivre l'ordre et les regles de `templates/module-bootstrap-flow.md` : **Phase A** (chemins, runtime, artefacts, solution, base) puis **Phase B** (commandes selon runtime).
4. Pour chaque question, utiliser le texte du champ **`prompt`** de la cle correspondante dans le `module.yaml` du pack comme libelle ; pour les choix fermes, reprendre les **`single-select`** existants.
5. **Ne pas supprimer** les metadonnees `prompt`, `result`, `single-select` du schema pack : mettre a jour surtout les valeurs **`default:`** avec les reponses validees (cohérentes avec `validate-module.ps1` et les patterns `result`).
6. S'assurer que **`directories`** liste les quatre artefacts comme dans le pack de reference.
7. Produire le **contenu YAML complet** pret a remplacer `module.yaml` (ou un diff clair par section si l'utilisateur prefere).
8. Indiquer la suite : `checklists/module-yaml-validation.md`, `powershell -File scripts/validate-module.ps1`, puis copie de `templates/project-context.template.md` vers `docs/project-context.md` si absent.

## Sortie

- `module.yaml` mis a jour (texte integral ou sections modifiees)
- Resume des choix (runtime, chemin solution, dossiers docs)
- Rappel des prochaines etapes (validation + `project-context.md`)

## Regles

- Poser les questions **par petits blocs** ; valider avec l'utilisateur avant d'ecraser un chemin critique.
- Si plusieurs `.sln` : demander laquelle est la solution **principale** pour le flux delivery.
- Ne pas inventer de chemins sans proposition verifiable dans le depot (sauf chemin **planifie** explicitement accepte par l'utilisateur).
- Les commandes par defaut dotnet restent valides tant que la solution et les projets suivent les conventions `dotnet` CLI standard.

## Definition de "done"

- Toutes les cles necessaires au script `validate-module.ps1` et a la checklist module sont renseignees de facon coherente.
- `primary_runtime` et `dotnet_solution_path` (si dotnet) alignes avec la realite du depot.
