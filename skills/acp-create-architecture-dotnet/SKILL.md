# Skill: acp-create-architecture-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`

## But
Designer l'architecture cible ASP.NET Core + SQL Server et formaliser les ADR.

## Entrees
- `docs/planning/PRD.md`
- contraintes de securite/performance

## Workflow
1. Definir style architectural (modulaire, clean, etc.).
2. Poser boundaries, couches, contracts API.
3. Definir modeles de donnees et strategie EF Core/SQL.
4. Prevoir observabilite, erreurs, resilience.
5. Capturer les decisions structurantes via `acp-record-adr-dotnet` et `templates/adr.template.md` (dossier recommande `docs/architecture/adr/`).

## Livrables
- `docs/architecture/architecture.md`
- Fichiers `docs/architecture/adr/ADR-NNN-*.md` (ou chemin `architecture_artifacts` du module)

## Definition de "done"
- decisions majeures justifiees
- impacts securite/performance traces
