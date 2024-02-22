import processing.serial.*;
Serial myPort;  // Create object from Serial class
static String val;    // Data received from the serial port

import processing.embroider.*;
PEmbroiderGraphics E;

int sensorVal;
int a=2;
int tempo= 20;
float aX=0;
float aY=550;
float bX=0;
float bY=550;
float dist;
int b;
String name = "2_prenom";

void setup() {

  noLoop();
  size(1300, 1100);
  background(255);
  //translate(width/2, height/2);// bring zero point to the center


  E = new PEmbroiderGraphics(this, width, height);
  String outputFilePath = sketchPath(name+".pes");
  E.setPath(outputFilePath);
  E.beginDraw();
  E.clear();
  E.setStitch(35, 50, 0.0);
  //E.strokeWeight(1);
  E.stroke(0);
  //E.strokeSpacing(8);
  E.strokeMode(E.TANGENT);
  //E.toggleResample(true);
  E.translate(width/2, height/2);
  E.beginShape();
  
  String portName = "COM5";// Change the number (in this case ) to match the corresponding port number connected to your Arduino.
  myPort = new Serial(this, portName, 9600);
  for (a = 0; a <= 720; a += 0) {
    if ( myPort.available() > 0) {  // If data is available,
      val = myPort.readStringUntil('\n');
      try {
        sensorVal = Integer.valueOf(val.trim());
      }
      catch(Exception e) {
        ;
      }
    }

    //if(a<360 && sensorVal<1024 && sensorVal>49){a++;}
    if (sensorVal > 65) {
      a += 1;
      b = a + 1;
      dist = map(sensorVal, 65, 1023, 0, 550);
      if (dist >= 550 ) {
        dist=550;
      } else if (dist <= 0 ) {
        dist=0;
      }
      delay(tempo);
      bX= sin(radians(b))*dist;
      bY = cos(radians(b))*dist;
      if (sensorVal >= 1023 ) {
        sensorVal=1023;
      }
      delay(tempo);
      //E.circle(bX,bY,1);
      //E.line(aX, aY, bX, bY);
      E.vertex(bX, bY);
      aX = bX;
      aY = bY;
      delay(tempo);
    }
    println("degré: "+a+"  sensorVal: "+sensorVal+"  dist: "+dist); // read it and store it in vals!
  }
  E.endShape(CLOSE);
  E.translate(-width/2, -height/2);

  E.optimize();
  E.visualize(false, true, true);
  E.endDraw();
  save(name+".png");
}


void draw() {
}
