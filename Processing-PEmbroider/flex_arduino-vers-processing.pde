

//Pour importer des données de Arduino : 

import processing.serial.*;

Serial myPort;  // Objet pour la communication série
static String val;    // Variable = la valeur du capteur flex (data reçue du capteur)
int sensorVal = 0;

void setup()
{
   size(800, 800);
   noStroke();
  noFill();
  String portName = "COM5";// Remplacez "COM5" par le nom de votre port série

  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  if ( myPort.available() > 0) {  // If data is available,
  val = myPort.readStringUntil('\n'); 
  try {
   sensorVal = Integer.valueOf(val.trim());
  }
  catch(Exception e) {
  ;
  }
  println(sensorVal); // read it and store it in vals!
  }  
 background(0);
  // Scale the mouseX value from 0 to 640 to a range between 0 and 175
  float c = map(sensorVal, 0, width, 0, 400);
  // Scale the mouseX value from 0 to 640 to a range between 40 and 300
  float d = map(sensorVal, 0, width, 40,500);
  fill(255, c, 0);
  ellipse(width/2, height/2, d, d);   

}
