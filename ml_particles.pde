PFont font;
ArrayList<ParticleSystem> particleSystems;


void setup()
{
  size(800,450);
  frameRate(60);
  
  font = createFont("Arial", 24);
  sprite = loadImage("sprite.png");
  
  particleSystems = new ArrayList<ParticleSystem>();
}

void draw()
{
  background(255);
  
  for (ParticleSystem ps:particleSystems) {
    PVector psPos = ps.getPosition();
    PVector deltaVector = new PVector(psPos.x - mouseX, psPos.y - mouseY);
    
    ps.applyGlobalForce(deltaVector.normalize());
    ps.update();
    ps.render();
    
    ps.addParticle();
  }
}

void mouseClicked()
{
  particleSystems.add(new ParticleSystem(mouseX, mouseY));
}