# Skill: acp-quick-dev-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-dev-dotnet.md`

## But
Livrer rapidement une petite evolution sans sacrifier les gates qualite.

## Entrees
- besoin cible faible complexite
- contexte technique existant

## Workflow
1. Clarifier scope en moins de 10 points.
2. Definir AC minimales.
3. Implementer avec tests cibles.
4. Executer `dotnet format`, `dotnet build`, `dotnet test`.
5. Lancer revue rapide (`acp-code-review-dotnet`).

## Livrables
- note de spec rapide
- code + tests
- mini rapport de revue

## Contraintes
- reserve aux changements < 1 jour
