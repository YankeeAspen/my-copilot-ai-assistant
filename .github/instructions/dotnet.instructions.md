---
applyTo: "**/*.cs,**/*.csproj"
---

Lors de modifications C# ou de fichiers projet, respecter les standards du pack :

- Lire `#file:../../templates/dotnet-sqlserver-standards.md` (nullable, async/`CancellationToken`, logging structure, ProblemDetails, EF Core, SQL Server).
- Appliquer `#file:../../templates/skill-global-constraints.md` (langues depuis `module.yaml`, pas de secrets).
- Gates locales : commandes definies dans `#file:../../module.yaml` (`format_command`, `build_command`, `test_command`).
