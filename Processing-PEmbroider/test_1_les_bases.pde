// Example PEmbroider program
import processing.embroider.*;
PEmbroiderGraphics E;

void setup() {

  // Starting up:
  noLoop();
  size(1200, 1200);
  E = new PEmbroiderGraphics(this, width, height);
  String outputFilePath = sketchPath("test3bonshommes.dst");
  E.setPath(outputFilePath); 
  
  //start drawing :
  E.beginDraw();
  E.clear();
  
  //default stitches are too small and dense, the parameters below help. 
  E.strokeSpacing(3.0);   // this spaces the stroke (outline) stitches by 2 pixels
  E.hatchSpacing(2.0);    // this spaces hatch (fill) stitches by 8 pixels
  E.setStitch(30,50,0.0); // (minimum stitch in px, desirable stitch length in px, resample noise)

  //E.noStroke(); //disable outlining shape
  E.stroke(255,0,0); //rgb value for stroke
  E.strokeMode(E.TANGENT); //TANGENT = bordure suit le contour plutôt que 
                           //PERPENDICULAR = faire un point satin perpendiculaire.
  E.strokeWeight(10); //sets width of shapes' strokes.


  //-------
  // Content goes here:
  //E.fill(0, 0, 0); 
  //E.ellipse(400,400,200,50); //(posX,posY,lengthX,lengthY)

//tutorial youtube : https://www.youtube.com/watch?v=BDE2Tx6HHLc

  int circleDiameter = 250;

  int numCols = 3;
  int numRows = 3;

  for (int col = 0; col<numCols; col++){
    int centerX = col*(circleDiameter+100)+250;
    for (int row = 0; row<numRows; row++){
      int centerY = row*(circleDiameter+100)+250;
      float currentDiameter = circleDiameter*random(.5,1.9);
      E.circle(centerX, centerY, currentDiameter); //(posX,posY,diameter)
  }
  }
  
  //on recrée une loop complète avec la deuxième couleur pour que la machine brode
  //une seule couleur à la fois et ne change pas tout le temps.
  E.fill(0,0,255);
  E.noStroke();
  int eyeDiameter = 75;
  
  for (int col = 0; col<numCols; col++){
    int centerX = col*(circleDiameter+100)+250;
    for (int row = 0; row<numRows; row++){
      int centerY = row*(circleDiameter+100)+250;
      float eyeDistance = random(75,150);
      E.circle (centerX+eyeDistance/2, centerY, eyeDiameter);
      E.circle (centerX-eyeDistance/2, centerY, eyeDiameter*random(.5,1.4));
      
  }
  }

  //----------  
  // Visualization and export:
  // NOTE: Leave optimize() and endDraw() commented out,
  // until you are ready to export the embroidery file! 
  // Don't forget to un-comment them when you want to export!
  //
 // E.optimize(); // VERY SLOW, but essential for file output! 
  E.visualize(false,false,true);   // Display the embroidery path on-screen.
      //Calling visualize() is the same as calling visualize(false, true, false). 
      //The first variable, false by default, shows you a full color preview. 
      //The second variable, true by default, shows stitch ends. 
      //The third variable, false by default, shows you a preview of connecting stitches, 
      //which you will have to manually remove after your design is embroidered. 
      //If you wanna see all the diagnostic stuff, call visualize(true, true, true);
  E.endDraw();  // Actually writes out the embroidery file.
  //save("test3bonshommes.png"); //saves a screenshot of the preview
}
