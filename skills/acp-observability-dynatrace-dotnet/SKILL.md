# Skill: acp-observability-dynatrace-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-dev-dotnet.md`

## But
Integrer **Dynatrace** a une solution .NET (OneAgent, metriques, traces, eventuellement API) en coherence avec `acp-observability-dotnet`.

## Entrees
- mode de deploiement (OneAgent sur host/K8s, extension .NET)
- environnements (non-prod / prod) et tags obligatoires
- `docs/project-context.md`

## Workflow
1. Confirmer avec la plateforme : version agent, droits, endpoints autorises.
2. Instrumentation : activer tracing applicatif compatible ASP.NET Core / workers ; eviter double instrumentation lourde inutile.
3. Metriques et dashboards : identifier les transactions cles et SLOs deja definis dans le contexte projet.
4. Secrets : API tokens Dynatrace uniquement via secret manager / variables CI ; pas dans le code.
5. Liens avec les logs (Splunk ou autre) : meme correlation id si possible.
6. Documenter : ou voir la sante d'une release, alertes minimales, lien avec `checklists/observability-post-release.md`.
7. ADR si l'instrumentation change l'architecture (ex. sidecar, build image).

## Livrables
- Configuration documentee (hors secrets) + reference dashboards ou tags
- Note d'integration dans `implementation_artifacts` ou runbook

## Definition de "done"
- Pas de token en repo ; alignement avec les gates qualite / release du pack
