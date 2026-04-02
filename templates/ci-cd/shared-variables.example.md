# Shared Variables Example (GitHub Actions + Azure DevOps)

## Application
- `APP_NAME`
- `APP_ENV`
- `DOTNET_VERSION`

## Security
- `JWT_AUTHORITY`
- `JWT_AUDIENCE`
- `CONNECTION_STRING` (secret)
- `API_KEY_*` (secrets)

## Deployment
- `DEPLOY_SLOT`
- `RESOURCE_GROUP`
- `SERVICE_CONNECTION` (Azure DevOps)
- `AZURE_CREDENTIALS` (GitHub Actions secret)

## Observability
- `APPINSIGHTS_CONNECTION_STRING` (secret)
- `LOG_LEVEL`
- `OTEL_*` (si OpenTelemetry : endpoint, ressource, echantillonnage)
- Checklist post-deploiement : `checklists/observability-post-release.md` ; skill `acp-observability-dotnet`

## Quality Gates
- `MIN_COVERAGE_PERCENT`
- `BLOCK_ON_HIGH_VULNERABILITIES`
