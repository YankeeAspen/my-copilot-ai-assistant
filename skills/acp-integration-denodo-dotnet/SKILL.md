# Skill: acp-integration-denodo-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-dev-dotnet.md`

## But
Consommer des vues ou services **Denodo** depuis une application .NET (JDBC/ODBC via pilotes supportes, ou API exposee par la couche Denodo) en respectant performance et securite.

## Entrees
- mode d'acces valide (driver JDBC via bridge, ODBC, REST OData/JDBC thin selon stack)
- vues autorisees, quotas, politique de cache
- `docs/project-context.md` ; alignement avec l'equipe data / Denodo

## Workflow
1. Valider le chemin d'acces avec les proprietaires Denodo (vues, droits, pas de requetes ad hoc non validees).
2. Parametrer connexion : URL, credentials via secret manager ; timeouts et pool de connexions adaptes.
3. Performance : pagination, projections, eviter N+1 cote applicatif ; mesurer latence vs acces SQL direct.
4. Securite : pas de SQL concatene ; parametres lies ; masquage colonnes sensibles cote Denodo si disponible.
5. Resilience : retry borne sur erreurs transitoires ; circuit breaker si politique projet.
6. Tests : integration contre environnement Denodo de test ; jeux de donnees anonymises.
7. ADR si le pattern d'acces change l'architecture donnees.

## Livrables
- Code d'acces + configuration (hors secrets) + documentation des vues utilisees

## Definition de "done"
- Pas de credentials en repo ; acces revu par equipe Denodo si exige
