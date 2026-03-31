Walker blackHole;
Walker[] matters = new Walker[50];
int frameCounter = 0;
int resetAfterNFrames = 300;

void setup() 
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initSimulation();
}

void initSimulation() 
{
  // initialize blackhole
  blackHole = new Walker();
  blackHole.position.x = random(Window.left, Window.right);
  blackHole.position.y = random(Window.bottom, Window.top);
  blackHole.scale = 70;
  blackHole.setColor(255, 255, 255, 255);
  
  // gaussian distribution
  for (int i = 0; i < matters.length; i++) 
  {
    matters[i] = new Walker();

    float x = (float)randomGaussian() * (Window.right - Window.left) / 4;
    float y = (float)randomGaussian() * (Window.top - Window.bottom) / 4;
    
    // clamp
    matters[i].position.x = constrain(x, Window.left, Window.right);
    matters[i].position.y = constrain(y, Window.bottom, Window.top);
    
    // random scale
    matters[i].scale = random(5, 30);
    
    // random colors
    matters[i].setColor(random(255), random(255), random(255), 255);
  }
}

void draw() 
{
  background(0);
  
  for (int i = 0; i < matters.length; i++) 
  {
    if (matters[i] != null) 
    {
      PVector direction = PVector.sub(blackHole.position, matters[i].position);
      float distance = direction.mag();
      direction.normalize();
      
      // suction stronger when closer
      float speed;
      if (distance < 100)
      {
        speed = map(distance, 0, 100, 15, 8);
      } else {
        speed = map(distance, 100, 800, 8, 5);
      }
      
      // cap the speed
      speed = constrain(speed, 2, 15);
      
      matters[i].position.add(PVector.mult(direction, speed));
      
      if (distance < blackHole.scale / 2 + matters[i].scale / 2)
      {
        // matter gets absorbed
        int edge = (int)random(4);
        switch(edge) 
        {
          case 0: // top
            matters[i].position.x = random(Window.left, Window.right);
            matters[i].position.y = Window.top;
            break;
          case 1: // bottom
            matters[i].position.x = random(Window.left, Window.right);
            matters[i].position.y = Window.bottom;
            break;
          case 2: // left
            matters[i].position.x = Window.left;
            matters[i].position.y = random(Window.bottom, Window.top);
            break;
          case 3: // right
            matters[i].position.x = Window.right;
            matters[i].position.y = random(Window.bottom, Window.top);
            break;
        }
        
        // color randomizer
        matters[i].setColor(random(255), random(255), random(255), 125);
      }
      
      if (matters[i].position.x < Window.left) matters[i].position.x = Window.right;
      if (matters[i].position.x > Window.right) matters[i].position.x = Window.left;
      if (matters[i].position.y < Window.bottom) matters[i].position.y = Window.top;
      if (matters[i].position.y > Window.top) matters[i].position.y = Window.bottom;
      
      matters[i].render();
    }
  }
  
  // display blackhole
  blackHole.render();
  
  // reset after the 300 frames
  frameCounter++;
  if (frameCounter >= resetAfterNFrames) 
  {
    initSimulation();
    frameCounter = 0;
  }
}
