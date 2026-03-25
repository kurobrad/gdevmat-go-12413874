void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  // mouse movement
  float x = mouseX - Window.windowWidth / 1;
  float y = -(mouseY - Window.windowHeight / 1);
  return new PVector(x, y);
}

void draw()
{
  background(0);

  // center
  translate(width / 50, height / 50);
  
  PVector dir = mousePos();
  
  float length = 250;

  dir.normalize();

  PVector end1 = PVector.mult(dir, length);
  PVector end2 = PVector.mult(dir, -length);

  // red glow
  for (int i = 30; i > 0; i -= 5)
  {
    stroke(255, 0, 0, 40);
    strokeWeight(i);

    line(0, 0, end1.x, end1.y);
    line(0, 0, end2.x, end2.y);
  }

  // white core
  stroke(255);
  strokeWeight(6);
  line(0, 0, end1.x, end1.y);
  line(0, 0, end2.x, end2.y);

  // handle
  stroke(0);
  strokeWeight(12);
  line(end1.x * 0.1, end1.y * 0.1, end2.x * 0.1, end2.y * 0.1);

  println(end1.mag());
}
