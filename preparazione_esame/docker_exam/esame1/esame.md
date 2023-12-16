# Contesto
Mkdocs è una libreria python per la generazione di documentazione, il team di sviluppo ha completato la stesura della documentazione per il progetto e ha fornito un repository con i sorgenti.

Si vuole andare in produzione in pochi giorni e per compliance ISO è richiesta la disponibilità della documentazione.

Compito dei componenti Ops del team è predisporre immagine versionata e immutabile della documentazione in un dato momento.

# Utilizzare il repository dei sorgenti fornito e predisporre le seguenti attività

* [40 pt] container nginx con il sito compilato ed esposto
  * occorre prestare attenzione alla  dimensione dell'immagine
  * i sorgenti vanno presi dal tag 1.0.0 del repository
* [50 pt] docker stack con:
  * una replica
  * i limits delle risorse impostate a min 50 MB e max 100MB
  * limits nella dimensione dei log
* [10 pt] Aggiungere al repository un devcontainer per l'esecuzione locale, riutilizzando il dockerfile già predisposto al punto 1. Taggare i sorgenti con il tag 2.0.0
