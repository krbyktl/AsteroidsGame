Spaceship bob = new Spaceship();
Healthbar life = new Healthbar();
Star[] night = new Star[100];
ArrayList <Asteroid> sue = new ArrayList <Asteroid>();
ArrayList <Bullet> shell = new ArrayList <Bullet>();
public void setup() 
{
  size(600, 600);
  for(int i = 0; i < night.length; i++)
  {
  	night[i] = new Star();
  }
  for(int j = 0; j < 10; j++)
  sue.add(j, new Asteroid());
}
public void draw() 
{
  background(0);
  for(int i = 0; i < night.length; i++)
  {
  	night[i].sketch();
  }
  bob.move();
  bob.show();
  life.show();
  life.move();
    for(int l = 0; l < shell.size(); l++)
  {
     shell.get(l).show();
     shell.get(l).move();
  }
  for(int j = 0; j < sue.size(); j++)
  {
    sue.get(j).show();
    sue.get(j).move();
  if(dist(bob.getX(), bob.getY(), sue.get(j).getX(), sue.get(j).getY())<20)
  {
    Asteroid rob = sue.remove(j);
    int a = rob.getX();
    int b = rob.getY();
    sue.add(new Debris(a, b));
  }
  for(int k = 0; k <shell.size(); k++)
  {
     if(dist(shell.get(k).getX(), shell.get(k).getY(), sue.get(j).getX(), sue.get(j).getY()) < 30)
     {
       sue.remove(j);
       shell.remove(k);
       break;
     }
  }
  }
  }
public void keyPressed()
{
  //Rotate clockwise
  if(key == 'a')
  {
    bob.rotate(5);
  }
  //Rotate counterclockwise
  if(key == 'd')
  {
  	bob.rotate(-5);
  }
  //Accelerate
  if(key == 'w')
  {
  	bob.accelerate(.5);
  }
  //Deccelerate
  if(key == 's')
  {
  	bob.accelerate(-.5);
  }
  //Hyperspace
  if(key == 'q')
  {
  	bob.setPointDirection((int)(Math.random()*360));
  	bob.setX((int)(Math.random()*600));
  	bob.setY((int)(Math.random()*600));
  }
  //Shoot
  if(key == 'e')
  {
    shell.add(new Bullet(bob));
  }
}
class Spaceship extends Floater  
{   
  public Spaceship()
  {
  	corners = 8;
  	xCorners = new int[corners];
  	yCorners = new int[corners];
  	xCorners[0] = 25;
  	yCorners[0] = 0;
  	xCorners[1] = 0;
  	yCorners[1] = 10;
  	xCorners[2] = -3;
  	yCorners[2] = 3;
  	xCorners[3] = -8;
  	yCorners[3] = 4;
  	xCorners[4] = -6;
  	yCorners[4] = 0;
  	xCorners[5] = -8;
  	yCorners[5] = -4;
  	xCorners[6] = -3;
  	yCorners[6] = -3;
  	xCorners[7] = 0;
  	yCorners[7] = -10;
    myColor = color(181, 238, 255);
    myCenterX = 300;
    myCenterY = 300;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  public void setX(int x) {myCenterX = x;}  
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;} 
  public int getY() {return (int)myCenterY;}   
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;} 
  public void setDirectionY(double y) {myDirectionY = y;}  
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;} 
}
class Asteroid extends Floater
{
	private int rotSpeed;
	public Asteroid()
	{
		corners = 8;
  		xCorners = new int[corners];
  		yCorners = new int[corners];
  		xCorners[0] = 20;
 	 	yCorners[0] = 0;
	  	xCorners[1] = 8;
	  	yCorners[1] = 15;
  		xCorners[2] = 0;
  		yCorners[2] = 13;
  		xCorners[3] = -15;
  		yCorners[3] = 15;
 	 	xCorners[4] = -20;
  		yCorners[4] = 0;
	  	xCorners[5] = -13;
 	 	yCorners[5] = -15;
 	 	xCorners[6] = 0;
 	 	yCorners[6] = -12;
 	 	xCorners[7] = 15;
 	 	yCorners[7] = -15;
		myColor = color(249, 8, 8);
	   	myCenterX = (int)(Math.random()*600);
  		myCenterY = (int)(Math.random()*600);
	   	if(Math.random() < .5)
	   		myDirectionX = 1;
	   	else 
	   		myDirectionX = -1;
  		if(Math.random() < .5)
  			myDirectionY = 1;
  		else
  			myDirectionY = -1;
	    myPointDirection = 0;
	    if(Math.random() < .5)
	    	rotSpeed = 1;
	    else
	    	rotSpeed = -1;
	}
  public void setX(int x) {myCenterX = x;}  
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;} 
  public int getY() {return (int)myCenterY;}   
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;} 
  public void setDirectionY(double y) {myDirectionY = y;}  
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;} 
  public void move()
  {
  	rotate(rotSpeed);
  	super.move();
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
}
class Star
{
	int corex, corey;
	public Star()
	{
		corex = (int)(Math.random()*600);
		corey = (int)(Math.random()*600);
	}
	public void sketch()
	{
          noStroke();
		fill(244, 80, 0);
          ellipse(corex, corey, (int)(Math.random()*4)+1, (int)(Math.random()*4)+1);
	}
}
class Debris extends Asteroid
{
  double dX, dY;
  public Debris(int dX, int dY)
  {
    setX(dX);
    setY(dY);
  }
}
class Healthbar
{
  double fX, fY;
  public Healthbar()
  {
    fX = 280;
    fY = 325;
  }
  public void show()
  {
    stroke(150);
    fill(72, 255, 0);
    rect((int)fX, (int)fY, 30, 4);
  }
  public void move()
  {
    fX = bob.getX()-20;
    fY = bob.getY()+25;
  }
}