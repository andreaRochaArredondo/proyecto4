import processing.video.*;
import processing.sound.*;
import gab.opencv.*;
import java.awt.*;
PImage marci;
PImage bombon;
PImage pez;
PImage cintia;
PImage jony;
PImage perro;
PImage pato;
PImage mabel;
PImage fondo;
PImage fondof;
PImage ejem1;
PImage ejem2;
PImage ejem3;
int pantalla = 0;
Capture cam;
OpenCV opencv;
Texto tx;
SoundFile bit;

class flujoPantallas{
  int estado;
  
  flujoPantallas(){
    this.estado = 0;
  }
  
  void display(){
    switch(this.estado){
    case 0:
      imageMode(CORNER);
      image(fondo,0,0);
      tx.Tcaso1();
    break;
    case 1:
      background(255,90,100);
      tx.Tcaso2();
      image(ejem1,30,200,220,120);
      image(ejem2,200,200,220,120);
      image(ejem3,400,200,220,120);
    break;
    case 2:
      imageMode(CORNER);
      image(marci,0,0);
      if( key == '1'){
        imageMode(CORNER);
      image(bombon,0,0);
      }
      if( key == '2'){
        imageMode(CORNER);
      image(pez,0,0);
      }
      if( key == '3'){
        imageMode(CORNER);
      image(cintia,0,0);
      }
      if( key == '4'){
        imageMode(CORNER);
      image(jony,0,0);
      }
      if( key == '5'){
        imageMode(CORNER);
      image(perro,0,0);
      }
      if( key == '6'){
        imageMode(CORNER);
      image(pato,0,0);
      }
      if( key == '7'){
        imageMode(CORNER);
      image(mabel,0,0);
      }
      if( key == '8'){
        imageMode(CORNER);
      image(marci,0,0);
      }
      
      
      
  if(cam.height != 0){
    opencv.loadImage(cam);
    //opencv.threshold(50);
   // image(cam,0,0);
    Rectangle[] caras = opencv.detect();
    for(int i = 0; i<caras.length; i++){
      noFill();
      stroke(255,0,0);
      strokeWeight(4);
      //rect(caras[i].x,caras[i].y,caras[i].width,caras[i].height);
      opencv.threshold(50);
      image(cam.get(caras[i].x,caras[i].y,caras[i].width,caras[i].height),caras[i].x,caras[i].y);
    }
    
  }
    break;
    case 3:
       imageMode(CORNER);
      image(fondof,0,0);
       tx.Tcaso3();
    break;
  }
  }
  
  void cambioPantalla(){
    estado++;
  if(estado>3){
    estado = 0;
  }
  }
  
  
}

flujoPantallas uno;


void setup(){
  size(640,360);
  cam = new Capture(this, Capture.list()[1]);
  opencv = new OpenCV(this,640,360);
  opencv.loadCascade(OpenCV.CASCADE_EYE );
  cam.start();
  marci = loadImage("images.jpg");
  bombon = loadImage("Sin título-1.jpg");
  pez = loadImage("Sin título-2.jpg");
  cintia = loadImage("33333.jpg");
  jony = loadImage("4444.jpg");
  perro = loadImage("5555.jpg");
  pato = loadImage("66666.jpg");
  mabel = loadImage("77777.jpg");
  fondo = loadImage("fondo.jpg");
  fondof = loadImage("images (1).jpg");
  ejem1 = loadImage("screen-0969.tif");
  ejem2 = loadImage("screen-0800.tif");
  ejem3 = loadImage("screen-0375.tif");
  
   uno = new flujoPantallas();
   
   tx = new Texto();
   
  bit= new SoundFile(this,"My_Peeps.mp3");
  bit.loop();

}

void draw(){
   uno.display();
}

void captureEvent(Capture c) {
  c.read();
}
void keyPressed(){
  if (key == CODED) {
    if (keyCode == CONTROL){
     saveFrame();
    }
 } 
}

void mousePressed(){
  uno.cambioPantalla();
  pantalla ++;
  
}
