# Standards PowerShell (scripts et CI)

Reference pour `.ps1` / `.psm1` et etapes `pwsh` dans les pipelines. Complementaire a `acp-cicd-quality-gates` pour la partie qualite automation.

## Structure et style

- Fonctions et scripts : `[CmdletBinding()]`, parametres types et documentes (`param()` avec attributs).
- Chemins : `Join-Path`, `Test-Path -LiteralPath` pour eviter les pieges d'echappement.
- Sorties : privilegier les objets ; eviter `Write-Host` pour les donnees consommables (utiliser les canaux ou logging structure si besoin).

## Erreurs et robustesse

- Definir `$ErrorActionPreference` ou `-ErrorAction` de facon explicite ; `try` / `catch` / `finally` pour les blocs critiques.
- En CI : verifier les codes de sortie (`$LASTEXITCODE` pour appels exe externes) et faire echouer le job explicitement si necessaire.

## Securite

- Jamais de secrets en clair dans le repo ; variables d'environnement ou secrets du pipeline (GitHub Secrets, Azure DevOps secret variables).
- Ne pas logger tokens, mots de passe ou chaines de connexion completes.

## Qualite

- **PSScriptAnalyzer** : executer sur les scripts modifies (regles d'equipe ou defaut) ; mapper eventuellement sur `format_command` du `module.yaml`.
- **Pester** : pour modules ou logique non triviale ; mapper eventuellement sur `test_command`.

## CI/CD

- GitHub Actions : `shell: pwsh` (Linux/macOS/Windows selon runner).
- Azure DevOps : tache `PowerShell@2` avec `pwsh: true` si besoin de PowerShell 7+.
- Reutiliser les skills `acp-ci-github-actions-dotnet` et `acp-ci-azure-devops-dotnet` pour la structure globale du YAML ; ce document couvre le contenu des steps PowerShell.
