# Exemple : flux orchestrateur idee

## Idee initiale (phrase)

« Ajouter un endpoint qui renvoie les commandes clients des 30 derniers jours avec pagination. »

## Etape 1 — Skill `acp-orchestrator-idea`

1. Capture: une ligne + hypotheses (ex. auth deja en place, SQL Server existant).
2. Clarification: utilisateur interne vs externe, volume attendu, PII.
3. Generation: remplissage de `templates/idea-prompt-pack.template.md` vers `docs/planning/idea-prompt-pack.md` (exemple de chemin).
4. Validation: utilisateur confirme ou ajuste le prompt (iteration 1).
5. Personas: PM (PRD court), Architecte (contrat API), Dev (implementation), DB si index, Reviewer en fin.
6. Chaine skills typique:
   - `acp-create-prd` (si besoin formalise)
   - `acp-create-architecture-dotnet`
   - `acp-create-epics-stories`
   - `acp-dev-story-dotnet`
   - `acp-build-solution-dotnet` / `acp-correct-solution-dotnet` si echec
   - `acp-code-review-dotnet`, `acp-security-check-dotnet`
   - `acp-perf-audit-dotnet-sql` si requetes lourdes

## Etape 2 optionnelle — `acp-expert-ia`

Si la question est « faut-il du cache / quelle pagination / risque N+1 », lancer `acp-expert-ia` pour options A/B/C et recommandation avant de figer l'architecture.

## Etape 3 — Execution

Invoquer chaque skill de la chaine dans l'ordre, une session Copilot par etape si besoin.

## Fin

Story `done` apres gates et `checklists/definition-of-done.md`.
