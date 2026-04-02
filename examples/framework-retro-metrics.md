# Retro cadre assistant-copilot — metriques

Remplir en fin de sprint ou de release train pour ajuster le pack (skills, checklists, durees).

| Metrique | Periode | Valeur | Commentaire |
|----------|---------|--------|-------------|
| Duree mediane ready-for-dev → done | | | |
| Nombre moyen d'invocations `acp-correct-solution-dotnet` avant build vert | | | |
| % stories avec tests d'integration | | | |
| Incidents post-deploiement lies au dernier train | | | |
| Rollbacks declenches | | | |
| Temps moyen revue (`acp-code-review-dotnet`) | | | |
| Items checklist les plus souvent en echec | | | |

## Actions

- Ajuster `module.yaml` ou `project-context` si les commandes ou chemins sont sources d'erreur.
- Proposer de nouveaux ADR si les memes debats architecture reviennent.
- Simplifier ou decouper les skills trop lourds.
