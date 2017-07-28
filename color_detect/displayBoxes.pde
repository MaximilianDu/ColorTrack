void displayBoxes()
{
  for (int i = 0; i < contoursX.size(); i++)
  {
    Contour contour = contoursX.get(i);
    Rectangle r = contour.getBoundingBox();
    
    if (r.width < coarseness || r.height < coarseness)
      continue;
    textSize(70); 
    stroke(255, 0, 0);
    fill(255, 0, 0, 150);
    strokeWeight(2);
    rect(r.x*scaleValue, r.y*scaleValue, r.width*scaleValue, r.height*scaleValue);
    blitPoint(r.x*scaleValue, r.y*scaleValue, r.width*scaleValue, r.height*scaleValue,1500, (i*200)+700);
    text("X", 1550, 610); 
  }
  for (int i = 0; i < contoursO.size(); i++)
  {
    Contour contour = contoursO.get(i);
    Rectangle r = contour.getBoundingBox();
    
    if (r.width < coarseness || r.height < coarseness)
      continue;
     
    stroke(0, 0, 255);
    fill(0, 0, 255, 150);
    strokeWeight(2);
    rect(r.x*scaleValue, r.y*scaleValue, r.width*scaleValue, r.height*scaleValue);
    blitPoint(r.x*scaleValue, r.y*scaleValue, r.width*scaleValue, r.height*scaleValue, 1500, (i*200)+200);
    text("O", 1550, 100); 
  }
}