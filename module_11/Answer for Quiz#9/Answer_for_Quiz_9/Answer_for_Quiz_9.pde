Walker[] walkers = new Walker[8];

void setup() 
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // initialize walkers
  for (int i = 0; i < walkers.length; i++) 
  {
    walkers[i] = new Walker();
    walkers[i].mass = i + 1; // mass values
    walkers[i].scale = walkers[i].mass * 15; // scale
    walkers[i].randomColor(); // random color
    
    // positions
    float posY = 1.5f * ((float)Window.windowHeight / walkers.length) * (i - (walkers.length / 2));
    walkers[i].position = new PVector(Window.left + 50, posY);
  }
}

float mew = 0.01f;
boolean frictionChanged = false;

void draw() 
{
  background(255);
  noStroke();
  
  PVector accelerationForce = new PVector(0.2, 0);
  
  if (!frictionChanged) 
  {
    for (Walker walker : walkers) 
    {
      if (walker.position.x > 0) 
      {
        mew = 0.4f;
        frictionChanged = true;
        break;
      }
    }
  }
  
  // apply to all walkers
  for (Walker walker : walkers) 
  {
    // acceleration force
    walker.applyForce(accelerationForce);
    
    // calculate and apply friction force
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = walker.velocity.copy();
    
    if (friction.mag() > 0) 
    {
      friction.mult(-1);
      friction.normalize();
      friction.mult(frictionMagnitude);
      walker.applyForce(friction);
    }
    
    walker.update();
    walker.render();
    
    // stop after max friction
    if (abs(walker.velocity.x) < 0.1 && abs(walker.velocity.y) < 0.1 && mew == 0.4f) 
    {
      walker.velocity.x = 0;
      walker.velocity.y = 0;
      walker.acceleration.x = 0;
      walker.acceleration.y = 0;
    }
    
    // ground collision
    if (walker.position.y <= Window.bottom) 
    {
      walker.position.y = Window.bottom;
      walker.velocity.y = 0;
    }
    
    // ceiling collision
    if (walker.position.y >= Window.top)
    {
      walker.position.y = Window.top;
      walker.velocity.y = 0;
    }
    
    // left wall
    if (walker.position.x <= Window.left) 
    {
      walker.position.x = Window.left;
      walker.velocity.x = 0;
    }
    
    // right wall
    if (walker.position.x >= Window.right) 
    {
      walker.position.x = Window.right;
      walker.velocity.x = 0;
    }
  }
}

void mouseClicked() 
{
  // reset everything
  mew = 0.01f;
  frictionChanged = false;
  
  for (int i = 0; i < walkers.length; i++) 
  {
    walkers[i].mass = i + 1;
    walkers[i].scale = walkers[i].mass * 15;
    walkers[i].randomColor();
    walkers[i].velocity = new PVector(0, 0);
    walkers[i].acceleration = new PVector(0, 0);
    
    float posY = 1.5f * ((float)Window.windowHeight / walkers.length) * (i - (walkers.length / 2));
    walkers[i].position = new PVector(Window.left + 50, posY);
  }
}
