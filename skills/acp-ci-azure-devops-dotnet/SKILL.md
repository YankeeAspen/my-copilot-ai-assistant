# Skill: acp-ci-azure-devops-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-dev-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-architect-dotnet.md`

## But
Configurer et valider un pipeline CI Azure DevOps pour projet .NET.

## Entrees
- chemin `.sln`
- agent pool cible
- exigences de qualite et securite

## Workflow
1. Verifier connexions service et permissions pipeline.
2. Configurer etapes: restore, build, test, publication des resultats.
3. Ajouter quality gates (couverture, scans securite, checks).
4. Publier artefacts et journaux d'execution.
5. Configurer triggers PR et branche principale.
6. Executer un run de validation et analyser les ecarts.

## Livrables
- pipeline CI Azure DevOps pret a l'emploi
- rapport de run avec status des gates

## Conditions d'echec
- etape critique en erreur
- quality gate non passe
