class Bullet extends FLoater
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
	public void show ()
	{
		ellipse(myCenterX, myCenterY, 5, 5);
	}
}