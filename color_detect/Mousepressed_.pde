void mousePressed() 
{
   if(isX == false)
   {
    color c = get(mouseX, mouseY); 
    colors[0] = c; 
    int hue = int(map(hue(c), 0, 255, 0, 180));//maps the color from 255 to 180
    hues[0] = hue; 
    isX = true; 
   }
   else if(isO == false)
   {
    color c = get(mouseX, mouseY); 
    colors[1] = c; 
    int hue = int(map(hue(c), 0, 255, 0, 180));//maps the color from 255 to 180
    hues[1] = hue; 
    isO = true; 
   }
  
}