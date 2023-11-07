# LINUX

## INTERRUPTS

Segnale asincrono di sistema, da un componente hardware, che esprime la "necessità di attenzione" verso la CPU.

Un interrupt hardware obbliga il processore a commutare il suo stato per eseguire l'operazione indicata dall'interrupt stesso.

Svolto il compito, il processore tornerà a lavorare sull'attività precedentemente in corso.

Se questi interrupt sono molto frequenti possono mandare in stallo la CPU.

 

## DIRECT MEMORY ACCESS

Funzionalità che consente l'invio diretto dei dati da un dispositivo collegato, alla memoria principale della scheda madre del computer, senza passare dalla CPU.

/PROC - > FS creato e mantenuto a run- time dal Kernel per tenere traccia dello stato dei vari processi.

/PROC/SYS - > questa directory viene utilizzata per controllare e modificare alcuni di questi parametri.

/PROC/CPUINFO - > contiene informazioni sul processore (tipologia, marca, modello).

/PROC/DEVICES - > elenca i driver presenti nel Kernel corrente.

/PROC/DMA - > mostra quali canali DMA sono in uso al momento.
  
/PROC/FILESYSTEMS - > mostra i FS supportati dal Kernel.

/PROC/INTERRUPTS - > visualizza quali e quanti interrupts sono in uso.

La prima colonna si riferisce al numero di interruption request, nella seconda specifica la tipologia di interruzione, mentre nell'ultima troviamo il nome del dispositivo che si trova su quell'IRQ.

/PROC/IOPORTS - > mostra le porte I/O in uso.

Restituisce un elenco delle porte attualmente registrate, utilizzate per la comunicazione di input o output con un dispositivo.

La prima colonna fornisce l'intervallo degli indirizzi di memoria (che vengono assegnati durante la fase di boot) delle porte I/O riservato per il dispositivo elencato nella seconda colonna.

Questo comando necessita dei permessi di amministratore, altrimenti mi restituisce in output tutti gli indirizzi di memoria pari a 0. 

/PROC/IOMEM - > mostra una mappa della memoria di sistema per ciascun dispositivo fisico.

/PROC/MEMINFO - > riporta informazioni sull'utilizzo della RAM.

La maggior parte delle informazioni contenute qui dentro vengono utilizzate dai comandi FREE, TOP e PS.

In questo file troviamo:
- Quantità di RAM utilizzabile (in KiB)
- Quantità di RAM inutilizzata
- Buffers: RAM utilizzata come memoria temporanea
- Cached: RAM utilizzata come memoria cache
- Memoria SWAP disponibile


## HOT PLUG 

Aggiunta di un componente ad un sistema informatico in esecuzione, senza interruzioni significative del funzionamento del sistema.

Ciò è particolarmente utile per i sistemi che devono rimanere sempre in funzione, come i Server.

Esempi di Hot Plug possono essere sistemi di archiviazione come HDD e SSD, oppure dispositivi USB.

## COLD PLUG 

Situazione in cui un computer deve essere spento per aggiungere/rimuovere un componente.

Il collegamento a freddo viene spesso utilizzato per precauzione aggiuntiva, garantendo così che un componente non venga danneggiato.

Un dispositivo Cold Plug, sostituito a caldo, può causare malfunzionamenti al sistema.

Esempi di Cold Plug potrebbero essere la RAM, la CPU e la Scheda Video. 

## CPU 

Control Processing Unit: è il componente principale di un computer e funge da "centro di controllo".
La CPU:
- È un insieme complesso di circuiti elettronici che gestiscono OS e software
- Interpreta, elabora ed esegue istruzioni
- Esegue operazioni aritmetiche e logiche per trasformare i dati immessi in informazioni utilizzabili

## LSCPU 

Restituisce informazioni sull'architettura della CPU (da sysfs e /proc/cpuinfo).

