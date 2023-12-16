void setup (){ 
    /* inizializzare variabili
    configurare i pin di input/output
    preparare l'ambiente di esecuzione del programma */
}

void loop () {
    // inserisco cosa deve fare il programma
}


pinMode(pin, INPUT / OUTPUT); // inizializzo il pin X come led (input o output)

digitalWrite(pin, LOW); // spengo il led
digitalWrite(pin, HIGH); // accendo il led
digitalRead(pin); // legge il valore digitale (HIGH o LOW) da un pin specifico

analogWrite(pin, 0); // imposto il led con segnale analogico 0 (basso)
analogWrite(pin, 255); // imposto il led con segnale analogico 255 (alto)
analogRead(pin); //legge un valore analogico da un pin specifico

Serial.begin(9600) -> // specifico la velocità di trasmissione dall'Arduino al computer
Serial.println("ciao"); -> // stampo un output sulla porta seriale
Serial.write(); // scrivo un output sulla port seriale


// esempio ciclo if
void setup() {
  pinMode(13, OUTPUT);
  pinMode(7, INPUT);
}

void loop() {
  if (digitalRead(7) == HIGH) {  // tra paentesi la codizione, legge sul pin 7 se passa corrente, se passa corrente sul pin 7 vuol dire che il tasto è premuto
    digitalWrite(13, HIGH);
  } else {
    digitalWrite(13, LOW);
  }
}


// ciclo while
while (RUN) {
    i++;
    Serial.println(i);
    delay(200);
}


// utilizzo di variabili
int led = 13;

void setup() {
 pinMode(led, OUTPUT);
}

void loop() {
  digitalWrite(led, HIGH);
}