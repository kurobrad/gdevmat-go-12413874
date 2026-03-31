public class Walker {
  public PVector position;
  public float scale = 50;
  public float r = 255, g = 255, b = 255, a = 255;
  
  Walker() 
  {
    position = new PVector();
  }
  
  Walker(float x, float y) 
  {
    position = new PVector(x, y);
  }
  
  Walker(float x, float y, float scale) 
  {
    position = new PVector(x, y);
    this.scale = scale;
  }
  
  Walker(PVector position) 
  {
    this.position = position;
  }
  
  Walker(PVector position, float scale) 
  {
    this.position = position;
    this.scale = scale;
  }
  
  public void render() 
  {
    fill(r, g, b, a);
    noStroke();
    circle(position.x, position.y, scale);
  }
  
  public void setColor(float r, float g, float b, float a) 
  {
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
  }
  
  public void randomWalk() {
    float decision = random(0, 4);
    
    if (decision == 0) 
    {
      position.x++;
    } else if (decision == 1) {
      position.x--;
    } else if (decision == 2) {
      position.y++;
    } else if (decision == 3) {
      position.y--;
    }
  }
}
