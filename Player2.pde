class Player2
 {
  float x, y, w, h;
 float speedX, speedY;
 boolean connected;
 float g;

Player2()
{
 x = 400;
 y = 570;
 w = 32;
 h = 32;

speedX = 0;
speedY = 0;

connected = false;
g = 0.6;
}
void land(float destY)
{
 speedY = 0;
 connected = true; 
 y = destY-h;
}
void update()

{
  if(canMove){
 if (left1){
  speedX = -8;
 } 
 if (right1){
  speedX = 8; 
 }
   if (left1 == false && right1 == false){
     speedX = 0;
   }
   if (up1 && connected == true){
     speedY = -15;
     connected = false;
   }
   
   if (connected == false)
   {
    speedY += g; 
   }
   if (y > height)
   {
    y = 648;
    x = 400;
    speedY = 0; 
    bluepoints = bluepoints +1;


   }
   if (x > width)
   {
    x = 0; 
   }
   if (x < -32)
   {
    x = 1000; 
   }
   x += speedX;
   y += speedY;
  }
}
void display()
{
 fill(255, 0, 0);
 rect(x, y, w, h); 
}
 }
