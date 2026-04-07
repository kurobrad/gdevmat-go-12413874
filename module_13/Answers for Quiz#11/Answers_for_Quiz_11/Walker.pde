public class Walker {
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 15;
  public float scale = 15;
  public float mass = 1;
  public float gravitationalConstant = 0.5;
  public color walkerColor;
  
  public Walker() 
  {
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  public void randomColor() {
    walkerColor = color(random(255), random(255), random(255));
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  public void update() 
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
    
    if (this.position.x > Window.right) this.position.x = Window.left;
    if (this.position.x < Window.left) this.position.x = Window.right;
    if (this.position.y > Window.top) this.position.y = Window.bottom;
    if (this.position.y < Window.bottom) this.position.y = Window.top;
  }
  
  public void render() 
  {
    pushMatrix();
    translate(position.x, position.y);
    fill(walkerColor);
    noStroke();
    ellipse(0, 0, scale, scale);
    popMatrix();
  }
  
  public PVector calculateAttraction(Walker walker)
  {
    PVector force = PVector.sub(this.position, walker.position);
    float distance = force.mag();
    force.normalize();
    
    distance = constrain(distance, 5, 25); 
    
    float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
}