Le informazioni restituite includono
- ID del venditore
- Famiglia della CPU
- Modello
- Velocità in MHz
- Dimensione della cache
- Numero di Core
- Flags supportati
- Informazioni sui socket
Negli ambienti virtualizzati, le informazioni sull'architettura della CPU riguardano la configurazione operativa del guest, non dell'host.

## PCI  

Peripheral Component Interconnect: è un'interfaccia per aggiungere ulteriori componenti HW ad un sistema informatico.

## LSPCI 

Questo comando visualizza informazioni su ciascun bus PCI nel sistema, come per esempio:
-Slot
-Classe
-ID produttore
-ID dispositivo

## USB  
 
Universal Serial Bus: interfaccia comune che consente la comunicazione tra dispositivi e un controller host (PC, Smartphone).

Serve per collegare dispositivi periferici come fotocamere digitali, mouse, tastiere, stampanti, scanner, HDD  e unità Flash.

Un'unità USB ha lo scopo di rendere possibile il Plug&Play e di consentire lo scambio a caldo. 

## LSUSB 

Comando per visualizzare un elenco di dispositivi USB collegati al sistema.

Lsusb –v oppure lsusb –t restituisce in output alcune informazioni aggiuntive sulle periferiche.

## KERNEL 

Il compito principale del Kernel è quello di gestire le risorse del sistema, facendo da ponte tra l'HW e il SW del computer.

Un modulo del Kernel, detto anche driver, è un pezzo di codice che estende le funzionalità del Kernel che può essere caricato senza la necessità di riavvio del sistema.

Questi moduli vengono caricati su richiesta di "udev" (gestione dispositivi) e sono memorizzati in /lib/modules/<kernel_version> (per conoscere la versione del Kernel basta digitare il comando uname –r).

## LSMOD   

Viene utilizzato per visualizzare lo stato dei moduli nel Kernel Linux.

Questo comando esegue una rapida lettura del contenuto del file /proc/modules, per poi restituire informazioni come:
- Modulo 
- Dimensioni del modulo 
- Istanze attive 
- Numero di volte dove il modulo viene richiamato 

## MODINFO

- Estrae le informazioni dai moduli del Kernel Linux inseriti da linea di comando
- Elenca ogni attributo del modulo (chiave:valore) per una facile lettura
- Per attivare un modulo - > modprobe modulo
- Per disattivare un modulo - > rmmod modulo
 
## DISATTIVAZIONE DI UN MODULO 

In presenza di malfunzionamenti possiamo ricorrere a scollagare un driver, disabilitando così le periferiche dipendenti da esso per interagire con la CPU.

Ad ogni riavvio, però, i driver vengono ricaricato, quindi se si vuole evitare che questi tornino operativi vanno blacklistati.

  
## COSA SUCCEDE QUANDO INSERIAMO UNA PERIFERICA? 

Quando inseriamo una nuova periferica, per essere raggiungibile dalla CPU, devono essere caricati dei driver.

All'inserimento della periferica le viene assegnato un range di indirizzi di memoria virtuale.

La procedura che avviene in background all'inserimento di una periferica è:
- Inserimento della periferica
- Interruption
- Caricamento dei driver (un daemon crea in /dev un nuovo file rappresentante la nuova periferica)

## COMANDO WATCH 

Permette di lanciare il successivo comando ogni N secondi.

Esempio: Watch –n 0.1 cat /proc/interrupts


# BIOS vs UEFI 

Il Basic Input Output System (BIOS) e l'Unified Extensible Firmware Interface (UEFI), sono programmi utilizzati dal microprocessore di un computer per avviare il sistema informatico dopo l'accensione.

Entrambi gestiscono il flusso di dati tra il Sistema Operativo del pc e i dispositivi collegati.

## BIOS 

Il BIOS inizializza le periferiche e cerca un eseguibile nell'MBR (più precisamente nella prima partizione della memoria, equivalente ai primi 512 B).

