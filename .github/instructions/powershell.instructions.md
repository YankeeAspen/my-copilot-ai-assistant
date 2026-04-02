---
applyTo: "**/*.ps1,**/*.psm1"
---

Lors de modifications de scripts ou modules PowerShell :

- Lire `#file:../../templates/powershell-standards.md` (style, erreurs, securite, PSScriptAnalyzer, Pester, CI).
- Appliquer `#file:../../templates/skill-global-constraints.md` (langues depuis `module.yaml`, pas de secrets).
- Gates locales : commandes definies dans `#file:../../module.yaml` (`format_command`, `test_command`) si mappees vers Analyzer / Pester.
- Pour la structure des workflows CI, s'aligner sur les skills `acp-ci-github-actions-dotnet` / `acp-ci-azure-devops-dotnet` pour les etapes YAML.
