class Robot extends Enemy{
  
  float speed = 2f;
  
	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;  
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  int cooldown = LASER_COOLDOWN;
  Laser laser;
    
  Robot(float x, float y){
    super(x,y);
    laser = new Laser();
  }
  
  void checkCollision(Player player){
    if(isHit(x, y, w, h, player.x, player.y, player.w, player.h)) {
      player.hurt();
    }    
    laser.checkCollision(player);
  }

  void display(){
    int direction;
    if(speed>0){
      direction=RIGHT;
    }else{
      direction=LEFT;
    }
    pushMatrix();
    translate(x,y);
    if(direction == RIGHT){
      scale(1,1);
      image(robot, 0,0,w,h);
    } else {
      scale(-1,1);
      image(robot,-w,0,w,h);
    }
    popMatrix();
    
    laser.display();
  }
  
  
  void update(){
    
    boolean updateX = (speed>=0 && player.x+(w/2) > x+HAND_OFFSET_X_FORWARD) || (speed<=0 && player.x+(w/2) < x+HAND_OFFSET_X_BACKWARD);
    boolean updateY = (y/SOIL_SIZE - player.row <= PLAYER_DETECT_RANGE_ROW && y/SOIL_SIZE - player.row >=0) || (player.row - y/SOIL_SIZE <= PLAYER_DETECT_RANGE_ROW && player.row - y/SOIL_SIZE >=0);
    
    float currentSpeed = speed;
    if(updateX == false || updateY == false){
      x+=currentSpeed;
      if(x<0|| x>width-w){ 
        speed *= -1; 
      }
    }
    else{ 
      if(cooldown == LASER_COOLDOWN){
        if(currentSpeed>0){
          laser.fire(x+HAND_OFFSET_X_FORWARD,y+HAND_OFFSET_Y,player.x+w/2,player.y+h/2);
        }
        if(currentSpeed<0){
          laser.fire(x+HAND_OFFSET_X_BACKWARD,y+HAND_OFFSET_Y,player.x+w/2,player.y+h/2);
        }
        currentSpeed = 0;
      }
      cooldown --;
      if(cooldown <= 0){
        cooldown = LASER_COOLDOWN;
      }
      currentSpeed = speed;
    }
    laser.update();
    
  }
  
}
