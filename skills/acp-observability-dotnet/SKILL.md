# Skill: acp-observability-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-dev-dotnet.md`

## But
Definir et valider l'observabilite minimale (logs, metriques, tracing) et les criteres post-deploiement pour une application .NET + SQL Server.

## Entrees
- `docs/project-context.md`
- architecture et NFR (disponibilite, performance)
- variables d'environnement / secrets d'observabilite (sans les exposer)

## Workflow
1. Cartographier les flux critiques (API, jobs, acces SQL).
2. Specifier le format des logs structure et les champs obligatoires (correlation id, contexte metier anonymise).
3. Lister les metriques minimales (latence, erreurs, sante dependances, SQL si pertinent).
4. Si tracing : definir les spans minimaux et la politique d'echantillonnage.
5. Definir la fenetre post-release et les seuils declenchant investigation ou rollback.
6. Aligner avec `templates/ci-cd/shared-variables.example.md` (ex. App Insights).

## Livrables
- Section ou fichier sous `runbooks_artifacts` du module (ex. `docs/runbooks/observability.md`) — chemin effectif depuis `module.yaml`
- Reference croisee avec `checklists/observability-post-release.md`

## Definition de "done"
- Checklist post-release applicable sans ambiguite
- Aucune donnee sensible documentee en clair
