class Walker
{
 float x;
 float y;
 
 void render()
 {
   noStroke(); // remove outline
   fill(random(255), random(255), random(255), random(50,100));
   circle(x, y, 30);
 }
 
 // randomWalk function
 void randomWalk()
 {
   int rng = int(random(8));
   
   if (rng == 0)
   {
     y+=5;
   }
   else if (rng == 1)
   {
     y-=5;
   }
   else if (rng == 2)
   {
     x+=5;
   }
   else if (rng == 3)
   {
     x-=5;
   }
   else if (rng == 4)
   {
     x+=5;
     y+=5;
   }
   else if (rng == 5)
   {
     x-=5;
     y+=5;
   }
   else if (rng == 6)
   {
     x+=5;
     y-=5;
   }
   else if (rng == 7)
   {
     x-=5;
     y-=5;
   }
 }
 
 // randomWalkBiased function
 void randomWalkBiased()
 {
   float rng = random(1);
   
   if (rng < 0.4)
   {
     x+=5;
   }
   else if (rng < 0.6)
   {
     x-=5;
   }
   else if (rng < 0.8)
   {
     y-=5;
   }
   else
   {
     y+=5;
   }
 }
}
