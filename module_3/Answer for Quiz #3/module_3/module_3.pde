void setup()
{
 size(1020, 720, P3D);
 camera(0, 0, -(height / 2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
 background(255);
}

void draw()
{
 float gaussian = randomGaussian();
 
 float standardDeviation = 300;
 float mean = 0;
 
 float x = standardDeviation * gaussian + mean;
 
 // y is random from top to bottom
 float y = random(-1020, height);
 
 // size using gaussian (different values)
 float size = randomGaussian() * 10 + 20;
 
 noStroke();
 
 fill(random(255), random(255), random(255), random(10 ,100));
 circle(x, y, size);
}
