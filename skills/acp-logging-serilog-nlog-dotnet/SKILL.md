# Skill: acp-logging-serilog-nlog-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-dev-dotnet.md`

## But
Configurer et harmoniser la journalisation .NET avec **Serilog** et/ou **NLog** : structure, correlation, sinks, sans secrets en configuration.

## Entrees
- stack actuelle ou cible (Serilog, NLog, ou coexistence)
- destinations (console, fichier, reseau, SIEM)
- `docs/project-context.md` (politique logging)

## Workflow

### A. Serilog
1. Valider le pipeline : enrichisseurs (correlation id, environnement), niveaux minimums par environnement.
2. Configurer les sinks (fichier, console, HTTP/Seq, etc.) sans URL ou tokens sensibles en clair dans le repo.
3. Aligner avec ASP.NET Core (`UseSerilog`) si applicable ; eviter double ecriture inutile.
4. Verifier absence de PII excessive dans les messages ; masquer champs sensibles.

### B. NLog
1. Valider `NLog.config` ou configuration code-first ; cibles et regles par namespace.
2. Layout structure (JSON si centralisation) ; correlation id coherent avec le reste de l'app.
3. Secrets : variables d'environnement ou secret manager pour chemins/credentials de sinks distants.
4. Performance : async où pertinent ; eviter logs synchrones sur hot path critique sans mesure.

### C. Commun
1. Une seule abstraction applicative si possible (ILogger) ; eviter les deux frameworks en parallele sans justification (ADR si besoin).
2. Tests : verifier qu'un niveau sample produit la structure attendue (snapshots ou integration legere).
3. Lier a `acp-observability-splunk-dotnet` ou sorties fichier si forward vers SIEM.

## Livrables
- Configuration / code d'initialisation + extrait documentation pour les equipes ops

## Definition de "done"
- Pas de secrets en repo ; `dotnet build` / tests verts
- Champs de correlation documentes pour la suite observabilite
