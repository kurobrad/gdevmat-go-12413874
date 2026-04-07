ArrayList<Walker> walkers = new ArrayList<Walker>();

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // 10 walkers
  for (int i = 0; i < 10; i++) {
    Walker w = new Walker();
    w.randomColor();
    w.mass = random(5, 20);
    w.scale = w.mass * 10;
    w.position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    w.gravitationalConstant = 0.5;
    walkers.add(w);
  }
}

void draw()
{
  background(255);
  
  for (Walker w : walkers) 
  {
    w.update();
    w.render();
  }
  
  // gravitational attraction
  for (int i = 0; i < walkers.size(); i++) 
  {
    for (int j = 0; j < walkers.size(); j++) 
    {
      if (i != j) 
      {
        Walker walkerA = walkers.get(i);
        Walker walkerB = walkers.get(j);
        walkerA.applyForce(walkerB.calculateAttraction(walkerA));
      }
    }
  }
}
