# Validation de `module.yaml`

A executer apres remplissage du module et avant de s'engager dans la chaine `acp-*`.

## Fichiers et chemins

- [ ] `module.yaml` present a la racine du pack (ou du depot fusionne)
- [ ] `primary_runtime` renseigne (defaut `dotnet`) et coherent avec `docs/project-context.md`
- [ ] Si `primary_runtime` est `dotnet` : `dotnet_solution_path` — fichier `.sln` existant ou chemin planifie cree avant le premier build
- [ ] Chaque entree de `directories` : dossiers creables ou deja presents
- [ ] `docs/project-context.md` present (copie depuis `templates/project-context.template.md`)

## Commandes

- [ ] `format_command` executable depuis la racine du depot
- [ ] `build_command` executable
- [ ] `test_command` executable (ou documenter pourquoi differe en CI uniquement)

## Cohérence

- [ ] Langues (`communication_language`, `document_output_language`) alignees avec `docs/project-context.md`
- [ ] `database_provider` coherent avec le stack reel du projet

## Automatisation

- Script optionnel : `scripts/validate-module.ps1` (verification de presence et `Test-Path`).
