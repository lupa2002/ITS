# ARDUINO

![LOGO](./img/logo.png)

## COS'E' ARDUINO

Arduino è una piattaforma open-source di prototipazione elettronica basata su hardware e software flessibili e facili da usare. È progettato per consentire a persone con competenze tecniche varie, compresi i principianti, di creare progetti interattivi e dispositivi elettronici. La piattaforma include una scheda di sviluppo, chiamata "Arduino board", che può essere programmata attraverso un linguaggio di programmazione derivato da C/C++.

Le schede Arduino sono dotate di ingressi e uscite digitali e analogiche che consentono agli utenti di collegare sensori, attuatori e altri componenti elettronici. La comunità di Arduino ha sviluppato una vasta gamma di librerie e shields (schede di espansione) per semplificare la creazione di progetti, rendendo Arduino una scelta popolare per gli hobbisti, gli studenti e gli appassionati di elettronica.



## COMPONENTI HARDWARE
Arduino UNO è una piattaforma HW dotata di Microcontrollore ATMega328P
![UNO_datasheet](./img/datasheet.png)

1. **MICROCONTROLLORE**. È un microcontrollore a 8 bit, in formato PDIP a 28 pin. L’MCU è dotata di 3 differenti tipologie di memoria: FLASH 32 KB (che includono anche il bootloader e la memoria programma), SRAM 2 KB (usata per memorizzare le variabili e le costanti del software) ed EEPROM 1KB (utilizzata per memorizzare le configurazioni).
2. **PIN DIGITALI**. Un totale di 14 pin di input/output digitali programmabili, di cui 6 utilizzabili per fornire in uscita segnali modulati PWM (~).
3. **PIN ANALOGICI**. Un totale di 6 pin di input analogici.
4. **OSCILLATORE**. Oscillatore a frequenza.
5. **ALIMENTAZIONE**. Jack per alimentazione esterna (5b: Regolatore di tensione).
6. **ICSP**. Connettore ICSP (In Circuit Serial Programmer) per effettuare la programmazione diretta del microcontrollore.
7. **RESET**. Pulsante di Reset.
8. **CONNETTORE USB**. Connettore USB utilizzabile sia per alimentare la scheda che per programmare il microcontrollore.
9. **COMUNICAZIONE**. Dispositivo per la comunicazione 16U2, si occupa della conversione dei dati provenienti dall’USB in dati seriali (e viceversa).


## IDE

Nell'IDE, scrivi il tuo programma utilizzando il linguaggio di programmazione di Arduino, che è essenzialmente una variante semplificata di C/C++.

Il codice Arduino è suddiviso in due funzioni principali:

* `void setup():` Questa funzione viene eseguita una sola volta all'avvio della scheda Arduino. In questa funzione, puoi eseguire le impostazioni iniziali, come configurare le porte di I/O.
* `void loop():` Questa funzione viene eseguita ripetutamente finché la scheda Arduino è accesa. In questa funzione, puoi inserire il codice che vuoi che la scheda Arduino esegua.


## TIPI DI DATI

Arduino supporta diversi tipi di dati, ciascuno con le proprie caratteristiche.

* `int` è un tipo di dato intero. Può contenere valori da -32768 a 32767.
* `float` è un tipo di dato a virgola mobile. Può contenere valori con precisione fino a 6 decimali.
* `char` è un tipo di dato carattere. Può contenere un singolo carattere, come una lettera, un numero o un simbolo.
* `bool` è un tipo di dato booleano. Può contenere solo due valori: true o false.

## COMANDI BASE
I comandi di base di Arduino consentono di controllare le porte di input/output (I/O) della scheda. I pin I/O possono essere utilizzati per collegare sensori, dispositivi esterni o altri componenti elettronici.

* `digitalWrite(pin, valore)`: imposta il valore di una porta digitale. Il valore può essere HIGH (5 V) o LOW (0 V).
* `digitalRead(pin)`: legge il valore di una porta digitale. Il valore letto può essere HIGH o LOW.
* `pinMode(pin, modalità)`: imposta la modalità di una porta digitale. La modalità può essere INPUT, OUTPUT o INPUT_PULLUP.
