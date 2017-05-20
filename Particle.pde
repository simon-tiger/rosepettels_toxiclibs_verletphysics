class Particle extends VerletParticle2D {
  
  float r = 8;
  ArrayList<Vec2D> history;
  
  Particle(float x, float y) {
    super(x, y);
    history = new ArrayList<Vec2D>();
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*4, -1));
  }
  
  void savePos() {
    history.add(new Vec2D(x,y));
  }
  
  void restorePos() {
    history.remove(0);
  }
  
  void shortenTrail() {
    if (history.size() > 420) {
      restorePos();
    }
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(x,y,r*2,r*2);
  }
  
  void displayTrail() {
    stroke(0);
    strokeWeight(2);
    for (int i = 1; i < history.size(); i++) {
      Vec2D loc1 = history.get(i-1);
      Vec2D loc2 = history.get(i);
      line(loc1.x,loc1.y,loc2.x,loc2.y);
    }
  }
}