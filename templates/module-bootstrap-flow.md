# Flux guide : remplissage de `module.yaml`

Reference pour le skill `acp-bootstrap-module`. Les libelles de questions viennent des champs `prompt` du `module.yaml` du pack ; l'ordre ci-dessous optimise le demarrage (chemins d'abord, commandes en dernier).

## Phase A — Structure et chemins (prioritaire)

1. `project_name` — defaut : nom du dossier racine du depot (`{directory_name}`).
2. `communication_language` / `document_output_language` — defauts souvent `Francais`.
3. `user_skill_level` — choix guide (`single-select` du pack).
4. `primary_runtime` — **obligatoire** avant les chemins solution ; `single-select`.
5. `planning_artifacts`, `architecture_artifacts`, `implementation_artifacts`, `runbooks_artifacts` — chemins **relatifs au root du depot** (ex. `docs/planning`) ; aligner sur une arborescence existante si deja presente.
6. Si `primary_runtime` est `dotnet` : `dotnet_solution_path` — proposer d'abord les fichiers `*.sln` **detectes** dans le depot ; sinon chemin planifie (ex. `{project-root}/src/Nom.sln`).
7. `database_provider` — souvent `sqlserver` pour le profil pack.

## Phase B — Commandes (alleger si dotnet)

- Si `primary_runtime` est `dotnet` : **garder les defauts** `dotnet build`, `dotnet test`, `dotnet format` **sans poser trois questions separees**, sauf si l'utilisateur demande explicitement des commandes differentes (solution dans un sous-dossier, `--configuration`, etc.).
- Si `python`, `polyglot` ou `other` : demander `build_command`, `test_command`, `format_command` (ou equivalent) et les noter dans `docs/project-context.md` si besoin de precision.

## Finalisation

- Verifier que la liste `directories` du `module.yaml` contient les quatre variables `{planning_artifacts}`, `{architecture_artifacts}`, `{implementation_artifacts}`, `{runbooks_artifacts}` comme dans le pack.
- Livrer le fichier mis a jour : **conserver** les champs `prompt`, `result`, `single-select` du pack pour chaque cle (mettre a jour surtout les `default:` avec les reponses validees).
- Renvoyer vers `checklists/module-yaml-validation.md` et `scripts/validate-module.ps1`.
