# Skill: acp-dev-story-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-dev-dotnet.md`

## But
Implementer une story en respectant AC, qualite code et non-regression.

## Entrees
- story `ready-for-dev`
- `docs/project-context.md`
- architecture

## Workflow
1. Charger la story et identifier la premiere tache incomplete.
2. Ecrire/adapter les tests.
3. Implementer le minimum pour passer les tests.
4. Refactoriser sans casser les tests.
5. Mettre a jour file list, notes et statut story.
6. Executer gates: format/build/test.

## Livrables
- code + tests
- story mise a jour en statut `review`

## Gates obligatoires
- `dotnet format`
- `dotnet build`
- `dotnet test`
