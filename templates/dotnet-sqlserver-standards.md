# Standards .NET + SQL Server

S'applique lorsque `primary_runtime` est `dotnet` (voir `templates/runtime-profiles.md`).

## .NET
- Activer nullable reference types.
- Utiliser `async/await` avec `CancellationToken`.
- Centraliser la gestion d'erreurs via ProblemDetails.
- Logging structure (correlation id, contexte metier).
- Validation d'entree systematique.

## EF Core
- Eviter N+1 (`Include`, projections, pagination).
- Limiter le tracking si inutile (`AsNoTracking`).
- Migrations versionnees et revues.
- Configurer les index dans le modele.

## SQL Server
- Requetes parametrees uniquement.
- Indexation basee sur cardinalite et plans d'execution.
- Transactions explicites sur operations critiques.
- Eviter locks longs et scans table complets sur hot paths.

## Tests
- Pyramide : priorite logique metier (unitaire), puis persistence et API (integration), E2E cible uniquement les parcours a risque ou contractuellement critiques.
- Unit tests sur logique metier ; integration tests sur persistence et API avec donnees de test maitrisees (fixtures, base dediee, idempotence).
- Definir un seuil de couverture minimal par equipe ou exclure explicitement les dossiers non pertinents (generated, UI boilerplate) avec justification.
- API exposee a des consommateurs externes : OpenAPI a jour et tests de non-regression sur contrats ou schemas cles.
- Non-regression obligatoire sur stories critiques ; un test de regression par bug corrige.

## Securite
- Secrets via variables d'environnement ou secret manager.
- AuthN/AuthZ policy-based.
- Journaliser sans exposer donnees sensibles.
- Traiter OWASP API Top 10 comme baseline.
