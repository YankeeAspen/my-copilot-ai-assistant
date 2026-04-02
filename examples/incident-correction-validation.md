# Incident -> Correction -> Validation

## Contexte incident
- Story: `2-3-order-query-optimization`
- Symptome: echec build sur projet API + test d'integration casse
- Impact: bloquant merge

## 1. Build
- Skill: `acp-build-solution-dotnet`
- Resultat:
  - erreur compilation sur mapping DTO
  - warning critique nullable sur service

## 2. Correction
- Skill: `acp-correct-solution-dotnet`
- Actions:
  1. analyse cause racine: changement de contrat non propage
  2. correction du mapping API
  3. correction nullable avec garde explicite
  4. ajout test de regression sur contrat DTO

## 3. Revalidation
- Relance `acp-build-solution-dotnet`: build global vert
- Relance tests: unitaires + integration verts

## 4. Review/Gates
- `acp-code-review-dotnet`: approve
- `acp-security-check-dotnet`: aucun blocker
- `checklists/definition-of-done.md`: complet
- `checklists/release-gate.md`: complet

## Sortie attendue
- Incident resolu avec preuve reproductible
- Regression couverte par test
- Story eligible au passage `done`
