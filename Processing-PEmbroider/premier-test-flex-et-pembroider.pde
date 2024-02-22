import processing.embroider.*;
import processing.serial.*;

PEmbroiderGraphics E;

Serial myPort;  // Create object from Serial class
static String val;    // Data received from the serial port

int sensorVal;
int a=100;
int b=1;
float aX=0;
float aY=0;
float bX=0;
float bY=0;
float dist = 400;

void setup() {

  noLoop();
  size(1000, 1000);
  background(255);
  frameRate(10);

  E = new PEmbroiderGraphics(this, width, height);
  String outputFilePath = sketchPath("skyline6.dst");
  E.setPath(outputFilePath);

  E.beginDraw();
  //E.clear();
  E.setStitch(35, 50, 0.0);
  E.strokeWeight(1);
  E.stroke(0);


  String portName = "COM5";// Change the number (in this case ) to match the corresponding port number connected to your Arduino.

  myPort = new Serial(this, portName, 9600);
  translate(width/2, height/2);// bring zero point to the center

  aX= sin(radians(a))*dist;
  aY = cos(radians(a))*dist;

  for (a=0; a<=360; a++) {

    if ( myPort.available() > 0) {  // If data is available,
      val = myPort.readStringUntil('\n');
      try {
        sensorVal = Integer.valueOf(val.trim());
      }
      catch(Exception e) {
      }
      println(sensorVal); // read it and store it in vals!
    }

    
    b = a+1;

    pushMatrix();
    //stroke(0);

    bX= sin(radians(b))*dist;
    bY = cos(radians(b))*dist;

    dist = map(sensorVal, 50, 1023, 0, 400);

    E.line(aX, aY, bX, bY);
    aX = bX;
    aY = bY;

    print (a);

    delay(1);
    popMatrix();
  }

  E.optimize();
  E.visualize(true, false, false);
  E.endDraw();
  save("skyline6.png");
}


void draw() {
}

//Calling visualize() is the same as calling visualize(false, true, false).
//The first variable, false by default, shows you a full color preview.
//The second variable, true by default, shows stitch ends.
//The third variable, false by default, shows you a preview of connecting stitches,
