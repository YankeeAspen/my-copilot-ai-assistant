# Incident CI/CD Rollback

## Incident
- deployment prod reussi techniquement
- erreur metier critique detectee apres 5 minutes

## Reponse
1. Declencher `acp-rollback-dotnet`
2. Revenir a la version precedente stable
3. Appliquer rollback DB ou compensation validee
4. Executer smoke tests et controle integrite

## Post-Incident
- documenter root cause
- creer test de regression
- corriger pipeline/gates si necessaire
- replanifier release avec `acp-release-orchestrator-dotnet`
