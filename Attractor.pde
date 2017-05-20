class Attractor extends VerletParticle2D {
  
  Attractor(float x, float y) {
    super(x, y);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, 32, -0.4));
    physics.addBehavior(new AttractionBehavior(this, height, 0.05));
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(x,y,16,16);
  }
}