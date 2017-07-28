void blitPoint(float x, float y, float wdt, float ht, int bondx, int bondy) 
{
   contX = x + wdt/2;
   contY = y + ht/2; 
   textSize(50);
   stroke(255, 255, 0);
   fill(255, 255, 0);
   strokeWeight(10);
   point(contX, contY);
   text(contX, bondx, bondy); 
   text(contY, bondx, bondy+100); 
   textSize(90);
}