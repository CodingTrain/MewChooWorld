/**
 * Flocking 
 * by Daniel Shiffman.  
 * 
 * An implementation of Craig Reynold's Boids program to simulate
 * the flocking behavior of birds. Each boid steers itself based on 
 * rules of avoidance, alignment, and coherence.
 * 
 * Click the mouse to add a new boid.
 */
import peasy.PeasyCam;

Flock flock;
PeasyCam cam;

float dim = 500;
PShape mewChoo;
float angle = 0;

void setup() {
  //size(1280, 720, P3D);
  fullScreen(P3D);
  //cam = new PeasyCam(this, 200);
  mewChoo = loadShape("mewchoo.obj");
  //mewChoo.fill(255, 0, 255);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 500; i++) {
    flock.addBoid(new Boid(0, 0));
  }
}

PVector lerpV = new PVector();

void draw() {
  background(45, 197, 244);
  lights();
  ambientLight(240, 99, 164);

  Boid follow = flock.boids.get(0);
  //translate(width/2,height/2);

  PVector pos = follow.position.copy();
  lerpV.lerp(follow.velocity, 0.01);  
  PVector lookAt = PVector.sub(follow.position, PVector.mult(lerpV,250));

  //translate(-follow.position.x, -follow.position.y, -follow.position.z);
  camera( 
    lookAt.x, lookAt.y, lookAt.z, 
    pos.x, pos.y, pos.z,
    0, 0, -1);



  //translate(0, 0, -dim*4);
  //translate(0,0, -dim*2);
  // rotateY(angle);
  //rotateX(PI/4);
  stroke(252, 238, 33);
  strokeWeight(16);
  noFill();
  //rect(0,0,dim*2,dim*2);
  //fill(252, 238, 33, 50);
  box(dim*2);

  flock.run();
  angle+=0.001;
}

// Add a new boid into the System
void mousePressed() {
  flock.addBoid(new Boid(mouseX, mouseY));
}
