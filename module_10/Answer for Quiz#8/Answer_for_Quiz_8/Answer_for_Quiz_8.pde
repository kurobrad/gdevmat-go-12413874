Walker[] walkers = new Walker[10];

void setup() 
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // 10 walkers
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
    walkers[i].mass = i + 1; // mass values
    walkers[i].scale = walkers[i].mass * 12; // scale
    walkers[i].position = new PVector(-200, 200); // starting point
    walkers[i].randomColor(); // random color generator
  }
}

void draw() 
{
  background(0);
  
  // define
  PVector gravity = new PVector(0, -0.4);
  PVector wind = new PVector(0.15, 0);
  
  // apply to all walkers
  for (Walker walker : walkers) {
    walker.applyForce(gravity);
    walker.applyForce(wind);
    walker.update();
    walker.render();
    
    // newton's third law
    if (walker.position.y <= Window.bottom) {
      walker.velocity.y *= -1;
      walker.position.y = Window.bottom;
    }
    if (walker.position.y >= Window.top) {
      walker.velocity.y *= -1;
      walker.position.y = Window.top;
    }
    if (walker.position.x <= Window.left) {
      walker.velocity.x *= -1;
      walker.position.x = Window.left;
    }
    if (walker.position.x >= Window.right) {
      walker.velocity.x *= -1;
      walker.position.x = Window.right;
    }
  }
}
