Cell[][] grid;

int cols = 150;
int rows = 150;
int gridRuler = 5;
int gutter = cols/(gridRuler*3);
boolean running = false;

void setup() 
{ 
  background(100);
  //smooth();
  frameRate(15);
  size((cols*gridRuler)+(gutter*2), (rows*gridRuler)+(gutter*2));
  grid = new Cell[cols][rows];

  for (int i = 0; i < cols; i++) 
  {
    for (int j = 0; j < rows; j++) 
    {
      grid[i][j] = new Cell(i*gridRuler + gutter, j*gridRuler + gutter, gridRuler, gridRuler, false);
    }
  }
}

void draw() 
{ 

  if (running == true) 
  {

    for (int i = 0; i < cols; i++) 
    {
      for (int j = 0; j < rows; j++) 
      {
        run(i, j);
      }
    }
  }

  for (int i = 0; i < cols; i++) 
  {
    for (int j = 0; j < rows; j++) 
    {
      if (running == true)
      {
        grid[i][j].currentAlive = grid[i][j].newAlive;
      }
      grid[i][j].display();
    }
  }
}

void run(int y, int x) 
{
  int nb = 0;
  if (grid[(x+cols-1) % cols ][(y+rows-1) % rows ].currentAlive == true) 
  { 
    nb++;
  }
  if (grid[ x                ][(y+rows-1) % rows ].currentAlive == true) 
  { 
    nb++;
  }
  if (grid[(x+1)      % cols ][(y+rows-1) % rows ].currentAlive == true) 
  { 
    nb++;
  }

  //middle row
  if (grid[(x+cols-1) % cols ][ y                ].currentAlive == true) 
  { 
    nb++;
  }
  if (grid[(x+1)      % cols ][ y                ].currentAlive == true) 
  { 
    nb++;
  }

  //bottom row
  if (grid[(x+cols-1) % cols ][(y+1)      % rows ].currentAlive == true) 
  { 
    nb++;
  }
  if (grid[ x                ][(y+1)      % rows ].currentAlive == true) 
  { 
    nb++;
  }
  if (grid[(x+1)      % cols ][(y+1)      % rows ].currentAlive == true) 
  { 
    nb++;
  }

  if      ((grid[x][y].currentAlive == true) && (nb <  2)) 
  { 
    grid[x][y].newAlive = false;
  }   
  else if ((grid[x][y].currentAlive == true) && (nb >  3)) 
  { 
    grid[x][y].newAlive = false;
  }    
  else if ((grid[x][y].currentAlive == false) && (nb == 3)) 
  { 
    grid[x][y].newAlive = true;
  }    
  else 
  { 
    grid[x][y].newAlive = grid[x][y].currentAlive;
  }
}

void toggleCell() 
{
  if ((mouseX < (gutter + cols*gridRuler) && mouseX > gutter) &&
    (mouseY < (gutter + rows*gridRuler) && (mouseY > gutter))) 
  {
    int x = (mouseX - gutter)/gridRuler ;
    int y = (mouseY - gutter)/gridRuler ;
    Cell theCell = grid[x][y];
    theCell.toggle();
  }
}

void keyPressed () 
{
  if (key == ' ') 
  {
    for (int i = 0; i < cols; i++) 
    {
      for (int j = 0; j < rows; j++) 
      {
        grid[i][j].allDead();
      }
    }
  }

  if (keyCode == ENTER) 
  {
    running = !running;
  }

  if (keyCode == 'r' || keyCode == 'R') 
  {
    int rand;
    for (int i = 0; i < cols; i++) 
    {
      for (int j = 0; j < rows; j++) 
      {
        rand = (int)(random(1, 100) % 2);
        if (rand == 0) 
        {
          grid[i][j].currentAlive = true;
          grid[i][j].newAlive = true;
        }
        if (rand == 1) 
        {
          grid[i][j].currentAlive = false;
          grid[i][j].newAlive = false;
        }
      }
    }
  }
}

void mousePressed() 
{
  toggleCell();
}

void mouseDragged() 
{
  toggleCell();
}

