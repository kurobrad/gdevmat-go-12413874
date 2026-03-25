public class Walker {
  public float x;
  public float y;
  public float tx = 0, ty = 10000;
  public float ts = 20000;
  public float tr = 30000, tg = 40000, tb = 50000;

  void render() {
    // perlin noise to size (thickness)
    float size = map(noise(ts), 0, 1, 5, 150);

    // perlin noise (rgb values)
    float r = map(noise(tr), 0, 1, 0, 255);
    float g = map(noise(tg), 0, 1, 0, 255);
    float b = map(noise(tb), 0, 1, 0, 255);

    fill(r, g, b);
    noStroke();
    circle(x, y, size);
  }

  void perlinWalker() {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);

    tx += 0.01f;
    ty += 0.01f;

    ts += 0.01f;
    tr += 0.01f;
    tg += 0.01f;
    tb += 0.01f;
  }
} 
