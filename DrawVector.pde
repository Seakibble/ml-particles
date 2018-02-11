void drawVector(PVector loc, PVector v)
{
  pushMatrix();
    translate(loc.x, loc.y);
    
    stroke(255);
    strokeWeight(2);
    
    rotate(v.heading());
    
    float len = v.mag();
    
    line(0, 0, len, 0);
    
    float arrowSize = 8.0;
    
    line(len, 0, len - arrowSize, arrowSize / 2);
    line(len, 0, len - arrowSize, -arrowSize / 2);
    
  popMatrix();
}