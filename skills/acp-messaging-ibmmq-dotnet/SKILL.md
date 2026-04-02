# Skill: acp-messaging-ibmmq-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-dev-dotnet.md`

## But
Integrer **IBM MQ** dans une application .NET (files, messages, connexions) avec fiabilite et securite.

## Entrees
- noms de files, modeles de messages, transactionalite attendue
- `docs/project-context.md`, politique MQ de l'organisation
- identifiants et canaux : jamais en clair dans le code

## Workflow
1. Clarifier topologie : queue manager, files, canaux, CCSID, persistance.
2. Choisir l'API .NET (client IBM MQ standard valide par l'equipe) ; ADR si choix structurant.
3. Connexion : TLS, authentification ; externaliser mots de passe et chemins de certificats.
4. Producteur : format message, correlation id, expiration, priorités si utilisées.
5. Consommateur : mode get/browse, gestion poison messages, idempotence metier, `CancellationToken`.
6. Gestion erreurs : codes retour MQ, retentatives bornees, journalisation sans donnees sensibles.
7. Tests : integration contre instance de test ou mock selon disponibilite ; tests unitaires sur mapping messages.
8. Runbook : procedure en cas de file pleine ou QM indisponible (lien `runbooks_artifacts` du module).

## Livrables
- Code + configuration (binding hors secrets)
- Documentation courte des files et comportements d'erreur

## Definition de "done"
- Pas de credentials en repo ; tests/validation equipe MQ si applicable
