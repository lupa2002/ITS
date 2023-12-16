# Esercizi
```
vagrant up --provider parallels --no-parallel
```

## Esercizio 1
1. collegarsi via ssh tramite vscode (edit di .ssh/config)
2. configurare il demone docker per l'uso del socket tcp (https://docs.docker.com/config/daemon/remote-access/)
```
{
  "hosts": ["unix:///var/run/docker.sock", "tcp://127.0.0.1:2375"]
}
```
3. trovare l'errore nei log
4. risoluzione errore systemd
5. configurare il client docker del proprio pc per collegarsi al contesto remoto

```
docker --tlsverify --tlscacert=folderTmp/clientTLS/ca.pem --tlscert=folderTmp/clientTLS/cert.pem --tlskey=folderTmp/clientTLS/key.pem -H=node1:2376
```
6. cosa succede se provo a contattare l'host con un nome diverso da quello contenuto nel certificato?

```
docker --tlsverify --tlscacert=folderTmp/clientTLS/ca.pem --tlscert=folderTmp/clientTLS/cert.pem --tlskey=folderTmp/clientTLS/key.pem -H=pippo:2376
```

7. contattiamo l'host con una curl

```
curl --cacert ca.pem --key key.pem --cert cert.pem https://node1:2376/v1.43/images/json
```