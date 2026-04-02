# Skill: acp-cicd-quality-gates

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-dev-dotnet.md`

## But
Centraliser la verification des gates qualite, securite et performance avant promotion.

## Entrees
- resultats build/test/couverture
- resultats scans securite/dependances/secrets
- indicateurs de performance critiques

## Workflow
1. Verifier build global vert.
2. Verifier tests et seuil de couverture.
3. Verifier scans securite (zero critique/haut non traite).
4. Si politique projet : verifier presence du livrable SBOM (CycloneDX/SPDX) et scan licences.
5. Verifier budget de performance sur hot paths.
6. Emettre decision gate: pass / concerns / fail.

## Livrables
- rapport de gates CI/CD
- decision exploitable par release orchestration

## Conditions d'echec
- un gate bloquant non passe
