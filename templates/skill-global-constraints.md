# Contraintes globales (tous skills `acp-*`)

A appliquer **avant** tout workflow defini dans un `skills/acp-*/SKILL.md`.

## Configuration projet

1. Lire [module.yaml](../module.yaml) a la racine du pack (ou du depot apres fusion).
2. Lire `primary_runtime` (defaut : `dotnet`). Voir [runtime-profiles.md](runtime-profiles.md) pour l'interpretation.
3. Utiliser les chemins et commandes effectifs :
   - `dotnet_solution_path` si runtime .NET
   - `build_command`, `test_command`, `format_command` (tout runtime)
   - `planning_artifacts`, `architecture_artifacts`, `implementation_artifacts`, `runbooks_artifacts`
4. Si present, lire `docs/project-context.md` et l'aligner sur le module.
5. Si present, lire `docs/copilot-project-conventions.md` et l'appliquer **en complement** des sections ci-dessous (langue, qualite, stack). Ce fichier contient les regles **projet / equipe** ; il ne remplace pas les interdits du pack (secrets, gates minimales, flux release documente).

## Langue

- Respecter `communication_language` pour les echanges avec l'utilisateur.
- Respecter `document_output_language` pour tout livrable documentaire (PRD, architecture, stories, ADR, runbooks, commentaires de story).

## Qualite et securite

- Ne jamais committer de secrets (tokens, mots de passe, chaines de connexion completes).
- Exiger les gates du skill en utilisant `format_command`, `build_command`, `test_command` du module (souvent dotnet par defaut).
- Ne pas recommander release sans revue code et verification securite conformes au flux documente dans le README du pack.

## Stack

- Le **profil de reference** du depot est .NET + SQL Server ; d’autres runtimes sont portes par `primary_runtime` et `docs/project-context.md`.
- Ne pas imposer des packages ou conventions .NET si `primary_runtime` est `python`, `polyglot` ou `other` sans validation du contexte projet.
