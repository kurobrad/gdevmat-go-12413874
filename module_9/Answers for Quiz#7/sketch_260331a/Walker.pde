public class Walker {
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float scale = 15;
  public float r = 255, g = 255, b = 255, a = 255;
  
  public Walker() 
  {
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  public void update() 
  {
    this.velocity.add(this.acceleration);
    
    // limit max speed
    this.velocity.limit(4);
    
    this.position.add(this.velocity);
    
    // deceleration
    this.velocity.mult(0.99);
    
    // Reset acceleration
    this.acceleration.mult(0);
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
  
  public void checkEdges() 
  {
    if (this.position.x > Window.right) 
    {
      this.position.x = Window.left;
    } else if (this.position.x < Window.left) {
      this.position.x = Window.right;
    }
    
    if (this.position.y > Window.top) 
    {
      this.position.y = Window.bottom;
    } else if (this.position.y < Window.bottom) {
      this.position.y = Window.top;
    }
  }
}
