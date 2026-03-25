class Walker
{
  PVector position;
  PVector velocity;

  Walker()
  {
    position = new PVector(0, 0);
    velocity = new PVector(5, 8);
  }

  void moveAndBounce()
  {
    // move
    position.add(velocity);

    // bounce logic
    if (position.x > Window.right || position.x < Window.left)
      {
        velocity.x *= -1;
      }

    // bounce Y
    if (position.y > Window.top || position.y < Window.bottom)
      {
        velocity.y *= -1;
      }
  }

  void render()
    {
      fill(182, 52, 100);
      circle(position.x, position.y, 50);
    }
}
