# Skill: acp-compose-prompt-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-pm-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-architect-dotnet.md`

## But

A partir d'un **besoin simple** exprime en langage naturel, **choisir** le persona, le skill `acp-*` et le prompt Copilot adaptes, puis **rediger uniquement le prompt final** (texte pret a coller dans le chat). Aucune implementation, aucun fichier modifie, aucun code produit.

## Entrees

- Phrase ou court paragraphe decrivant le besoin
- Optionnel : `module.yaml`, `docs/project-context.md` pour aligner runtime et stack

## Workflow

1. Lire `templates/skill-persona-map.md` et, si present, `primary_runtime` dans `module.yaml`.
2. Classer l'intention : planning, architecture, implementation, validation, CI/CD, integration enterprise, strategie IA lourde, etc.
3. Selectionner **un skill `acp-*` principal** (et un persona primaire coherent). Si ambigu, proposer une alternative courte en une ligne.
4. Indiquer le **fichier prompt** a utiliser : `.github/prompts/<skill>.prompt.md` et les `#file:` a attacher (skill, persona, module, project-context selon le pattern du pack).
5. Rediger le **prompt final** : instructions claires pour l'agent Copilot qui executera le skill cible, criteres de succes, limites explicites (ex. ne pas sortir du scope du skill).

## Sortie obligatoire (ordre fixe)

1. **Skill recommande** — nom `acp-*` exact.
2. **Persona recommande** — chemin `personas/*.md` primaire (et secondaire si utile).
3. **Prompt Copilot** — fichier `.github/prompts/...` a invoquer.
4. **Fichiers a attacher** — liste des `#file:` pertinents (copier les chemins relatifs depuis la racine du depot fusionne).
5. **Prompt final** — un seul bloc markdown ou texte **pret a coller** comme message utilisateur (sans code source, sans patch, sans creation de fichiers).

## Regles

- **Interdit** : ecrire ou proposer du code, diffs, commandes shell executables comme livrable principal, ou modifier le depot.
- **Autorise** : redaction, clarification des attentes dans le prompt, rappel des contraintes `skill-global-constraints` si utile dans le texte du prompt final.
- Ne pas substituer ce skill a `acp-expert-ia` pour les sujets **strategie IA** (modeles, RAG, couts, risques) : dans ce cas, recommander `acp-expert-ia` en plus ou a la place.
- Ne pas substituer ce skill a `acp-orchestrator-idea` pour un **greenfield** complet : si le besoin est une idee / nouveau projet, orienter vers l'orchestrateur dans le bloc « Skill recommande » ou en alternative.

## Definition de "done"

- Le **prompt final** est autonome : un copier-coller suffit pour lancer une session Copilot alignee sur le bon skill et persona.
- Aucune ambiguite sur le skill `acp-*` a executer ensuite.
