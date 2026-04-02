# assistant-copilot — instructions depot

Ce depot (ou copie fusionnee a la **racine** du depot applicatif) definit une methode de delivery **logicielle multi-runtime** avec GitHub Copilot. Le profil **.NET + SQL Server** est la reference documentee ; `primary_runtime` dans `module.yaml` oriente le reste.

## A lire en priorite

- Configuration : `#file:../module.yaml` (chemins, commandes build/test/format, langues). Remplissage guide par questions : `#file:./prompts/acp-bootstrap-module.prompt.md` + `#file:../templates/module-bootstrap-flow.md`.
- Contexte projet : `#file:../docs/project-context.md` si present.
- Profils runtime : `#file:../templates/runtime-profiles.md`
- Standards code et donnees (dotnet) : `#file:../templates/dotnet-sqlserver-standards.md`
- Contraintes transverses skills : `#file:../templates/skill-global-constraints.md` (inclut la lecture optionnelle de `docs/copilot-project-conventions.md` si le fichier existe).
- Conventions projet (optionnel) : attacher `#file:../docs/copilot-project-conventions.md` **uniquement** si ce fichier est present dans le depot.
- PowerShell (scripts + CI) : `#file:../templates/powershell-standards.md` ; prompt `#file:./prompts/acp-powershell-automation.prompt.md`.
- CI YAML **hors .NET** : `#file:./prompts/acp-ci-github-actions-generic.prompt.md`, `#file:./prompts/acp-ci-azure-devops-generic.prompt.md` ; templates `#file:../templates/ci-cd/github-actions-generic-ci.yml`, `#file:../templates/ci-cd/azure-devops-generic-ci.yml` ; exemple PowerShell : `#file:../templates/ci-cd/github-actions-powershell-ci.yml`.
- Integrations enterprise (Kafka, IBM MQ, Serilog/NLog, Splunk, Dynatrace, FTP/SFTP, Denodo, Control-M) : prompts sous `#file:./prompts/` (`acp-messaging-*`, `acp-observability-splunk-dotnet`, etc.) ; detail dans le README du pack section « Integrations enterprise ».
- Redaction d'un prompt Copilot (choix skill / persona, texte final sans code) : `#file:./prompts/acp-compose-prompt-dotnet.prompt.md`.
- Session de livraison avec **etat dans le depot** (orchestration, DOD fichier, ne pas perdre le fil) : `#file:./prompts/acp-delivery-orchestrator.prompt.md` ; templates `#file:../templates/delivery-state.template.md`, `#file:../templates/dod.template.md` ; une fois copies : `docs/delivery-state.md`, `docs/dod/<feature>.md`.

## Memoire de livraison (fichiers) — obligatoire si `docs/delivery-state.md` existe

1. **Avant** analyse, plan, code, redaction de DOD ou conclusion de phase : lire `docs/delivery-state.md` depuis le depot (ou l'avoir en contexte via `#file:`). En **debut de reponse**, un paragraphe court **« Contexte lu »** : phase courante, `feature_id`, DOD gelee ou non, prochaine action indiquee dans le fichier.
2. **Apres** une decision de phase, une validation utilisateur ou un gel de DOD : **mettre a jour** `docs/delivery-state.md` (ou proposer le diff exact). Ne pas conclure une etape structuree sans refleter l'etat dans ce fichier.
3. **Ne pas** declarer une livraison **terminee** sans confrontation **ligne par ligne** (ou critere par critere) avec le fichier DOD reference dans le state (`dod_path`), avec preuves (tests, PR, fichiers).
4. Pour les prompts **autres** que `acp-delivery-orchestrator` pendant une session livraison : reattacher ou rouvrir `docs/delivery-state.md` et le fichier DOD si `dod_frozen` est vrai.

## Ordre de phase (resume)

1. Planning : PRD, architecture, epics/stories (`acp-create-prd`, `acp-create-architecture-dotnet`, `acp-create-epics-stories`).
2. Implementation : story + build + correction si echec (`acp-dev-story-dotnet`, `acp-build-solution-dotnet`, `acp-correct-solution-dotnet`).
3. Validation **avant** CI/release : `acp-code-review-dotnet`, `acp-security-check-dotnet`, `acp-perf-audit-dotnet-sql` si pertinent.
4. CI/CD : `acp-cicd-quality-gates`, puis pipelines **.NET** : `acp-ci-github-actions-dotnet` et/ou `acp-ci-azure-devops-dotnet` ; pour depot **sans build .NET** (infra, YAML, scripts, polyglot) : prompts `#file:./prompts/acp-ci-github-actions-generic.prompt.md` et `#file:./prompts/acp-ci-azure-devops-generic.prompt.md`.
5. Release : `acp-release-orchestrator-dotnet` et checklists sous `checklists/`.
6. `acp-rollback-dotnet` : **uniquement** en incident post-deploiement.

## Gates locales

Utiliser les commandes du `module.yaml` ; par defaut : `dotnet format`, `dotnet build`, `dotnet test`. Jamais de secrets dans le code.

## Prompts reutilisables

Fichiers sous `.github/prompts/*.prompt.md` : executer le workflow du skill `acp-*` reference via `#file:` vers `skills/`.

## IDE

Dans VS Code, activer les prompt files : `"chat.promptFiles": true` (workspace) pour exposer `.github/prompts`.
