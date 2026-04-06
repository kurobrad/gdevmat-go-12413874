import processing.core.PApplet;
import processing.core.PVector;

Liquid ocean;
Walker[] walkers = new Walker[10];
float c = 0.1f;
float normal = 1;

void setup()
  {
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    
    // 10 walkers
    float spacing = (float)Window.right * 2 / 11;
    float startX = -Window.right + spacing;
    
    for (int i = 0; i < 10; i++)
    {
      walkers[i] = new Walker();
      walkers[i].position = new PVector(startX + i * spacing, 200);
      walkers[i].randomColor();
      walkers[i].mass = random(0.5f, 3.0f);
      walkers[i].scale = 10 * walkers[i].mass;
    }
    
    ocean = new Liquid(0, -100, Window.right, Window.bottom + 100, 0.1f);
  }

void draw()
  {
    background(255);
    
    ocean.render();
    
    // wind force
    PVector wind = new PVector(0.1f, 0);
    
    for (Walker walker : walkers) 
    {
      // apply wind
      walker.applyForce(wind);
      
      // apply gravity
      PVector gravity = new PVector(0, -0.15f * walker.mass);
      walker.applyForce(gravity);
      
      // collider
      if (ocean.isCollidingWith(walker)) 
      {
        float frictionMagnitude = c * normal;
        PVector friction = walker.velocity.copy();
        
        if (friction.mag() > 0) 
        {
          friction.mult(-1);
          friction.normalize();
          friction.mult(frictionMagnitude);
          walker.applyForce(friction);
        }
        
        // drag force
        PVector dragForce = ocean.calculateDragForce(walker);
        walker.applyForce(dragForce);
      }
      
      if (walker.position.y <= Window.bottom) 
      {
        walker.position.y = Window.bottom;
        walker.velocity.y *= -0.5;
        walker.velocity.x *= 0.95;
      }
      
      if (walker.position.y >= Window.top) 
      {
        walker.position.y = Window.top;
        walker.velocity.y *= -0.8;
      }
      
      if (walker.position.x <= Window.left) 
      {
        walker.position.x = Window.left;
        walker.velocity.x *= -0.9;
      }
      if (walker.position.x >= Window.right) 
      {
        walker.position.x = Window.right;
        walker.velocity.x *= -0.9;
      }
      
      walker.update();
      walker.render();
    }
}
