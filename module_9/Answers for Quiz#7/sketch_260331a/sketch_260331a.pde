Walker[] walkers = new Walker[100];

void setup() 
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // initialize 100 walkers
  for (int i = 0; i < walkers.length; i++) 
  {
    walkers[i] = new Walker();
    
    // random position for the walkers
    walkers[i].position.x = random(Window.left, Window.right);
    walkers[i].position.y = random(Window.bottom, Window.top);
    
    // random scale
    walkers[i].scale = random(5, 35);
    
    // random colors
    walkers[i].setColor(random(255), random(255), random(255), 255);
    
    // random initial movement
    walkers[i].velocity = new PVector(random(-2, 2), random(-2, 2));
  }
}

void draw() 
{
  background(0);
  
  // mouse position
  PVector mouseWorld = mousePos();
  
  for (int i = 0; i < walkers.length; i++) 
  {
    PVector toMouse = PVector.sub(mouseWorld, walkers[i].position);
    float distance = toMouse.mag();
    PVector acceleration = new PVector();
    
    if (distance > 80) 
    {
      // attract towards mouse
      acceleration = PVector.sub(mouseWorld, walkers[i].position);
      acceleration.normalize();
      
      float strength = map(distance, 80, 500, 0.03, 0.15);
      strength = constrain(strength, 0.03, 0.15);
      acceleration.mult(strength);
    } else {
      PVector orbit = new PVector(-toMouse.y, toMouse.x);
      orbit.normalize();
      
      float orbitStrength = map(distance, 0, 80, 0.25, 0.12);
      orbit.mult(orbitStrength);
      acceleration = orbit;
     
      PVector outward = PVector.sub(walkers[i].position, mouseWorld);
      outward.normalize();
      outward.mult(0.05);
      acceleration.add(outward);
      
      PVector randomForce = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
      acceleration.add(randomForce);
    }
    
    PVector randomForce = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    acceleration.add(randomForce);
    
    // apply acceleration on walkers
    walkers[i].acceleration = acceleration;
    
    walkers[i].update();
    walkers[i].render();
    walkers[i].checkEdges();
  }
}

// Convert mouse coordinates to world coordinates
PVector mousePos() {
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}
