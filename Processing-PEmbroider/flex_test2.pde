//import processing.serial.*;

//Serial myPort;  // Objet pour la communication série
//int flexValue;  // Variable pour stocker la valeur du capteur de flexion

//void setup() {
//  size(800, 800);
//  myPort = new Serial(this, "COM5", 9600);  // Remplacez "NomDuPortSérie" par le nom de votre port série
//}

//void draw() {
//  if (myPort.available() > 0) {
//    flexValue = Integer.parseInt(myPort.readStringUntil('\n').trim());  // Lire la valeur du port série
//    // Utilisez la valeur du capteur de flexion comme vous le souhaitez
//   println(flexValue);
//  }
  
//  ellipse(400,400,flexValue/2,flexValue/2);
//}

import processing.serial.*;

Serial myPort;  // Create object from Serial class
static String val;    // Data received from the serial port
int sensorVal = 0;

void setup()
{
   size(800, 800);
   noStroke();
  noFill();
  String portName = "COM5";// Change the number (in this case ) to match the corresponding port number connected to your Arduino. 

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
