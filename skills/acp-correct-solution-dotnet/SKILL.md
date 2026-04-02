# Skill: acp-correct-solution-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-dev-dotnet.md`

## But
Corriger systematiquement une solution en echec (build/tests/review), avec preuve de non-regression.

## Entrees
- rapport de build/tests/review
- fichiers impactes
- contraintes architecture et securite

## Workflow
1. Prioriser les incidents: compilation > securite haute > tests casses > qualite.
2. Identifier la cause racine de chaque incident.
3. Appliquer un correctif minimal et robuste.
4. Ajouter au moins un test de regression pour chaque bug corrige.
5. Re-executer build et tests.
6. Boucler jusqu'a stabilisation ou escalade.

## Livrables
- plan de correction priorise
- correctifs appliques
- preuves de validation (build/tests)

## Regles
- Interdire les quick fixes non testes.
- Limiter la boucle a un nombre maximal d'iterations avant escalade explicite.
