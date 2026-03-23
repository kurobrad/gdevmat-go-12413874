Walker myWalker = new Walker();
Walker xWalker = new Walker();

void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  // normal random walker
  myWalker.randomWalk();
  myWalker.render();

  // biased walker
  xWalker.randomWalkBiased();
  xWalker.render();
}
