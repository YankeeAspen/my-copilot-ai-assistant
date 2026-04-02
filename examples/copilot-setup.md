# Configurer GitHub Copilot avec assistant-copilot

## Installation recommandee

Renseigner `primary_runtime` dans `module.yaml` et `templates/runtime-profiles.md` pour tout projet non strictement .NET.

1. Fusionner le contenu du pack a la **racine** du depot applicatif (pas dans un sous-dossier profond), pour que les chemins relatifs suivants restent valides :
   - `.github/prompts/*.prompt.md` → `#file:../../skills/.../SKILL.md`
   - `.github/copilot-instructions.md` → `#file:../module.yaml`, etc.

2. Si le depot a deja un dossier `.github/` :
   - Fusionner `copilot-instructions.md` : combiner vos regles existantes avec celles du pack (eviter les contradictions).
   - Ajouter le sous-dossier `prompts/` et `instructions/` sans ecraser vos workflows `workflows/` existants.

## VS Code

1. Ouvrir les parametres workspace JSON et activer :
   ```json
   "chat.promptFiles": true
   ```
2. Dans Copilot Chat, utiliser **Prompt...** et choisir un fichier `acp-*.prompt.md`, ou la syntaxe `/NomDuPrompt` selon la version.

3. Verifier dans les references de reponse que `copilot-instructions.md` est bien pris en compte.

## JetBrains / Xcode / Eclipse

Souvent **uniquement** `.github/copilot-instructions.md` est charge automatiquement. Utiliser les skills via copie du contenu de `skills/acp-*/SKILL.md` dans le chat ou des instructions personnelles.

## Chemins si le pack est dans un sous-dossier

Si vous copiez le pack dans `tools/assistant-copilot/` par exemple, les `#file:` des prompts **ne correspondront plus** aux skills : regénerez les chemins relatifs depuis `.github/prompts/` vers le bon prefixe (ex. `../../tools/assistant-copilot/skills/...`) ou deplacez `.github` a la racine du depot.

## Validation

Apres remplissage de `module.yaml`, executer `scripts/validate-module.ps1` et la checklist `checklists/module-yaml-validation.md`.
