# Project Context

## Project
- Name:
- Domain:
- Owners:

## Profil de depot / livrables (aligner sur la realite du repo)

Declarer ici le **type principal** du depot pour eviter que les assistants imposent .NET par defaut.

- **delivery_profile** (un libelle) : `dotnet_app` | `ci_yaml_only` | `sql_scripts` | `powershell` | `polyglot` | `other` (preciser en une phrase si `other`).
- **Chemins CI / infra** :
  - GitHub Actions : dossier des workflows (souvent `.github/workflows/`) et noms des fichiers YAML cles.
  - Azure DevOps : chemin du YAML pipeline (ex. `azure-pipelines.yml`, `azure-pipelines/ci.yml`) ou lien vers definition classic.
- **Scripts / donnees** (si pertinent) :
  - Scripts SQL : repertoire (ex. `db/scripts/`, `migrations/`) et outil (Flyway, sqlcmd, DACPAC, etc.).
  - PowerShell : repertoires `.ps1` / `.psm1` et outil de test (Pester, etc.).
- **Commandes locales / CI** : reprendre ou pointer vers `module.yaml` pour `format_command`, `build_command`, `test_command` (memes chaines que le pipeline generique doit executer).

## Languages (aligner sur module.yaml)
- Communication (equipe / sessions IA):
- Documents (PRD, architecture, stories, runbooks):

## Runtime (aligner sur module.yaml `primary_runtime`)
- Valeur : dotnet | python | polyglot | other
- Si polyglot / other : lister les runtimes et repertoires sources

## Stack
- Langages et frameworks (ex. .NET, Python, Node):
- Versions runtime / SDK:
- API / services (ex. ASP.NET Core, FastAPI):
- ORM / acces donnees (ex. EF Core, SQLAlchemy):
- Base de donnees (ex. SQL Server, PostgreSQL):

## Architecture rules
- Layer boundaries:
- Dependency inversion rules:
- API conventions:

## Coding standards
- Nullable enabled:
- Async policy:
- Logging policy:
- Error handling policy (ProblemDetails):

## Database standards
- Naming conventions:
- Migration policy:
- Indexing policy:
- Transaction policy:

## Testing standards
- Unit tests framework: xUnit
- Assertion style:
- Integration tests approach:
- Minimum quality bar:

## Security standards
- Secret management:
- AuthN/AuthZ model:
- Input validation:
- Sensitive data handling:

## Performance constraints
- API p95 target:
- DB query budget:
- Throughput target:
