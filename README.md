# All night long - part. 2

- Auteurs : toffan et Vahlkar
- Type : Stéganographie

## Description

### Fichiers fournis

Aucun, les fichiers exportés seront à ajouter manuellement au challenge All
night long - part. 1.

## Utilisation

```bash
make build # construire l'image
make export # obtenir les fichiers fournis
```

### Modifier le flag

Modifier `flag.txt` puis `make build && make export`

### Nettoyer

`make clean` supprime les fichiers fournis
`make clean-all` supprime l'image

## État

En cours de construction

### Relecture
- vahlkar (version 8abc614)

### Test
- vahlkar (version 8abc614):
    Works well except that the binary `hide` is **not executable outside of the container** if you do not have the same version of sfml.
    make -C solution2/ for testing;

### Déploiement

### Relecture Déploiement

### Test Déploiement

### Docker-compose

