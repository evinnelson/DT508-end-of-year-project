class Player1
 {
  float x, y, w, h;
 float speedX, speedY;
 boolean connected;
 float g;

Player1()
{
 x = 568;
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
 if (left){
  speedX = -8;
 } 
 if (right){
  speedX = 8; 
 }
   if (left == false && right == false){
     speedX = 0;
   }
   if (up && connected == true){
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
    x = 568;
    speedY = 0; 
    redpoints = redpoints +1;
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
 fill(0, 0, 255);
 rect(x, y, w, h); 
}
 }
