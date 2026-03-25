public static class Window
  {
   public static int widthPx = 1280;
   public static int heightPx = 720;
   public static int windowWidth = widthPx / 2;
   public static int windowHeight = heightPx / 2;
   public static int top = windowHeight;
   public static int bottom = -windowHeight;
   public static int left = -windowWidth;
   public static int right = windowWidth;
   public static float eyeZ = -(heightPx/2.0) / tan(PI*30.0 / 180.0);
  }

Walker w;

void setup()
  {
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    
    w = new Walker();
  }

void draw()
  {
    background(255);
    
    w.moveAndBounce();
    w.render();
  }
