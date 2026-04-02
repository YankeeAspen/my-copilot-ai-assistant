# Definition of Done (DOD)

Fichier par feature ou livrable : placer sous **`docs/dod/<feature_id>.md`** et referencer le chemin dans **`docs/delivery-state.md`** (`dod_path`).

## Lien session

- **feature_id** : (aligne sur `docs/delivery-state.md`)
- **delivery_state** : `docs/delivery-state.md`
- **date_gel** : (apres validation utilisateur)

## Perimetre (in)

- Ce qui **doit** etre livre pour considerer le travail acceptable.

## Hors perimetre (out)

- Ce qui est **exclu** expressement de cette iteration.

## Criteres mesurables

Chaque critere doit etre verifiable (oui/non ou metrique).

1. ...
2. ...

## Preuves attendues

- Tests : (types, commandes `module.yaml` / `test_command`, chemins)
- Documentation : (fichiers ou sections a jour)
- Revue / securite : (ex. `acp-code-review-dotnet`, `acp-security-check-dotnet` si applicable)

## Verification finale

A remplir **uniquement** en phase cloture : cocher ou reference aux commits / runs CI qui prouvent chaque critere.

| Critere | Statut | Preuve (lien, commande, PR) |
|---------|--------|----------------------------|
| ... | ok / ko / n/a | ... |

---

*Template source : `templates/dod.template.md` (pack assistant-copilot).*
