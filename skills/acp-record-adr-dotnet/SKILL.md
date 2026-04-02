# Skill: acp-record-adr-dotnet

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`

## But
Enregistrer une decision d'architecture structuree (ADR) ; **independant du runtime** (le suffixe `-dotnet` est historique du pack de reference).

## Entrees
- decision a prendre ou deja prise (stack, auth, messaging, schema majeur, etc.)
- `docs/architecture/` ou chemin `architecture_artifacts` du `module.yaml`

## Workflow
1. Verifier si un ADR existant couvre deja le sujet (mise a jour ou remplacement).
2. Choisir un numero sequentiel `ADR-NNN` (dossier `adr` recommande : `docs/architecture/adr/`).
3. Remplir `templates/adr.template.md` : contexte, decision, consequences, statut.
4. Lier depuis `docs/architecture/architecture.md` (index des ADR ou liste en fin de document).

## Livrables
- `docs/architecture/adr/ADR-NNN-<slug>.md` (adapter le chemin si `architecture_artifacts` differe)

## Definition de "done"
- Statut explicite et consequences lisibles par un nouveau developpeur
