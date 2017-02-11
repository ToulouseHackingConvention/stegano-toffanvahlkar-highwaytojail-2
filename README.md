# All night long - part. 2

- Auteurs : toffan et Vahlkar
- Type : Stéganographie

## Challenge
### Nom de production
All night long - part. 2

### Description
TODO

### Fichiers fournis
Aucun, les fichiers exportés sont à ajouter au challenge All night long - part.
1.

### Changement de flag

Modifier `flag.txt` puis `make export`

### Usage

```bash
# PROD
make export     # créer les exports
make clean      # supprime les exports et les images docker
```

### Situation

| Relecture | Construction | Test | Déploiement |
| --- | --- | --- | --- |
| toffan | toffan | toffan | |
| Vahlkar (8abc614) | Vahlkar | Vahlkar (8abc614) | |
| | | | |

### Tests
- **Vahlkar (version 8abc614):**
    Works well except that the binary `hide` is **not executable outside of the
    container** if you do not have the same version of sfml.  `make -C
    solution2/` for testing.
