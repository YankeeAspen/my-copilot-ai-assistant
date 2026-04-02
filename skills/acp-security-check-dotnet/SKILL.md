# Skill: acp-security-check-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-security-dotnet.md`

## But
Executer une verification securite minimale avant merge/release.

## Entrees
- code modifie
- configuration app
- gestion des secrets

## Workflow
1. Verifier absence de secrets hardcoded.
2. Verifier authn/authz (policy-based, least privilege).
3. Verifier validation input/output.
4. Verifier gestion d'erreurs sans fuite.
5. Supply chain : SBOM (CycloneDX ou SPDX) genere pour la solution, archive en CI si requis ; verifier licences et politique d'exceptions documentee.
6. Produire findings classes.

## Livrable
- `docs/implementation/security-report.md`

## Gate
- 0 finding critique/haut non traite
