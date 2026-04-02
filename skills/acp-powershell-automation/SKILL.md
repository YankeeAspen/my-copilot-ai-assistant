# Skill: acp-powershell-automation

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-dev-dotnet.md`

## But
Concevoir, modifier ou integrer du **PowerShell** pour scripts locaux (`.ps1`, `.psm1`) et pour les **etapes de pipeline** CI/CD (GitHub Actions `pwsh`, Azure DevOps `PowerShell@2`), avec qualite et securite.

## Entrees
- besoin (script, module, step CI, refonte)
- chemins des fichiers concernes
- `docs/project-context.md` et `module.yaml` (commandes `format_command` / `test_command` si mappees vers Analyzer / Pester)

## Workflow

### A. Developpement de scripts

1. Clarifier le perimetre (parametres, environnement cible Windows / pwsh / Core).
2. Structurer avec `[CmdletBinding()]`, parametres types, gestion d'erreurs explicite (`-ErrorAction`, `try`/`catch` si pertinent).
3. Utiliser `Join-Path` / `-LiteralPath` ; eviter les secrets en dur (voir contraintes globales).
4. Executer **PSScriptAnalyzer** sur les fichiers modifies (ou la commande definie dans `format_command` si l'equipe l'y a mappee).
5. Si logique critique ou module : ajouter ou mettre a jour des tests **Pester** (ou `test_command` du module si mappe).
6. Documenter l'usage (parametres, prerequis) dans la story ou `docs/runbooks/` si operationnel.

### B. CI / CD

1. Identifier le moteur : GitHub Actions ou Azure DevOps (ou les deux) ; s'appuyer sur `acp-ci-github-actions-dotnet` / `acp-ci-azure-devops-dotnet` pour la **forme** du workflow YAML, independamment du runtime applicatif.
2. Pour les steps PowerShell :
   - GitHub Actions : `shell: pwsh` quand PowerShell 7+ est requis.
   - Azure DevOps : `PowerShell@2` avec `pwsh: true` si besoin.
3. Passer les secrets via mecanismes du pipeline ; ne pas afficher les valeurs sensibles dans les logs.
4. Gerer les echecs : verifier `$LASTEXITCODE` apres les appels externes ; faire echouer le job sur erreur non tritee.
5. Inclure les checks PSScriptAnalyzer / Pester dans le pipeline si la politique projet l'exige ; aligner avec `acp-cicd-quality-gates`.

## Livrables
- Scripts / modules ou extraits YAML de steps mis a jour
- Preuves d'execution locale ou logs CI si demande

## Gates
- Utiliser `format_command` et `test_command` du `module.yaml` lorsqu'ils pointent vers Analyzer / Pester ; sinon les executer comme recommandations et le noter dans le livrable.

## Definition de "done"
- Aucun secret en clair
- Analyzer sans violations bloquantes definies par l'equipe
- Etapes CI coherentes avec les skills CI du pack
