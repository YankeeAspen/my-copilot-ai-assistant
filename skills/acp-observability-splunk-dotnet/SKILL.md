# Skill: acp-observability-splunk-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-dev-dotnet.md`

## But
Raccorder une application .NET a **Splunk** (ingestion via HEC, forwarder universel, ou logs fichiers structures) avec champs normalises et sans exposition de secrets.

## Entrees
- mode d'ingestion valide par l'equipe plateforme (HEC, UF, autre)
- index, sourcetype, champs obligatoires (correlation, environnement, service)
- `docs/project-context.md` ; alignement avec `acp-logging-serilog-nlog-dotnet` si Serilog/NLog

## Workflow
1. Cartographier le chemin des logs : application -> forwarder/HEC -> index.
2. Definir le format (JSON structure recommande) et les champs minimums alignes avec `acp-observability-dotnet` et la checklist post-release.
3. Si HEC : token et URL via secrets / variables d'environnement uniquement ; jamais dans le repo.
4. Correlation : propager trace/correlation id des logs HTTP vers les evenements Splunk.
5. Echantillonnage ou filtrage si volume eleve ; eviter PII non necessaire.
6. Valider avec l'equipe Splunk (index, retention, CIM si utilise).
7. Documenter le runbook : ou chercher les logs d'une release, requetes type.

## Livrables
- Configuration applicative ou forwarder (hors secrets) + doc sous `runbooks_artifacts` ou `implementation_artifacts`

## Definition de "done"
- Aucun token Splunk en repo ; champs documentes ; lien avec observabilite generique du pack
