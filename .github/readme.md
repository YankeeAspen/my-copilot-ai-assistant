# Prompts Copilot — refactoring SonarQube (.NET)

Prompts pour faire traiter par GitHub Copilot (mode agent) les code smells SonarQube d'une solution .NET, sans régression : complexité cognitive, nombre de paramètres, constructeurs, code mort, etc., et taux de duplication.

## Les fichiers et leur vrai nom

Chaque fichier `.txt` de ce dossier est soit un **fichier d'instructions** à déposer à la racine du dépôt à traiter, sous le nom indiqué, soit un **prompt** à coller dans le chat Copilot.

| Fichier ici | Vrai nom / usage | Où | Rôle |
|---|---|---|---|
| `principal.txt` | **`REFACTORING_TECHLEAD.md`** | Racine du dépôt à traiter | Instructions complètes de la mission de refactoring : règles non négociables, catalogue des problèmes, méthode, rapport. Contient les scripts `Find-TooManyParameters.ps1` (annexe A, S107) et `Invoke-SonarRules.ps1` (annexe B, S3776/S107). |
| `duplication.txt` | **`DUPLICATION_TECHLEAD.md`** | Racine du dépôt à traiter | Instructions de la mission « baisse du taux de duplication ». S'appuie sur `REFACTORING_TECHLEAD.md`, qui doit être présent lui aussi. Contient les scripts `Find-Duplications.ps1` (annexe C) et `Get-SonarDuplications.ps1` (annexe D). |
| `lancement.txt` | Prompt de lancement — refactoring | Chat Copilot | Démarre une mission de refactoring complète à partir de `REFACTORING_TECHLEAD.md`. |
| `lancement-duplication.txt` | Prompt de lancement — duplication | Chat Copilot | Démarre la mission duplication à partir de `DUPLICATION_TECHLEAD.md` et `REFACTORING_TECHLEAD.md`. |
| `reprise (1).txt` | Prompt de reprise — analyse Sonar S3776/S107 | Chat Copilot | Reprend un travail de refactoring commencé avec une ancienne version des instructions : sauvegarde du travail en cours, audit des contournements, puis traitement de toutes les S3776 et S107 mesurées par l'analyseur. |
| `reprise (2).txt` | Prompt de reprise — session interrompue | Chat Copilot | Reprend la mission sur la branche `refactor/sonar-cleanup` après une session arrêtée. Coller la « Dette restante » du rapport précédent à l'endroit prévu. |
| — | **`SonarAnalyzer.CSharp.dll`** | Racine du dépôt à traiter (recommandé) | Analyseur Sonar officiel utilisé par `Invoke-SonarRules.ps1`. S'il est absent, le script télécharge la dernière version depuis nuget.org. Sans accès Internet, il est obligatoire. |

Ne déposez **que** les fichiers d'instructions (`*_TECHLEAD.md`) et la DLL dans le dépôt. Les prompts de lancement et de reprise se collent dans le chat.

## Utilisation

### Mission de refactoring

1. Copier `principal.txt` à la racine du dépôt sous le nom `REFACTORING_TECHLEAD.md`. Ajouter `SonarAnalyzer.CSharp.dll` à la racine si possible.
2. Ouvrir le dépôt dans VS Code, Copilot Chat en **mode agent**.
3. Coller le contenu de `lancement.txt` après avoir choisi **une** option de la section « Périmètre de cette session ».
4. Copilot crée la branche `refactor/sonar-cleanup`, extrait ses outils dans `.refactoring/`, travaille par lots et termine par un rapport.
5. Session interrompue ou trop longue : relancer avec `reprise (2).txt`, en y collant la dette restante du dernier rapport.

### Mission duplication

1. Déposer **les deux** fichiers d'instructions à la racine : `REFACTORING_TECHLEAD.md` (depuis `principal.txt`) et `DUPLICATION_TECHLEAD.md` (depuis `duplication.txt`), plus `SonarAnalyzer.CSharp.dll`.
2. Si le serveur SonarQube est joignable depuis le poste, positionner le jeton dans le terminal **avant** de lancer Copilot (il n'est jamais écrit dans un prompt ni dans un fichier) :
   ```powershell
   $env:SONAR_TOKEN = "<jeton>"
   ```
3. Coller `lancement-duplication.txt` après avoir rempli ou supprimé les sections « Serveur SonarQube », « Objectif » (3 % par défaut) et « Périmètre ».
4. Copilot travaille sur la branche `refactor/sonar-duplication`. Le chiffre officiel du serveur ne bouge qu'après l'analyse de la branche par la CI : le rapport donne la projection locale.

## Ce qui est créé dans le dépôt traité

| Élément | Contenu | Commité ? |
|---|---|---|
| `.refactoring/` | Scripts extraits des annexes, CSV de mesures (`s107-*.csv`, `sonar-*.csv`, `dup-*.csv`), journaux d'analyse | Non (exclu via `.git/info/exclude`) |
| `REFACTORING_TECHLEAD.md`, `DUPLICATION_TECHLEAD.md`, `SonarAnalyzer.CSharp.dll` | Instructions et analyseur | Non (exclus localement) |
| Branche `refactor/sonar-cleanup` ou `refactor/sonar-duplication` | Un commit par refactoring, au format Conventional Commits | Oui, en local. Ni push ni pull request |

Le `.gitignore` partagé n'est jamais modifié : les exclusions sont ajoutées dans `.git/info/exclude`, propre au poste.

## Maintenir ces prompts

- Les scripts PowerShell vivent **dans** les fichiers d'instructions, dans des blocs ` ```powershell Nom.ps1 `. La commande d'extraction de chaque mission les retrouve par ce marqueur : ne changez ni le format de la première ligne du bloc, ni les noms de fichiers.
- Les scripts doivent rester en **ASCII pur** et compatibles Windows PowerShell 5.1 et PowerShell 7.
- `duplication.txt` renvoie à des numéros de section de `principal.txt` (3, 3.5.1, 4, 6.1, 6.3, 7.1, 7.2, 7.4, 7.5, 7.6, 8, 9, 10, 11). Si vous renumérotez `principal.txt`, mettez ces renvois à jour.
- Les prompts de reprise citent eux aussi des sections de `principal.txt` : même précaution.
