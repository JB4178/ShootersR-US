class Doom{
 float boulderY ;
 float boulderDiam;
 float boulderX;
 float fallSpeed;
  
  Doom(){
    boulderY = 0;
    boulderDiam = 30;
    boulderX = random(boulderDiam, width- boulderDiam);
    fallSpeed = 0.5;
  }
  
  void drawBoulder(){
    fill(#A20B0B);
    circle( boulderX, boulderY, boulderDiam);   
  }
  //Move boulder
  void moveBoulder(){
    boulderY += fallSpeed;
  }
  
  //When boulder is hit
  void destroyBoulder(){
    boulderDiam = 0;
    reset();
  }
  
  //Reset
  void reset(){
    boulderDiam = random (30,50);      
    boulderY = 0;
    boulderX = random(0, width);
  }
  
  float getboulderY(){
    return boulderY;  
  }
  
  float getboulderX(){
    return boulderX;
  }
  
  float getboulderDiam(){
    return boulderDiam;
  }
  
  //Increase speed
  void increaseSpeed(){
    fallSpeed+= 0.5;
    fallSpeed  = constrain(fallSpeed, 1, 2);
  }
  

  
  boolean boulderEscape(){
    if (boulderY >= height){
      return true;
    }else{
      return false;
    }
  }
}
