# Observabilite — post-release

Utiliser apres deploiement (voir skill `acp-observability-dotnet`).

## Logs

- [ ] Format structure (JSON ou equivalent) en production
- [ ] Correlation id / trace id present sur requetes HTTP principales
- [ ] Niveaux de log coherents (pas de PII/secrets dans les messages)

## Metriques

- [ ] Latence p95/p99 ou equivalent sur endpoints critiques
- [ ] Taux d'erreur HTTP (4xx/5xx) sous seuil defini dans le contexte projet
- [ ] Indicateurs SQL (duree requetes, connexions) surveilles si hot path DB

## Tracing (si active)

- [ ] Spans minimaux : entree API → acces donnees
- [ ] Echantillonnage configure pour la charge

## Fenetre post-deploiement

- [ ] Duree d'observation definie (ex. 30–60 min) et tenue
- [ ] Comparaison avec baseline documentee
- [ ] Decision documentee : stable / surveillance renforcee / rollback (voir `acp-rollback-dotnet`)
