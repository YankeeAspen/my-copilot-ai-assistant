# Skill: acp-integration-controlm

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-dev-dotnet.md`

## But
Documenter et aligner l'application ou les **jobs Control-M** (planification, parametres, dependances) avec le delivery logiciel, sans detailler le produit en profondeur.

## Entrees
- nomenclature jobs, environnements, fenetres de batch
- interfaces avec l'app (API, fichiers, base) ; owners operations
- `docs/project-context.md` et chemins `runbooks_artifacts` du module

## Workflow
1. Identifier les jobs Control-M impactes par la release (nouveau job, changement de parametre, dependance).
2. Documenter les parametres attendus (nom, sensibilite, valeurs par environnement) hors secrets en clair.
3. Synchroniser avec les equipes ops : ordre d'execution, dependances fichier/DB, rollback batch si applicable.
4. Verifier la coherence avec les runbooks de deploiement (`acp-release-orchestrator-dotnet`, checklists release).
5. Tracer dans `docs/runbooks/` ou equivalent : qui declenche quoi, contacts escalade.
6. Si changement structurant (nouvelle chaine batch), enregistrer un ADR ou une section architecture.

## Livrables
- Fichier runbook ou section dans `runbooks_artifacts` + reference dans story / release notes

## Definition de "done"
- Operations valide la fiche ; pas de secrets en clair dans la documentation
