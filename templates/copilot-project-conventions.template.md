# Conventions projet Copilot (assistant-copilot)

**Installation :** copier ce fichier vers `docs/copilot-project-conventions.md` a la racine du depot (apres fusion du pack) et adapter le contenu. Ce document est **optionnel** ; s'il est absent, seules les regles du pack s'appliquent (`templates/skill-global-constraints.md` a la racine du pack).

## Role

Regles **equipe / produit** qui **completent** le pack assistant-copilot : tonalite, habitudes de PR, outils preferes, exceptions metier documentees, priorites de documentation, etc.

## Garde-fous

- Ne pas **affaiblir** les regles du pack : pas de secrets en repo, respect des gates et du flux documente dans le README du pack.
- En cas de conflit entre ce fichier et `skill-global-constraints.md` ou `module.yaml`, **prevaloir** pack + `module.yaml`.
- Les personas et skills `acp-*` chargent les contraintes globales, qui referencent ce fichier **s'il existe**.

## Equipe et processus

- (ex. revue obligatoire par role X, taille max des PRs, convention de branches)

## Style et communication

- (ex. tutoiement/vouvoiement, niveau de detail des reponses, langue des commentaires de code)

## Conventions code / nommage (projet)

- (ex. prefixes, namespaces, regles specifiques hors `dotnet-sqlserver-standards.md`)

## Outils et integrations locales

- (ex. linter obligatoire, Sonar, tracker, canaux de support)

## Autres

- (libre)
