Executer le workflow du skill **acp-delivery-orchestrator** decrit dans :

#file:../../skills/acp-delivery-orchestrator/SKILL.md

Contraintes globales (lire en premier) :

#file:../../templates/skill-global-constraints.md

Persona (role par defaut) :

#file:../../personas/acp-pm-dotnet.md

Persona secondaire (optionnel, renfort technique) :

#file:../../personas/acp-architect-dotnet.md

Memoire de session (si present — **obligatoire a lire** ; sinon signaler et proposer de creer depuis `templates/delivery-state.template.md`) :

#file:../../docs/delivery-state.md

Contexte projet (si present) :

#file:../../module.yaml

#file:../../docs/project-context.md

Si `docs/delivery-state.md` ou `docs/project-context.md` est absent, le signaler clairement et poursuivre avec le module, le template `templates/delivery-state.template.md` et les entrees utilisateur.

Pour les phases implementation / build / revue apres gel DOD : rappeler d'ouvrir les prompts existants (`acp-dev-story-dotnet`, `acp-build-solution-dotnet`, `acp-code-review-dotnet`, etc.) en **reattachant** `docs/delivery-state.md` et le fichier DOD (`dod_path` dans le state).
