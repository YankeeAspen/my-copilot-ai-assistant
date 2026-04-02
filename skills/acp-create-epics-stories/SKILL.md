# Skill: acp-create-epics-stories

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-pm-dotnet.md`

## But
Transformer PRD + architecture en epics/stories pretes pour implementation.

## Entrees
- `docs/planning/PRD.md`
- `docs/architecture/architecture.md`

## Workflow
1. Decouper en epics coherentes.
2. Creer stories verticales (valeur utilisateur).
3. Ajouter AC, taches techniques, risques, donnees impactees.
4. Sequencer le sprint status.

## Livrables
- `docs/implementation/epics/*.md`
- `docs/implementation/stories/*.md`
- `docs/implementation/sprint-status.yaml`

## Definition de "done"
- chaque story est autonome
- AC non ambigues et testables
