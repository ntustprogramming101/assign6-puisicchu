class Robot extends Enemy{
	// Requirement #5: Complete Dinosaur Class
float speed = 2f;
	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
Laser laser;

Robot(float x, Float y){
  super(x, y);
  laser = new Laser();
}

void checkCollision(Player player){

    if(isHit(x, y, w, h, player.x, player.y, player.w, player.h)) {player.hurt();}
    
    laser.checkCollision(player);
  }

  void display(){
    
    pushMatrix();
    translate(x,y);
    if(speed > 0){
      scale(1,1);
      image(robot, 0,0,w,h);
    } else {
      scale(-1,1);
      image(robot,-w,0,w,h);
    }
    popMatrix();
    
    laser.display();
  }
	// HINT: Player Detection in update()
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}
