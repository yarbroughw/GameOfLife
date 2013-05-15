class Cell 
{
  float x, y;
  float w, h;
  boolean currentAlive;
  boolean newAlive;

  Cell(float x_, float y_, float w_, float h_, boolean alive_) 
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    currentAlive = alive_;
    newAlive = alive_;
  }

  void display() 
  {
    if (w == 1) 
    {
      noStroke();
    }
    else 
    {
      stroke(0);
    }
    
    if (currentAlive == true) 
    {
      fill(190,255,190);
    } 
    else 
    {
      fill(50);
    }   
    rect(x, y, w, h);
  }

  void toggle() 
  {
    currentAlive = !currentAlive;
    newAlive = !newAlive;
  }

  void allDead() 
  {
    currentAlive = false;
    newAlive = false;
  }
}

