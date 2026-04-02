# Skill: acp-messaging-kafka-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-dev-dotnet.md`

## But
Integrer **Apache Kafka** dans une application .NET (producteurs, consommateurs, configuration) avec securite, fiabilite et observabilite de base.

## Entrees
- besoins (topics, schemas, latence, ordre, idempotence)
- `docs/project-context.md`, contraintes reseau et compliance
- politique secrets (SASL/SSL, certificats) hors repo

## Workflow
1. Valider le perimetre : topics, partitions, strategie de consommation (group id), retention, compaction si besoin.
2. Choisir le client .NET (Confluent.Kafka ou autre stack validee par l'equipe) ; figer versions dans ADR si decision structurante (`acp-record-adr-dotnet`).
3. Definir les schemas (Avro/JSON/Protobuf) et la compatibilite ; documenter evolution et breaking changes.
4. Implementer producteur : gestion erreurs, retries bornes, pas de PII en clair dans les messages si sensible.
5. Implementer consommateur : gestion offset, idempotence cote metier, annulation (`CancellationToken`), dead-letter si politique projet.
6. Securite : SASL_SSL, ACLs cote cluster ; secrets via configuration securisee uniquement.
7. Tests : tests d'integration avec broker de test ou conteneur si disponible ; tests unitaires sur serialisation et handlers.
8. Observabilite : correlation avec logs applicatifs ; lier a `acp-observability-dotnet` pour metriques/latence.

## Livrables
- Code clients + configuration documentee
- Note sous `implementation_artifacts` ou story (comportement erreurs, topics)

## Definition de "done"
- Aucun secret en repo ; build/tests verts
- Comportement documente en cas d'indisponibilite broker
