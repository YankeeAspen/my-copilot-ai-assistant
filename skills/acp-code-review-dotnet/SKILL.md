# Skill: acp-code-review-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-reviewer-dotnet.md`

## But
Realiser une revue code orientee risques, bugs et regressions.

## Entrees
- diff de la story
- AC et architecture

## Workflow
1. Verifier conformite AC.
2. Detecter risques severes (securite, data, perf, concurrence).
3. Evaluer maintenabilite (complexite, duplication, lisibilite).
4. Verifier tests et couverture des cas limites.
5. Produire decision et actions correctives.

## Livrable
- rapport de revue avec severites

## Decision
- `approve`, `changes-requested`, `blocked`
