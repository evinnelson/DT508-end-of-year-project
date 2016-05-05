class Platform
{
 float x,y,w,h;

Platform(float startX, float startY)
{
 x = startX;
 y = startY;
 w = 200;
 h = 20;
}

void display()
{
 fill(255);
rect(x, y, w, h); 
}
}
