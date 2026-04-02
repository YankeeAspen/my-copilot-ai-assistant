# Skill: acp-api-contract-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-dev-dotnet.md`

## But
Garantir la coherence entre implementation ASP.NET Core, documentation OpenAPI et consommateurs (versioning, erreurs, tests minimaux).

## Entrees
- endpoints exposes ou modifies
- `docs/project-context.md` (conventions API)

## Workflow
1. Verifier que la spec OpenAPI (Swagger) reflete les routes, schemas et codes de reponse courants.
2. Documenter la politique de versioning (URL, header, ou package) et les breaking changes attendus.
3. Aligner les erreurs avec ProblemDetails et eviter les fuites d'information.
4. Definir ou mettre a jour des tests minimaux : statuts HTTP, schema des reponses cles, cas d'erreur.
5. Si API publique : checklist de publication (changelog API, communication aux consommateurs).

## Livrables
- Mise a jour OpenAPI / annotations
- Tests API concernes verts avec `test_command` du module
- Note dans story ou `docs/implementation/` si necessaire

## Definition de "done"
- Aucun endpoint documente sans correspondance dans le code (ou explicitement marque experimental)
