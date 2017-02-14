# Highway to jail - part. 2

- Auteurs : toffan et Vahlkar
- Type : Stéganographie

## Challenge
### Nom de production
Highway to jail - part. 2

### Description
cf. Highway to jail part. 1

### Fichiers fournis
Aucun, les fichiers exportés sont à ajouter au challenge *Highway to jail - part.
1*.

### Changement de flag

Automatique à chaque nouvel export (`make export`).

### Usage

```bash
# PROD
make export     # créer les exports
make clean      # supprime les exports et les images docker
```

### Situation

| Relecture | Construction | Test | Déploiement |
| --- | --- | --- | --- |
| toffan(4bb1308) | toffan(4bb1308) | toffan | |
| Vahlkar (8abc614) | Vahlkar | Vahlkar (8abc614) | |
| | | | |

### Tests
- **Vahlkar (version 8abc614):**
    Works well except that the binary `hide` is **not executable outside of the
    container** if you do not have the same version of sfml.  `make -C
    solution2/` for testing.
