import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh2d.*;
import toxi.math.*;
import toxi.math.conversion.*;
import toxi.math.noise.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;

import toxi.physics.*;
//import toxi.physics.behaviors.*;
//import toxi.physics.constraints.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;

VerletPhysics2D physics;

Particle[] particles = new Particle[2];
Attractor a;

void setup() {
  size(640,360);
  
  physics = new VerletPhysics2D();
  //physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.1)));
  
  a = new Attractor(width/2,height/2);
  a.lock();
  
  particles[0] = new Particle(400,50);
  particles[1] = new Particle(width/2,50);
}

void draw() {
  background(255);
  physics.update();
  a.display();
  for (Particle p : particles) {
    p.savePos();
    p.displayTrail();
    p.display();
    p.shortenTrail();
  }
}