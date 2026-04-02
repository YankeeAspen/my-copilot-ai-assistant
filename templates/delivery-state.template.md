# Etat de session de livraison (Copilot)

Copier ce fichier vers **`docs/delivery-state.md`** a la racine du depot applicatif (meme niveau que `module.yaml`). C'est la **memoire de travail** versionnee : le chat ne remplace pas ce fichier sans le mettre a jour explicitement.

## Meta

- **feature_id** : (slug court, ex. `auth-mfa`)
- **phase** : `analyse` | `affinage` | `dod_gel` | `implementation` | `build_test` | `verification` | `termine`
- **dod_path** : chemin relatif vers le fichier DOD (ex. `docs/dod/auth-mfa.md`) ; laisser vide jusqu'a creation du fichier DOD
- **dod_frozen** : `false` | `true` (passer a `true` uniquement apres validation explicite utilisateur)
- **dod_frozen_at** : (ISO date ou vide)
- **iteration_affinage** : nombre entier (incrementer a chaque boucle question/reponse ; plafond voir skill `acp-delivery-orchestrator`)

## Objectif

Une phrase : ce que cette session doit livrer.

## Personas actifs

Lister les personas `personas/acp-*.md` retenus pour cette iteration et une ligne de justification chacun (ex. `acp-qa-dotnet` — cas de test acceptance).

## Decisions

- (date / decision / impact)

## Questions ouvertes

- (questions en attente de reponse utilisateur)

## Prochaine action

- Skill ou prompt recommande ensuite (ex. `acp-dev-story-dotnet` + `.github/prompts/acp-dev-story-dotnet.prompt.md`)

## Historique (court)

Dernieres bascules de phase ou decisions structurantes (3 a 5 lignes max ; archiver le reste ailleurs si besoin).

---

*Template source : `templates/delivery-state.template.md` (pack assistant-copilot).*
