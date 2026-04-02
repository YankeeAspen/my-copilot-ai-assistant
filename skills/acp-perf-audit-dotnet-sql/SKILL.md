# Skill: acp-perf-audit-dotnet-sql

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-dev-dotnet.md`

## But
Detecter les bottlenecks .NET/SQL Server et proposer corrections priorisees.

## Entrees
- endpoints critiques
- requetes SQL
- metriques disponibles

## Workflow
1. Identifier points chauds (latence, CPU, IO DB).
2. Chercher N+1, requetes non indexees, allocations excessives.
3. Proposer optimisations code et DB.
4. Estimer impact attendu.
5. Definir plan de verification.

## Livrable
- `docs/implementation/perf-report.md`

## Gate
- aucun hot path critique sans plan d'action
