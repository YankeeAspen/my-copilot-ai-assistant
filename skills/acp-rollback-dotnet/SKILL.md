# Skill: acp-rollback-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-dev-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-architect-dotnet.md`

## But
Executer un rollback applicatif et base de donnees de maniere controlee.

## Entrees
- incident de deploiement (cause, impact)
- version precedente stable
- strategie DB (down migration ou compensation)

## Workflow
1. Confirmer criteres de rollback (SLO/SLA, erreurs critiques, indisponibilite).
2. Restaurer la version applicative precedente.
3. Executer rollback DB ou procedure compensatoire validee.
4. Verifier sante applicative et coherence des donnees.
5. Documenter incident, timeline et actions preventives.

## Livrables
- execution rollback tracee
- preuve de retour a l'etat stable

## Conditions d'echec
- rollback partiel
- donnees incoherentes apres rollback
