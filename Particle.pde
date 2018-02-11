PImage sprite;

class Particle
{
  private PVector position;
  private PVector acceleration;
  private PVector velocity;
  private PVector colour;
  
  private float damping;
  private float diameter;
  
  private float lifetime;
  private float maxLifetime;
  
  Particle(float px, float py)
  {
    position = new PVector(px, py);
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    
    damping = 0.94;
    diameter = random(3.0, 15.0);
    
    lifetime = 0;
    maxLifetime = 150;
    colour = new PVector(random(0, 100), random(0, 255), random(0, 255));
  }
  
  public boolean isAlive()
  {
    return lifetime < maxLifetime;
  }
  
  public void applyForce(PVector f)
  {
    acceleration.add(f);
  }
  
  public PVector getVelocity() {
    return velocity.copy();
  }
  
  public void setVelocity(PVector v) {
    velocity = v;
  }
  
  public PVector getPosition() {
    return position.copy();
  }
  
  public void update()
  {
    velocity.add(acceleration);
    position.add(velocity);
    
    acceleration.mult(0);
    velocity.mult(damping);
    
    lifetime++;    
  }
  
  public void render()
  {
    float lifePercent = 1.0 - (lifetime/maxLifetime);
    
    stroke(colour.x, colour.y, colour.z, 255 * lifePercent);
    
    float lifeDiameter = diameter * lifePercent;
    
    pushMatrix();
      translate(position.x, position.y);
      scale(lifePercent);
      rotate(velocity.heading());
      
      line(0, 0, lifeDiameter, 0);
    popMatrix();
  }
  
}