## UEFI 
L'UEFI è considerato come un Sistema Operativo a parte, che restituisce a video non solo i dispositivi fisici da cui poter eseguire la fase di boot, ma anche ogni eseguibile .efi installato.

L'UEFI risulta molto più flessibile, perché non si limita nel ricercare solamente nei primi 512 B il boot loader, bensì ha la flessibilità di ricercare ogni eseguibile col flag di default (potrebbe essere un OS, come un eseguibile) all'interno di tutta l'area di memoria dedicata.


# COME AVVIENE LA FASE DI AVVIO DI UN PC 

- Fase di boot
- Caricamento boot- loader GRUB (programma che carica tutto ciò che serve per avviare il OS)
- Viene caricato l'Initial RunDisk (disco che contiene driver indispensabili per montare la partizione dell'OS e altri driver minimali, come per esempio quello per la tastiera, il mouse e altri driver grafici)
- Viene avviato il Kernel (cuore del Sistema Operativo che mette in comunicazione il software con l'hardware, in modo che gli applicativi non debbano dipendere dalle specifiche hardware
- Viene avviato l'Init System (un meta- programma che serve a lanciare tutti i servizi che rendono operativo il nostro pc (networking, SSH e altri servizi in background durante la fase di avvio)
- Viene caricato il Display Manager/schermata di login
- Accesso al desktop


## IN SINTESI 

- NVRAM - > fase di GRUB - > KERNEL - > INIT
- NVRAM - > fase di GRUB - > KERNEL - > SHELL (dove vengono eseguiti script col massimo dei privilegi) - > SHELL di ROOT - > init=/bin/sh
In /etc/default/grub vedo le impostazioni del GRUB, come il TIMEOUT e lo STILE


## INFORMAZIONI RIGUARDO IL SISTEMA 

- /sbin/init - > restituisce il sistema di init che stiamo utilizzando
- Ls –l /etc/systemd/system/display - > restituisce il display manager che stiamo utilizzando
- Cat /etc/password oppure cat /etc/shadow - > visualizzare l'elenco delle password
- Echo $DESKTOP_SESSION - > conoscere il desktop environment in uso
- Screenfetch - > restituisce informazioni generali sul sistema
- Neofetch - > restituisce informazioni generali sul sistema

## SYSTEMCTL   

È un tool con cui controlliamo e gestiamo servizi systemd.

È costituito da un set di daemon, librerie e strumenti che consentono l'amministrazione e la configurazione del sistema e interagiscono con il Kernel del sistema GNU/Linux.

- Systemctl get- default - > restituisce il run- level attualmente in uso
- Systemctl set- default - > permette di modificare il run- level di avvio

## NVRAM 

Not Volatile Random Access Memory: chip fisso con pochi KB di memoria che contiene le preferenze di boot.


# SYSTEMD e SYSTEMV 

SystemD e SystemV sono due modalità di gestire l'avvio e la gestione dei servizi e dei processi in un sistema in un sistema Linux.

Entrambi controllano il comportamento del sistema sia durante l'avvio che in diverse situazioni e differiscono nell'architettura e implementazione.

SystemD è il successore di SystemV e fornisce un avvio molto più rapido e una migliore gestione delle dipendenze.

SystemD gestisce i processi di avvio tramite file.service, mentre SystemV gestisce processi tramite script di shell in /etc/init*.

Possiamo controllare la struttura di un servizio avviato da SystemD col comando: cat /lib/systemd/system/nome_servizio.

All'interno di questo documento possiamo trovare diverse informazioni riguardo la modalità di avvio del servizio, comprese le sue dipendenze e dopo quali servizi deve essere avviato.


## SYSTEMV 

Offre 7 run- level (ognuno definisce uno stato di sistema e determina quali servizi/processi vengono fatti partire durante l'avvio):
- Run- level 0 - > shutdown
- Run- level 1 - > modalità single- user
- Run- level 2 - > modalità multi- user
- Run- level 3 - > default mode
- Run- level 4 - > non utilizzato, per scopi futuri
- Run- level 5 - > graphic session, multi- user session, funzionalità di networking attive
- Run- level 6 - > reboot

Con l'introduzione di SystemD, il concetto di run- level è stato sostituito dai target, che rappresentano diversi stati del sistema, specificando quali servizi devono essere attivati:
 
- Target 1 - > powerOff.target
- Target 2- 3- 4 - > rescue.target
- Target 5 - > graphical.target
- Target 6 - > reboot.target

Nella cartella /etc/ troviamo delle cartella con nome "rc*.d", contenenti gli script da terminare quando si avvia un determinato run- level.



# PARTIZIONAMENTO DEL DISCO

Sudo parted –l oppure sudo fdisk mostrano il partizionamento del disco.

## MEMORIA SWAP 

Lo scopo della memoria SWAP è quello di entrare in gioco in caso la memoria RAM sia in fase di saturazione.  

In questo caso avviene uno swap di memoria, per far sì che l'utente si accorga che la memoria è ormai al culmine, notando dei rallentamenti dei comandi.  

La soglia dello swap di memoria può essere regolata dal file in /proc/sys/vm/swappiness (se inserisco 30 come valore, al 70% avrò lo swap di memoria), anche se le modifiche rimangono solamente per la sessione corrente.  

Posso rendere definitive le modifiche a quest'opzione dal file /etc/sysctl.conf.  

Può essere utile anche quando riscontriamo dei memory leak, dove la RAM, una volta svolto un determinato compito, non dealloca lo spazio di memoria che era stato assegnato ad un processo, quindi si riempie molto prima.  

## COMANDI PER PARTIZIONARE UN DISCO 

Sudo parted /dev/sda - > creo una partizione con il FS

Specifico inizio e fine della partizione (in MB o in %)

Mkpart

Mkfs –t ext4 dev/sdb1 - > partizione del FS, montata di default in /mnt/ 
(se monto il file system in una cartella con dei documenti, questi verranno mascherati, finché la partizione non sarà smontata)

Sudo mount /dev/sdb1 /mnt/

Mkswap /dev/sdb2 - > creo una partizione di Swap

Sudo swapon /dev/sdb2 - > montaggio della partizione di swap

Swapon (vedo le aree di swap disponibili)


# LOGICAL VOLUME MANAGER

LVM è un sistema che permette un metodo alternativo di gestire la memoria di archiviazione rispetto al solito metodo di partizionamento, che permette di trattare molti dischi come fossero un solo disco.

Nel caso non si utilizzasse un sistema LVM, una volta terminata la memoria, questa va sostituita.

Nel caso contrario, possiamo avere più volumi fisici inseriti, per estendere i Logical Volume (/dev/sda, /dev/sdb).

## VOLUME GROUP 

Sono i corrispondenti dei dischi fisici o alle parti di essi che si desidera includere nel pool di storage. 

## LOGICAL VOLUME 

Un logical volume è il corrispettivo delle partizioni nei sistemi di partizionamento tradizionali.

Tuttavia, i Logical Volumes sono molto più flessibili, in quanto è possibile regolare dinamicamente le dimensioni senza dover riformattare o spostare dati.

I Logical Volumes vengono montati nel percorso /dev/nomeVG/nomePartizione, dove "nomeVG" rappresenta il nome del Volume Group e "nomePartizione" è il nome del Logical Volume specifico.

## PHYSICAL VOLUME 

Rappresenta un disco fisico o una partizione, utilizzati come "materia prima" per creare Logical Volumes.Questi PV costituiscono la base di LVM e possono essere parti di dischi o partizioni specifiche. 

L'utilizzo di PV consente la gestione dinamica dello spazio di archiviazione, consentendo l'espansione e la modifica dei LV senza dover riformattare o spostare dati.

## RESIZE2FS 

Comando con il quale possono essere modificate le dimensioni dei logical volume.

Nel caso volessi aumentare le dimensioni devo prima aumentare lo spazio di archiviazione e poi aumentare le dimensioni del FS.

Al contrario, se volessi diminuire le dimensioni di memoria, diminuisco prima il FS e poi lo spazio di archiviazione.

## COMANDI 

Pvscan - > mostra i physical volume

Vgscan - > mostra i volume group

Lvscan - > mostra i logical volume


 
# LIBRERIE 
 
Le librerie sono degli insiemi di codice precompilato che possono essere riutilizzati in un programma.

Possiamo suddividere le librerie in due macro categorie:
- Statiche
- Dinamiche

## LIBRERIE STATICHE 

Queste librerie vengono collegate direttamente ad un programma durante la fase di compilazione, rendendo così il programma più robusto, poiché non richiede librerie esterne al momento dell'esecuzione.

Queste librerie possono rendere il programma molto più pesante.

## LIBRERIE DINAMICHE 

Le librerie dinamiche/condivise vengono caricate dinamicamente quando un programma viene avviato e vengono legate in memoria al momento dell'esecuzione.

Le librerie dinamiche possono essere a loro volta suddivise in:
- Librerie collegate dinamicamente - > un programma è collegato con la libreria condivisa e il Kernel le carica all'avvio del programma
- Libreria caricate dinamicamente - > il programma ha il pieno controllo e richiama le funzioni dalla libreria durante l'esecuzione

Le librerie dinamiche permettono di risparmiare spazio in memoria, ma richiedono la presenza delle librerie condivise sul sistema.

È possibile verificare l'integrità delle librerie utilizzate da un software utilizzando il comando "ldd /path/to/the/software.

 


# APT PACKAGE MANAGER

APT è responsabile del download, dell'installazione, dell'aggiornamento e della rimozione dei pacchetti e delle relative dipendenze.

## PACCHETTI 

File di archivio che contengono più file.deb, utilizzati da dpkg per installare programmi.

Nei sistemi Linux, le fonti dei pacchetti sono specificate nei file /etc/apt/source.list oppure /etc/apt/sources.list.d.

I pacchetti vengono scaricati da fonti attendibili e memorizzati in una cache locale.

## APT CACHE 

Database che contiene tutti i pacchetti scaricati durante la fase di "sudo apt update".

La cache di APT fornisce informazioni offline sui pacchetti attualmente installati nel sistema, consentendo l'accesso alle informazioni dei pacchetti senza una connessione Internet.

## COMANDI APT 

- update: Aggiorna l'elenco dei pacchetti disponibili nella cache.
- upgrade: Installa i pacchetti disponibili ed esegue l'aggiornamento.
- full- upgrade: Esegue un aggiornamento completo, incluso il rimuovere dei pacchetti non necessari.
- install: Installa pacchetti.
- remove: Rimuove pacchetti.

Il gestore dei pacchetti sottostante utilizzato da APT è DPKG.

 

# DNF PACKAGE MANAGER

DNF è il Package Manager utilizzato nei sistemi Red Hat.

Il suo strumento di installazione dei pacchetti è RPM.

Ecco alcuni comandi DNF e il loro corrispettivo in APT:
- Dnf update effettua l'aggiornamento dei pacchetti, inclusa la rimozione di quelli non più necessari (equivalente dell'apt full- upgrade.
- Dnf install aggiorna l'elenco dei pacchetti disponibili e installa il pacchetto specificato (equivalente di apt update && apt install).
È importante notare che i pacchetti RPM non si installeranno a meno che non siano soddisfatte le dipendenze necessarie.

 


# CONTAINER vs VIRTUALIZATION

## VIRTUALIZZAZIONE 

Tecnologia che mira a eseguire più istanze di sistemi operativi su un singolo server fisico.

Ogni istanza (VM), emula un sistema operativo completo, con un proprio Kernel.

Questo permette di eseguire applicazioni e carichi di lavoro diversi su VM separate all'interno di una singola infrastruttura fisica.

La virtualizzazione è spesso utilizzata per l'isolamento e la gestione dei carichi di lavoro e presenta una maggiore flessibilità nella scelta dei sistemi operativi ospiti.

## CONTAINERIZZAZIONE 

Tecnologia di virtualizzazione che consente di eseguire applicazioni e i relativi componenti software in ambienti isolati come "container".

In un ambiente containerizzato, tutti i componenti necessari, come codice software, librerie e dipendenze, vengono raggruppati in un unico contenitore, creando un'unità di esecuzione indipendente.

Questi container possono essere rapidamente distribuiti su qualsiasi infrastruttura che supporti la tecnologia dei container, come Docker o Kubernetes.

Questo approccio è noto per la sua leggerezza, scalabilità e portabilità, in quanto i container possono essere facilmente spostati tra diversi ambienti senza modifiche.

## DIFFERENZA TRA CONTAINERIZZAZIONE E VIRTUALIZZAZIONE 

- ISOLAMENTO - > ogni VM è completamente isolata con il proprio OS e kernel, mentre nella containerizzazione sono isolati l'uno dall'altro e condividono l'OS dell'host.
- DIVERSI SISTEMI OPERATIVI - > la virtualizzazione consente l'esecuzione di VM con OS diversi su un singolo server, mentre i container si basano su un unico OS host.
- SUPPORTO PER OSPITI - > la containerizzazione è limitata dall'OS host, il che significa che i container Linux non possono essere eseguiti su sistemi Windows e viceversa, mentre la virtualizzazione consente di ospitare VM con sistemi operativi diversi.
- IMPLEMENTAZIONE - > la virtualizzazione assegna un disco rigido virtuale a ciascuna VM, mentre nella containerizzazione il disco rigido locale è utilizzato per lo storage per nodo.
- BILANCIAMENTO DEL CARICO - > la virtualizzazione utilizza cluster per gestire le VM, mentre la containerizzazione utilizza orchestrazione tramite Docker e Kubernetes.




# TTY vs PTS

## TTY (Tele- Type Writer) 

Ambiente di sviluppo I/O testuale (shell di login).

Queste shell forniscono un'interfaccia di testo tramite la quale gli utenti possono accedere e interagire con il sistema.
Le TTY sono identificate nella directory /dev/tty.

Per passare da una TTY all'altra, è possibile utilizzare la cobinazione di tasti "CTRL + ALT + F1/F6".

TTY0 è la predefinita, utilizzata per il login, mentre le altre 6 sono associate alle connessioni LOCALI.

## PTS (Pseudo- Terminal Slave) 

Tipologia di terminale emulato da un altro programma, come ad esempio SSH.

I terminali PTS vengono creati dinamicamente dal Kernel di Linux e la loro lista è contenuta nella directory /dev/pts.

## TTY vs PTS 

La differenza tra le TTY e le PTS sta principalmente nella natura delle connessioni: le TTY sono associate a connessioni locali, mentre le PTS sono associate a connessioni remote.




# SHOPT

I comandi con SHOPT e la gestione di alias sono utili strumenti in bash per personalizzare il comportamento da shell:
- Which programma- > restituisce il percorso dell'eseguibile
- Whereis programma - > restituisce il percorso del manuale
- Type shopt - > restituisce il tipo di file (se è incorporato nella shell restituirà "program is a shell builtin"
- Shopt - > restituirà la lista delle opzioni attive e non in bash
- Expand aliases - > personalizzazione degli alias
- Unalias comando - > disabilitare l'alias
- Shopt –u - > disabilitare opzioni specifiche in bash (shopt –u option name)
- Shopt –s - > abilitare opzioni specifiche in bash (shopt –s option name)




# HISTORY

La history di Bash è una funzionalità utile per tenere traccia dei comandi precedenti e per richiamarli facilmente.
- echo $HISTSIZE: restituisce il numero massimo di comandi che verranno memorizzati nella history
- export HISTSIZE=10000: aumentare la dimensione massima della history a 10.000
- cat ~/.bash_history: Quando chiudi una sessione di Bash, la history dei comandi viene salvata nel file ~/.bash_history nel tuo home directory
- history - c: svuota completamente la history
- CTRL+R: cercare nella history dei comandi

 


# UNAME

Il comando uname in Linux restituisce informazioni sul sistema operativo e sulla macchina.

uname - a: restituisce una serie di informazioni dettagliate sul sistema, inclusi il kernel, il nome dell'host, la versione del sistema operativo, la data di rilascio e l'architettura della macchina.

Ad esempio, una possibile uscita del comando uname - a potrebbe essere:
Linux myhostname 5.4.0- 77- generic #86- Ubuntu SMP Thu Jun 17 02:35:03 UTC 2021 x86_64

In questa uscita:

Linux: sistema operativo

Myhostname:  nome dell'host

5.4.0- 77- generic: versione del kernel

86- Ubuntu SMP Thu Jun 17 02:35:03 UTC 2021 indica la data e l'orario di rilascio del kernel (x86_64 è l'architettura della macchina)

 


# QUOTING

L'uso delle virgolette è essenziale in Bash per definire come vengono interpretate le stringhe e le variabili. 
mkdir luca lupa != mkdir "luca lupa"
		Nel primo caso creerà 2 cartelle (luca e lupa), mentre nel secondo ne creerà una sola
echo "luca lupa aka $USER" - > luca lupa aka lupa
echo 'luca lupa aka $USER' - > luca lupa aka $USER
echo luca\ lupa\ aka\ $USER - > luca lupa aka $USER
        L'uso del carattere di escape \ prima degli spazi indica alla shell che questi spazi fanno parte del nome e non sono separatori
echo data = $(date) - > restituisce la data corrente
echo '$(date)' - > $(date)
echo "$(date)" - > restituisce la data corrente
echo 'date' - > restituisce la data corrente

 


# FILTRI

I filtri sono comandi utilizzati in Linux per manipolare e analizzare il testo o i dati nei file:

La pipe viene utilizzata per concatenare il risultato di un comando con un altro

Cut –d 'delimitatore' - f 1 - > il testo viene suddiviso da un delimitatore, ed estraggo il primo campo

seq 10 - > Questo comando genera una sequenza di numeri da 1 a 10.

echo ${USER} - > Restituisce il nome dell'utente corrente.

echo {1..100} - > generazione numeri da 1 a 100

echo {1,2,99,100} - > stampa a video i numeri 1- 2- 99- 100

Wc file.txt - > restituisce il conteggio delle parole, righe e caratteri

Split –l 1000 file.txt - > divide il file in più file da 1000 righe ognuno

Head /path/to/file - > mostra le prime righe di un file

Tail /path/to/file - > mostra le ultime righe di un file (con –f si aggiorna con l'aggiunta di nuove righe)

grep - w "Installati:" /var/log/apt/history.log | tail - n 3 | cut - d ' ' - f 4 - > cerca la stringa installati, nel file log della history di apt, mostra le ultime 3 righe e stampa solo il quarto campo

Tr - > traduzione di un set di caratteri (da lettere maiuscole a minuscole per esempio)

Nl - >aggiunge i numeri di linea a lato

Sort - > ordina le righe secondo un certo ordine (sort –rnk4 vuoldire ordina in modo decrescente basandoti sulla quarta colonna)

Uniq - > rimuove le righe duplicate da un file

Less - > visualizzatore di file, consente di scorrere e cercare contenuti tramite /search (N per passare al successivo e SHIFT + N per quello precedente).





# MANIPOLAZIONE DEL TESTO

La manipolazione del testo mediante espressioni regolari (Regex) è una tecnica potente per validare e modificare l'input testuale. 

SED (Stream Editor) è uno strumento ampiamente utilizzato per modificare il testo all'interno di file di configurazione o in flussi di dati. 

Un esempio può essere:
- vim /etc/ssh/sshd_config
- sed 's/X11Forwarding yes/#X11Forwarding no/g' sshd_config
        Stai utilizzando sed per cercare la stringa "X11Forwarding yes" e sostituirla con "#X11Forwarding no".
- sed - i.bak 's/X11Forwarding yes/#X11Forwarding no/g' sshd_config
        L'opzione - i di sed serve a modificare direttamente il file di configurazione e a salvarlo.L'opzione .bak indica che verrà creato un file di backup.
        
Per quanto riguarda le espressioni regolari:
- [A- Z] rappresenta tutti i caratteri maiuscoli dalla "A" alla "Z".
Se desideri includere anche le lettere minuscole, puoi usare [A- z].
- /colou?r/g utilizza il punto interrogativo ? per rendere l'ultima "u" opzionale, consentendo di trovare parole come "color" e "colour".
- /colo.*r/g matcha qualsiasi testo che inizia con "colo," seguito da qualsunque carattere (.*) e termina con "r".
- /[color]/g matcha qualsiasi lettera contenuta tra le parentesi quadre, quindi "c", "o", "l", "o", "r".
- /[^color]/g usa il simbolo caret ^ all'interno delle parentesi quadre per negare la corrispondenza.Quindi, matcherà qualsiasi carattere diverso da "c", "o", "l" e "r".
- /^color/g matcha la parola "color" solo se è posizionata all'inizio della riga.
- /color$/g matcha la parola "color" solo se è posizionata alla fine della riga.





# CALCOLO DELL'HASH

Il calcolo dell'hash è una procedura crittografica che trasforma i dati di un file o di un messaggio in una sequenza di caratteri alfanumerici di lunghezza fissa, nota come "hash". 

Questa sequenza di caratteri è un'impronta digitale univoca dei dati di origine e anche la più piccola modifica ai dati produrrà un hash completamente diverso.

Nel caso dell'uso del comando md5sum:
md5sum file.txt calcola l'hash MD5 per il file "file.txt".

Se il contenuto di "file.txt" viene modificato, l'hash calcolato sarà completamente diverso da quello precedente. 

 


# ZIP- UNZIP

unzip: estrarre il contenuto da archivi ZIP.

gzip e gunzip: programma di compressione di file in formato gz.

Gunzip: decomprimere file precedentemente compressi con gzip.

Xz: compressione e decompressione di file con estensione ".xz".

tar: Il comando tar viene utilizzato per creare, elencare e estrarre archivi di file.


cpio: Il formato di archiviazione "cpio" è uno standard nel sistema operativo Linux.

È utilizzato per concatenare dati binari, ad esempio per creare archivi o pacchetti.

Il comando cpio può essere utilizzato per estrarre il contenuto da archivi cpio o crearli.


rpm: archivi cpio compressi con altri metadati. 

Il comando rpm viene utilizzato per gestire questi pacchetti, inclusi l'installazione, la rimozione e la verifica dei pacchetti.

 

 
# FILE GREZZI

Il comando dd è uno strumento potente per la lettura e la scrittura di dati grezzi.

Con dd, è possibile eseguire una copia diretta dei dati da una sorgente a una destinazione, bypassando il file system.

Ecco come puoi utilizzare dd per clonare un disco con un file system:

Assicurati di avere l'accesso in lettura e scrittura sia al disco di origine che a quello di destinazione.

Usa il comando dd specificando la sorgente (disco di origine) e la destinazione (disco di destinazione).

Ad esempio:

dd if=/dev/sdX of=/dev/sdY bs=4M

if specifica il percorso del disco di origine (/dev/sdX).

of specifica il percorso del disco di destinazione (/dev/sdY).

bs specifica la dimensione del blocco.


dd inizierà a copiare i dati dal disco di origine al disco di destinazione. 

Questo processo può richiedere del tempo a seconda delle dimensioni dei dischi coinvolti.
