class Bullet extends Floater
{
	public Bullet(Spaceship theShip)
	{
		myCenterX = bob.getX();
		myCenterY = bob.getY();
		myPointDirection = bob.getPointDirection();
		double dRadians =myPointDirection*(Math.PI/180);
		myDirectionX = 5 * Math.cos(dRadians) + bob.getDirectionX();
		myDirectionY = 5 * Math.sin(dRadians) + bob.getDirectionY();
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
  public void show()
  {
		fill(70, 248, 255);
		noStroke();
		ellipse((int)myCenterX, (int)myCenterY, 7, 7);
  }
  public void move()
  {
    myCenterX+=myDirectionX;
    myCenterY+=myDirectionY;
    
    if(myCenterX < 0)
      shell.remove(bob);
  }
}