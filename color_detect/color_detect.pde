/*
Action plan: 
1: get color
2: set hue range into a greyscale image
3: find contours of that image
4: draw boxes around those contours 
*/


import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

Capture camera;//this is the camera access
OpenCV opencv;//this is the processing thing
PImage masterImg; //this is master image
ArrayList<Contour> contoursX; //this is where countours are stored
ArrayList<Contour> contoursO; //this is where countours are stored

int colorTrack = 2; //the amount of colors that are needed to track
int[] hues; //this stores the hue value in degrees
int[] colors; //this stores the colors as rgb condensed values 
PImage[] greyScaled; //this is for the greyscaled hued outputs
int colorTolerance = 10; //this is the tolerance for color, in degrees hue used to be 10
int coarseness = 70; //this is how large a rectangle needs to be to be displayed MIGHT BE TOO BIG!!!
float scaleValue = 2.25; //this is how much you need to scale the finished boxes
boolean isX = false; 
boolean isO = false; 
float contX = 0;
float contY = 0; 
void setup()
{

  camera = new Capture(this, 640,480);
  opencv = new OpenCV(this, camera.width, camera.height); 
  contoursX = new ArrayList<Contour>(); 
  contoursO = new ArrayList<Contour>(); 
  size(2400, 1100, P2D); //P2D allows CUDA acceleration
  colors = new int[colorTrack]; 
  hues = new int[colorTrack]; 
  greyScaled = new PImage[colorTrack]; 
  camera.start(); 
  
  textSize(100);
  stroke(255,0,0);
  fill(255,0,0);
  background(71,206,255); 
 
  
}
void draw()
{
  
  background(71,206,255); 
  if(camera.available())
  {
   camera.read();  
  }
  opencv.loadImage(camera); 
  opencv.useColor();
  masterImg = opencv.getSnapshot(); 
  opencv.useColor(HSB);
  image(masterImg,0,0,1440,1080); 
   if(isX == false || isO == false)
    {
      if(isX == false)
      {
        text("click on the X", 1500, 100);
      }
      else if(isO == false)
      {
        text("click on the O", 1500, 100);
      }
    }
    else if(isX == true && isO == true)
    {
      detectColors(); 
      displayBoxes(); 
    }
  
}