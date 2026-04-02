# Skill: acp-release-orchestrator-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-pm-dotnet.md`

## But
Orchestrer la promotion dev -> stage -> prod avec approvals et controles.

## Entrees
- artefact valide issu du CI
- strategie de release (rolling/blue-green/canary)
- regles d'approbation

## Workflow
1. Verifier preconditions de release (quality gate, securite, migrations).
2. Deployer sur dev et executer smokes.
3. Promouvoir sur stage avec checks supplementaires.
4. Demander approvals pre-prod/prod.
5. Deployer prod et surveiller la stabilite.
6. Declencher rollback si conditions d'alerte atteintes.

## Livrables
- plan de release trace
- statut de promotion par environnement

## Conditions d'echec
- smoke tests en echec
- gate de securite/performance bloque
