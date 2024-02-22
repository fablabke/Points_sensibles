/*Nous avons utilisé le plan de connection de ce tutoriel : https://www.instructables.com/How-to-use-a-Flex-Sensor-Arduino-Tutorial/ */

const int flexPin = A0;  // Broche analogique à laquelle est connecté le capteur de flexion

void setup() {
  Serial.begin(9600);  // Initialiser la communication série à 9600 bauds
}

void loop() {
  int flexValue = analogRead(flexPin);  // Lire la valeur du capteur de flexion
  Serial.println(flexValue);  // Envoyer la valeur via le port série
  delay(100);  // Délai pour éviter une lecture trop rapide
}
