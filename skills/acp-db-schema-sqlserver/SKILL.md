# Skill: acp-db-schema-sqlserver

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-db-sqlserver.md`
- **Secondaire (optionnel) :** `personas/acp-architect-dotnet.md`

## But
Concevoir le schema SQL Server pour supporter les stories ciblees.

## Entrees
- besoins fonctionnels
- contraintes volumetrie/performance

## Workflow
1. Definir tables, cles, contraintes.
2. Documenter index et cardinalites.
3. Definir conventions de nommage SQL.
4. Lister impacts applicatifs EF Core.

## Livrable
- `docs/architecture/sql-schema.md`

## Regles
- integrite referentielle explicite
- index justifies (lecture/ecriture)
