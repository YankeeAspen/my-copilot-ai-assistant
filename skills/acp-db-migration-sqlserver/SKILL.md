# Skill: acp-db-migration-sqlserver

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-db-sqlserver.md`
- **Secondaire (optionnel) :** `personas/acp-dev-dotnet.md`

## But
Produire des migrations SQL Server sures et rollbackables.

## Entrees
- schema cible
- modele EF Core actuel

## Workflow
1. Generer migration EF Core.
2. Verifier script SQL (up/down).
3. Evaluer compatibilite backward.
4. Ajouter plan de rollback.
5. Documenter prerequis de deploiement.

## Livrables
- migration EF Core
- `docs/runbooks/db-migration-<date>.md`

## Definition de "done"
- script relu
- rollback documente
