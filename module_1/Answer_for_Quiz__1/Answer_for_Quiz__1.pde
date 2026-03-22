float t = 0;
float amplitude = 50;
float frequency = 0.05;

void setup()
{
  size(1280, 720, P3D); // sets window size
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  drawCartesianPlane();
  
  drawQuadratic();
  drawLinear();
  drawSine();
  
  t += 0.05;
}

void drawCartesianPlane()
{
  background(0);
  
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -3, i, 3);
    line(-3, i, 3, i);
  }
}

// quadratic (yellow)
void drawQuadratic()
{
  stroke(255, 255, 0);
  noFill();
  beginShape();
  
  for (float x = -300; x <= 300; x++)
  {
    float y = (x*x/50) - (15*x/5) - 3;
    vertex(x, -y);
  }
  
  endShape();
}

// linear (purple)
void drawLinear()
{
  stroke(150, 0, 255);
  
  for (float x = -300; x <= 300; x++)
  {
    float y = (-5*x/5) + 30;
    point(x, -y);
  }
}

// sine wave moving
void drawSine()
{
  stroke(150, 50, 55);
  noFill();
  beginShape();
  
  for (float x = -300; x <= 300; x++)
  {
    float y = amplitude * sin(frequency * x + t);
    vertex(x, -y);
  }
  
  endShape();
}

void keyPressed() {
  // use Q to increase amplitude and W to decrease
  if (key == 'q') amplitude += 5;
  if (key == 'e') amplitude -= 5;
  // use A to increase frequency and D to decrease
  if (key == 'a') frequency += 0.01;
  if (key == 'd') frequency -= 0.01;
}
