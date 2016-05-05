Player1 p;
Player2 pp;


Platform [] platforms;
boolean left, right, up, left1, right1, up1, canMove;

color red = color(0, 0, 255);
color blue = color(255, 0, 0);

int  redpoints = 0;
int bluepoints = 0;
int winScore = 5;

void setup()
{
  size(1000, 700);
  background(0);
  smooth();
  p = new Player1();
  pp = new Player2();
  platforms = new Platform [9]; 
  platforms[0] = new Platform(0, 680);
  platforms[1] = new Platform(800, 680);
  platforms[2] = new Platform(400, 680);
  platforms[3] = new Platform(-100, 540);
  platforms[4] = new Platform(900, 540);
  platforms[5] = new Platform(400, 400);
  platforms[6] = new Platform(0, 300);
  platforms[7] = new Platform(800, 300);
  platforms[8] = new Platform(400, 150);

  canMove = true;
}

void draw()
{
  background(255);
  p.update();
  p.display();
  pp.update();
  pp.display();
  gameOver();
  textSize(32);
  fill(0);
  text("Red score:" + redpoints, 10, 25);
  text("Blue score:" + bluepoints, 10, 57); 




  for (int i = 0; i < platforms.length; i++)
  {
    platforms[i].display();
  }


  for (int i = 0; i < platforms.length; i++)
  {
    platforms[i].display();  
    if (rectangleCollision(p, platforms[i]))
    {
      p.land(platforms[i].y);
      break;
    } else
    {
      p.connected = false;
    }
  }

  for (int i = 0; i < platforms.length; i++)
  {
    platforms[i].display();  
    if (rectangleCollision(pp, platforms[i]))
    {
      pp.land(platforms[i].y);
      break;
    } else
    {
      pp.connected = false;
    }
  }
}

boolean rectangleCollision(Player1 r1, Platform r2)
{
  float distanceX = (r1.x + r1.w/2) - (r2.x + r2.w/2);
  float distanceY = (r1.y + r1.h/2) - (r2.y + r2.h/2);

  float combinedHalfW = r1.w/2 + r2.w/2;
  float combinedHalfH = r1.h/2 + r2.h/2;

  if (abs(distanceX) < combinedHalfW) {

    if (abs(distanceY) < combinedHalfH) {
      return true;
    }
  }
  return false;
}


boolean rectangleCollision(Player2 r1, Platform r2)
{
  float distanceX = (r1.x + r1.w/2) - (r2.x + r2.w/2);
  float distanceY = (r1.y + r1.h/2) - (r2.y + r2.h/2);

  float combinedHalfW = r1.w/2 + r2.w/2;
  float combinedHalfH = r1.h/2 + r2.h/2;

  if (abs(distanceX) < combinedHalfW) {

    if (abs(distanceY) < combinedHalfH) {
      return true;
    }
  }
  return false;
}


void gameOver()
{
  if (bluepoints == 0 && redpoints == 0)
  {
   canMove = true; 
  }
  if (redpoints >= winScore)    
  {
    gameOverScreen("Red wins", blue);
    canMove = false;
  }
  if (bluepoints >= winScore)
  {
    gameOverScreen("Blue wins", red);
    canMove = false;
  }
}

void gameOverScreen(String text, color c)
{
  fill(c);
  text("Game over", 400, 50);
  text(text, 412, 90);
  text("click to play again", 350, 120);


  if (mousePressed)
  {
    redpoints = 0;
    bluepoints = 0;
  }
}


void keyPressed()
{
  if (canMove) {
    switch (keyCode)
    {
    case 37:
      left = true;
      break;
    case 38:
      up = true;
      break;
    case 39:
      right = true;
      break;
    case 65:
      left1 = true;
      break;
    case 87:
      up1 = true;
      break;
    case 68:
      right1 = true;
      break;
    }
  }
}

void keyReleased()
{ 
  if (canMove) {
    switch (keyCode)
    {
    case 37:
      left = false;
      break;
    case 38:
      up = false;
      break;
    case 39:
      right = false;
      break;
    case 65:
      left1 = false;
      break;
    case 87:
      up1 = false;
      break;
    case 68:
      right1 = false;
      break;
    }
  }
}

