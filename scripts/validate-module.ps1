#Requires -Version 5.1
<#
.SYNOPSIS
  Verifications minimales pour assistant-copilot : presence de module.yaml et des dossiers par defaut.
.NOTES
  Si vous avez personnalise les resultats dans module.yaml, completez avec la checklist manuelle.
#>
param(
    [string]$ModuleRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'
$yamlPath = Join-Path $ModuleRoot 'module.yaml'
if (-not (Test-Path -LiteralPath $yamlPath)) {
    Write-Error "Fichier introuvable : $yamlPath"
}

$content = Get-Content -LiteralPath $yamlPath -Raw
$dirName = Split-Path $ModuleRoot -Leaf

function Get-DefaultUnderKey {
    param([string]$Key)
    # Ligne par ligne : eviter que .* mange les blocs YAML suivants
    if ($content -match "(?m)^${Key}:\s*\r?\n((?:^[ \t]+[^\r\n]+\r?\n)+)") {
        $block = $Matches[1]
        if ($block -match 'default:\s*"(.+)"') {
            return $Matches[1]
        }
    }
    return $null
}

function Expand-ModulePath {
    param([string]$Pattern)
    if (-not $Pattern) { return $null }
    $p = $Pattern -replace '\{project-root\}', $ModuleRoot -replace '\{directory_name\}', $dirName
    if ($p -match '\{project_name\}') {
        $pn = Get-DefaultUnderKey 'project_name'
        if (-not $pn) { $pn = $dirName }
        $pn = $pn -replace '\{directory_name\}', $dirName
        $p = $p -replace '\{project_name\}', $pn
    }
    return $p
}

foreach ($key in @('planning_artifacts', 'architecture_artifacts', 'implementation_artifacts', 'runbooks_artifacts')) {
    $def = Get-DefaultUnderKey $key
    if ($def) {
        $full = Expand-ModulePath $def
        if ($full -and ($full -notmatch '\{')) {
            if (-not (Test-Path -LiteralPath $full)) {
                Write-Warning "Dossier absent : $full ($key)"
            }
            else {
                Write-Host "OK $key -> $full"
            }
        }
    }
}

$runtime = Get-DefaultUnderKey 'primary_runtime'
if (-not $runtime) { $runtime = 'dotnet' }

$slnPattern = Get-DefaultUnderKey 'dotnet_solution_path'
if ($slnPattern -and ($runtime -eq 'dotnet')) {
    $sln = Expand-ModulePath $slnPattern
    if ($sln -and ($sln -notmatch '\{')) {
        if (-not (Test-Path -LiteralPath $sln)) {
            Write-Warning "Solution .sln introuvable : $sln"
        }
        else {
            Write-Host "OK dotnet_solution_path -> $sln"
        }
    }
}
elseif ($runtime -ne 'dotnet') {
    Write-Host "primary_runtime=$runtime : verification .sln ignoree (adapter build_command / test_command dans module.yaml)."
}

$ctx = Join-Path $ModuleRoot 'docs\project-context.md'
if (-not (Test-Path -LiteralPath $ctx)) {
    Write-Warning "docs/project-context.md absent (creer depuis templates/project-context.template.md)"
}
else {
    Write-Host "OK project-context.md"
}

$conv = Join-Path $ModuleRoot 'docs\copilot-project-conventions.md'
if (-not (Test-Path -LiteralPath $conv)) {
    Write-Host 'Optionnel : docs/copilot-project-conventions.md absent - enrichir depuis templates/copilot-project-conventions.template.md si besoin.'
}
else {
    Write-Host "OK copilot-project-conventions.md"
}

$skillsRoot = Join-Path $ModuleRoot 'skills'
if (Test-Path -LiteralPath $skillsRoot) {
  $personaHeading = [regex]::new('(?m)^## Persona par defaut\s*$')
  Get-ChildItem -LiteralPath $skillsRoot -Directory | ForEach-Object {
    $skillMd = Join-Path $_.FullName 'SKILL.md'
    if (-not (Test-Path -LiteralPath $skillMd)) {
      Write-Warning "SKILL.md absent : $($_.Name)"
      return
    }
    $skillText = Get-Content -LiteralPath $skillMd -Raw
    if (-not $personaHeading.IsMatch($skillText)) {
      Write-Warning "Section '## Persona par defaut' absente : $($_.Name)"
    }
    else {
      if ($_.Name -eq 'acp-help') {
        if ($skillText -notmatch 'skill-persona-map') {
          Write-Warning "acp-help : mention attendue de skill-persona-map.md dans Persona par defaut"
        }
      }
      elseif ($skillText -notmatch 'personas/acp-') {
        Write-Warning "Persona primaire attendu (chemin personas/) : $($_.Name)"
      }
    }
  }
  Write-Host "OK verification sections Persona (skills)"
}

Write-Host "Termine. Voir checklists/module-yaml-validation.md pour la verification complete."
