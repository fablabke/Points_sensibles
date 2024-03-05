import processing.serial.*;
Serial myPort;  // Create object from Serial class
static String val;    // Data received from the serial port

import processing.embroider.*; // importer la librairie PEmbroider - à télécharger au préalable, c'est un peu compliqué donc aller voir sur le github de PEmbroider.
PEmbroiderGraphics E;

int sensorVal;
int a=2;
int tempo= 20; //nombre de millisecondes entre chaque prélèvement de donnée auprès du flex.
float aX=0;
float aY=550; //le milieu
float bX=0;
float bY=550;  //le milieu
float dist;
int b;
String name = "2_prenom";

void setup() {    //Il n'y a pas de void draw() parce que c'est inutilisable avec PEmbroider.

  noLoop();
  size(1300, 1100);
  background(255); //couleur arrière-plan

// le setup PEmbroider : 

  E = new PEmbroiderGraphics(this, width, height);
  String outputFilePath = sketchPath(name+".pes"); //pour que le fichier de broderie soit exporté au format .pes (format de broderie adapté à ma machine), d'autres formats sont possibles comme par exemple .dst
  E.setPath(outputFilePath);
  E.beginDraw(); //commencer le dessin du fichier de broderie
  E.clear();
  E.setStitch(35, 50, 0.0); // (minimum stitch in px, desirable stitch length in px, resample noise)
  E.stroke(0); //couleur des contours soit en nuances de gris (0-255) soit en RGB (0,0,0)
  E.strokeMode(E.TANGENT);  //TANGENT = bordure suit le contour plutôt que 
                            //PERPENDICULAR = faire un point satin perpendiculaire.
  E.translate(width/2, height/2); //pour que le centre du fichier de broderie soit au centre de l'espace de visualisation. Important ici puisqu'on va tourner autour du centre, si on ne fait pas de translate, le fichier de broderie ne contiendra que le quart visible (en bas à droite)
 

E.beginShape(); //A partir d'ici, on enregistre tous les points pour ensuite créer une forme qui les relie, jusqu'à E.endShape. le "E." au début indique que ça concerne le fichier de broderie et pas la visualisation Processing.

//Le setup Arduino pour récupérér les data du capteur flex :
  
  String portName = "COM5";// Change the number (in this case ) to match the corresponding port number connected to your Arduino.
  myPort = new Serial(this, portName, 9600);

//On va créer une loop pour créer chaque point de la forme finale en fonction des données du flex. Ainsi, un flex non utilisé formera un cercle, et plus on écrase le flex plus les points du cercle seront proches du centre. 
  for (a = 0; a <= 720; a += 0) {   //720 = nombre de degrés de la loop. 720 degrés = 2 tours. 
    if ( myPort.available() > 0) {  // If data is available,
      val = myPort.readStringUntil('\n');
      try {
        sensorVal = Integer.valueOf(val.trim());
      }
      catch(Exception e) {
        ;
      }
    }

    if (sensorVal > 65) {    //les données du flex oscillent entre 0 et 1023. Nous avons décidé de n'exploiter que les données au-dessus de 65 pour éviter les glitch de départ.
      a += 1;
      b = a + 1;
      dist = map(sensorVal, 65, 1023, 0, 550);  //traduire les données du flex en un écartement du centre entre 0 et 550px
      if (dist >= 550 ) {
        dist=550;    // pour éviter les glitch qui créent des lignes qui dépassent de la distance max du cercle.
      } else if (dist <= 0 ) {
        dist=0;     // pour éviter que les glitch avec des données négatives ne posent souci.
      }
      delay(tempo);
      bX= sin(radians(b))*dist;
      bY = cos(radians(b))*dist;
      if (sensorVal >= 1023 ) {
        sensorVal=1023;
      }
      delay(tempo);
      E.vertex(bX, bY);
      aX = bX;
      aY = bY;
      delay(tempo);
    }
    println("degré: "+a+"  sensorVal: "+sensorVal+"  dist: "+dist); //pour afficher dans Processing pendant le processus où il en est dans le cercle et la valeur du flex.
                                                                    //Cela permet de vérifier pendant la session que tout fonctionne bien.
  }
  E.endShape(CLOSE); //fin du dessin de forme commencé avec BeginShape.
  E.translate(-width/2, -height/2);

//commandes de fin de PEmbroider : 
  E.optimize();  // VERY SLOW, but essential for file output! 
  E.visualize(false, true, true);   // Display the embroidery path on-screen.
      //Calling visualize() is the same as calling visualize(false, true, false). 
      //The first variable, false by default, shows you a full color preview. 
      //The second variable, true by default, shows stitch ends. 
      //The third variable, false by default, shows you a preview of connecting stitches, 
      //which you will have to manually remove after your design is embroidered. 
      //If you wanna see all the diagnostic stuff, call visualize(true, true, true);
  E.endDraw();   // Actually writes out the embroidery file.
  save(name+".png"); //saves a screenshot of the preview
}


void draw() {
}
