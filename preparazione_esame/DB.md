# JSON
Formato ideale per lo scambio di dati perché è un formato di testo indipendente dal linguaggio di programmazione


## Basato su 2 strutture:
- Insieme di coppie/valore (oggetti)
- Elenco ordinato di valori (array o vettori)


Queste sono strutture di dati universali. Infatti, virtualmente tutti i linguaggi di programmazione moderni li 
supportano in entrambe le forme.


```json
{
    "id": 007,
    "nome": "Luca",
    "cognome": "Rossi",
    "eta": 21,
    "sposato": false,
    "email": ["ciao@gmail.com", "ciaone@gmail.com"],
    "indirizzo": {
        "via": "via roma 8",
        "citta": "badia",
        "provincia": "Verona"
    },
    "recapito": [
        {
            "numero": "3456789843",
            "prefisso": "+39"
        },
        {
            "prefisso": "+40",
            "numero": "1234567890"
        }
    ]
}
```


## NOSQL
- DataBase non relazionale
- Trasmissione dati più veloce (DB relazionali più solidi)
- Non hanno relazioni tra tabelle, ogni elemento è autonomo (chiave/valore)
- Più scalabile
- Senza schema -> devo stare attento a cosa modifico, posso perdere dati
- Recupero dati solo tramite PK


## MONGODB
DataBase NoSQL (DB strutturato in Collections(insieme di documenti) e Documents(oggetto JSON))


ObjectID, univoco per ogni collection, composto da 12 byte:
- 4 sono il numero di secondi dall’inizio dell’epoca Unix
- 3 sono identificatori della macchina
- 2 rappresentano l’ID del processo
- 3 sono contatori che partono da un numero casuale

## ALCUNI COMANDI

### Vedo i DB creati
#### show dbs

### Creo DB
#### use NomeDB (mi mostrerà il DB solo se inserisco dati)

### Creo Collection
#### db.NomeCollection.insertOne({"nome":"Luca", "cognome":"Lupatini"})

### Inserimento più oggetti
#### db.NomeCollection.insertMany([{Array di oggetti}, {Array di oggetti}])

### Trovo elementi presenti nella collection
#### db.NomeCollection.find()

### Filtro sull output (se ne ho 2 che corrispondono prende il primo)
#### db.NomeCollection.findOne({nome: "Luca"})

### Update di un dato
#### db.NomeCollection.updateOne({nome:"Luca"}, {$set: {eta: 29}})

### UpdateMany (che hanno un dato in comune)
#### db.NomeCollection.updateMany({nome:"Luca"}, {$set: {cap: "34567"}})

### Eliminare dati
#### db.NomeCollection.deleteOne({nome: "Massimo"})




## BSON
Versione codificate in binario dei file JSON
Occupa meno spazio di archiviazione rispetto al JSON ed è più veloce
Il JSON supporta solamente i dati supportati da JavaScript, il BSON no
In alcuni casi è meno efficiente a causa di lunghezze fisse e array


## OPERATORI
Simboli speciali che aiutano i compilatori a eseguire operazioni matematiche e logiche. 

- $and -> tutte le condizioni delle espressioni sono soddisfatte
- $or -> almeno una della due espressioni è vera


## COMANDO FIND

Find -> restituisce un set di dati in base ai criteri da noi espressi. 
Il find restituisce un oggetto chiamato cursore (puntatore)


## PROJECTION

A volte non è sempre necessario estrarre tutto il documento. 
Tramite la clausola Projection possiamo infatti selezionare solo i campi del documento che ci interessano.

db.nomeCollection.find({filtro}, {campo_da_estrarre:1, campo_da_omettere:0})