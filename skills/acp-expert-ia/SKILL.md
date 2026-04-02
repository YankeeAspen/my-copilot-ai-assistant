# Skill: acp-expert-ia

**Contraintes globales :** appliquer `templates/skill-global-constraints.md` avant ce workflow.

## Persona par defaut
- **Primaire :** `personas/acp-architect-dotnet.md`
- **Secondaire (optionnel) :** `personas/acp-pm-dotnet.md`

## But

Cadrer une problematique IA (produit, technique, risques, couts) avec des options comparables et une recommandation MVP, en respectant le **stack declare** (`primary_runtime`, `docs/project-context.md`) et l'usage **GitHub Copilot**.

## Entrees

- Objectif metier ou technique
- Utilisateur(s) cible(s)
- Contraintes (budget, delai, conformite, donnees sensibles)
- Risques deja identifies

## Sortie obligatoire (structure fixe)

Produire la reponse dans cet ordre, en francais sauf termes techniques usuels:

1. **Contexte synthetique** — faits observes vs hypotheses.
2. **Options (A / B / C)** — pour chaque option: avantages, risques, cout/latence/maintenance approximatifs.
3. **Recommandation motivee** — option MVP par defaut avec criteres de decision.
4. **Plan d'execution incremental** — etapes mesurables avec jalons.
5. **Verifications et metriques de succes** — qualite (precision, robustesse), cout (tokens, infra), risque (donnees, conformite), operabilite (monitoring, fallback, versioning prompts/modeles).

## Axes d'analyse obligatoires

- Valeur: KPI metier cible.
- Qualite: precision, robustesse, hallucinations / erreurs.
- Cout: tokens, latence, infrastructure, maintenance.
- Risque: donnees sensibles, conformite, securite.
- Operabilite: monitoring, fallback, versioning prompts/modeles.

## Regles

- Separer explicitement hypotheses, faits observes et recommandations.
- Privilegier le plus simple qui marche avant d'ajouter de la complexite.
- Rester compatible avec les personas et skills `acp-*` du projet (ne pas remplacer l'orchestrateur `acp-orchestrator-idea` pour le pipeline de livraison logicielle).
- Ne pas inventer de contraintes projet: si `docs/project-context.md` existe, s'y referer.

## Anti-patterns

- Solution complexe sans baseline simple.
- Recommandation sans metriques de validation.
- Ignorer cout ou conformite.

## Quand l'utiliser

- Avant une phase lourde (RAG, agents, fine-tuning, choix de modele).
- En complement de `acp-orchestrator-idea` si la question porte sur la **strategie IA** plutot que sur la **chaine de delivery** .NET.

Pour **uniquement** choisir un skill / persona du pack et rediger le **prompt final** Copilot (sans analyse strategique IA, sans code) : utiliser `acp-compose-prompt-dotnet`.
