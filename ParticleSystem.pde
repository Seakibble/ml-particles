class ParticleSystem
{
  private ArrayList<Particle> particles;
  private PVector position;
  private PVector gravity;
  
  ParticleSystem(float px, float py)
  {
    position = new PVector(px, py);
    gravity = new PVector(0.0, 0.2);
    
    particles = new ArrayList<Particle>();
  }
  
  public PVector getPosition()
  {
    return position;
  }
  
  public void setPosition(PVector p)
  {
    position = p;
  }
  
  public void applyGlobalForce(PVector force)
  {
    for (Particle p:particles) {
      p.applyForce(force);
    }
  }
  
  public void update()
  {
    ArrayList<Particle> toRemove = new ArrayList<Particle>();
    
    for (Particle p:particles) {
      p.applyForce(gravity);
      p.update();
      
      if (!p.isAlive()) {
        toRemove.add(p);
      }
    }
    
    particles.removeAll(toRemove);
  }
  
  public void render()
  {
    for (Particle p:particles) {
      p.render();
    }
  }
  
  public void addParticle()
  {
    Particle particleObj = new Particle(position.x, position.y);
    particles.add(particleObj);
    
    PVector randomVelocity = new PVector(random(-5.0, 5.0), random(-5.0, 5.0));
    particleObj.setVelocity(randomVelocity);
  }
}