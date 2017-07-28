void detectColors()
{
  for (int i = 0; i<hues.length; i++)
  {
    if(hues[i] <= 0) continue; 
    opencv.loadImage(masterImg);
    opencv.useColor(HSB); 
    
    //we need to use the hue channel as the gray channel
    //in a normal greyscale, the channel is the entire thing, but here,
    //we're useing just the single hue channel. 
    
    opencv.setGray(opencv.getH().clone()); 
    int hueCarrier = hues[i]; 
    
    //we need to filter the image based on the 
    //hue values represented in the greyscale image
    
    opencv.inRange(hueCarrier-colorTolerance/2, hueCarrier+colorTolerance/2); 
   
    //just making things a bit crisper:
    opencv.erode(); 
    greyScaled[i] = opencv.getSnapshot(); 
  }
  //now we find the contours in our greyscaled image

    if (greyScaled[0] != null)
      {
        opencv.loadImage(greyScaled[0]);
        contoursX = opencv.findContours(true,true);
      }
    if (greyScaled[1] != null)
      {
        opencv.loadImage(greyScaled[1]);
        contoursO = opencv.findContours(true,true);
      }
}