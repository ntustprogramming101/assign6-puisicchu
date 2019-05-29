class Dinosaur extends Enemy{
	// Requirement #4: Complete Dinosaur Class
  float speed = 2f;
	final float TRIGGERED_SPEED_MULTIPLIER = 5;

Dinosaur (float x, float y){
  super(x, y);
}
  
  void checkCollision(Player player){

    if(isHit(x, y, w, h, player.x, player.y, player.w, player.h)){

      player.hurt();

    }
  }
    
  void display(){
    pushMatrix();
    if(speed > 0){
      scale(1,1);
      image(dinosaur, 0, 0, w, h);
  }else{
    scale(-1,1);
    image(dinosaur, 0, 0, -w, h);
  }
  popMatrix();
  }
  
  void update(){
   float currentSpeed = speed;
    
    x += currentSpeed;
    
    if(x<0 || x > width-w) { 
    speed *= -1; }
        
    if(player.y == y){
    currentSpeed *= TRIGGERED_SPEED_MULTIPLIER;
    }
    
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
}
