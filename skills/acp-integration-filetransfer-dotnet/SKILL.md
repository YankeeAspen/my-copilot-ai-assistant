# Skill: acp-integration-filetransfer-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-dev-dotnet.md`

## But
Implementer des echanges de fichiers depuis .NET vers des serveurs **FTP / FTPS / SFTP** avec securite, idempotence et reprise.

## Entrees
- protocole impose (preferer **SFTP** ou **FTPS** plutot que FTP en clair)
- volumes, fenetres de depot, conventions de nommage
- `docs/project-context.md`

## Workflow
1. Interdire FTP non chiffre sauf exception documentee en ADR et acceptation des risques.
2. Authentification : cles SSH ou mots de passe via secret manager ; jamais en code ou appsettings commites.
3. Idempotence : detecter transferts deja effectues (hash, nom + taille + date) selon regles metier.
4. Reprise : gerer timeouts, reconnexion bornee, fichiers partiels (rename atomique cible si possible).
5. Journalisation : tracer succes/echec sans credentials ni chemins internes sensibles.
6. Tests : integration contre serveur de test ou conteneur ; cas erreur reseau simule si possible.
7. Runbook : procedure en cas d'echec de depot, contact equipe support fichiers.

## Livrables
- Code client + configuration (hors secrets) + note dans `implementation_artifacts` ou runbook

## Definition de "done"
- Pas de mot de passe / cle privee en repo ; comportement erreurs documente
