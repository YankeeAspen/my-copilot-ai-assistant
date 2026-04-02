# Skill: acp-build-solution-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-dev-dotnet.md`

## But
Construire toute la solution .NET, analyser les echecs de compilation et produire un rapport actionnable.

## Entrees
- chemin `.sln` depuis `module.yaml`
- mode build (`Debug` ou `Release`)
- contexte des changements recents

## Workflow
1. Verifier la presence de la solution et des projets references.
2. Executer la commande de format/lint si requise.
3. Executer build global de la solution.
4. Collecter erreurs et warnings critiques.
5. Classer les erreurs par cause racine et projet impacte.
6. Produire un rapport pour correction.

## Livrables
- rapport de build (erreurs, warnings, projets impactes)
- statut: `build-pass` ou `build-fail`

## Regles
- Le build global doit etre vert avant revue finale/release.
- Ne pas masquer les erreurs de compilation par des contournements temporaires.
