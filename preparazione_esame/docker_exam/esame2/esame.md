# Link
https://github.com/fondazioneedulife/zorintest/blob/main/esame.md

# Contesto
Viene fornito un semplice applicativo node js ad uso interno
espone un servizio sulla specificata dall'utente nella variabile ```NODE_ENV_PORT```

Quando è in esecuzione espone qualcosa come questo
![Alt text](image.png)

# CONSEGNA
Realizzare uno script ```build.sh``` che posizioni la cartella ```src``` nella cartella del dockerfile ```containers/docker_hello```

[50 pnt ]Realizzare un Dockerfile:
- prende come argomento la porta di esposizione del container
- esegue il sorgente node con entrypoint ```node main.js```
- utilizza l'ultima immagine lts alpine di node disponibile

[50 pnt] Realizza il docker compose:
- esegue l'immagine precedentemente buildata
- passa come variabile d'ambiente NODE_ENV_PORT valorizzata con la porta su cui si vuole esporre il servizio

Scrivere in una nota i comandi per eseguire la build e l'esecuzione del compose