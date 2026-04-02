# Skill: acp-test-strategy-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-qa-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-architect-dotnet.md`

## But
Formaliser la strategie de tests (pyramide, seuils, donnees, contrats) pour le projet .NET afin d'homogeneiser les stories et les gates CI.

## Entrees
- `docs/project-context.md`
- PRD / risques metier
- surface API exposee (interne vs externe)

## Workflow
1. Poser la pyramide : unitaire (logique metier), integration (API, EF/SQL), E2E leger si besoin metier.
2. Definir un seuil de couverture minimal ou des dossiers exclus (avec justification).
3. Preciser les regles de donnees de test (fixtures, bases dediees, idempotence).
4. Si API consommee hors equipe : exiger contrat (OpenAPI + tests de non-regression ou tests de contrat).
5. Rappeler : un test de regression par bug corrige (aligne `checklists/definition-of-done.md`).

## Livrables
- Mise a jour de `docs/project-context.md` (section Testing standards) ou document dedie sous `architecture_artifacts` / `implementation_artifacts` selon le module

## Definition de "done"
- Regles actionnables par `acp-dev-story-dotnet` et par la CI
- Pas de conflit avec les commandes `test_command` du `module.yaml`
