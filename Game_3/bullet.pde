class Bullet {
  float bulletX;
  float bulletY;
  float bulletSpeed;
  float gap;
  float bulletLength;
  boolean display;

  Bullet(boolean display) {
    gap = 60;
    this.display = display;
    bulletY= height - gap;
    bulletSpeed = 7;
    bulletLength = 8;
  }


  void drawBullet() {
    //Draw bullet
    
    rectMode(CENTER);
    fill(255);
    rect(bulletX, bulletY, bulletLength, bulletLength);
    
  }
  
  void setBulletX(float x){
    bulletX = x;
  }
  
  void setDisplay(boolean x){
    display = x;
  }
  
  boolean getDisplay(){
    return display;
  }
  
  float getBulletX() {
    return bulletX;
  }
  //Get BulletY
  float getBulletY() {
    return bulletY;
  }

  void moveBullet() {
    // Move the bullet
    bulletY -= bulletSpeed;
  }
  
  //Checking if bullet hits the top
  boolean hitTop(){
    if(bulletY <= 0){
      return true;
    }else{
      return false;
    }
  }

  void bulletReset() {
    bulletY = height-gap;
    bulletLength = 10;
    display = false;
  }

  void bulletHit() {
    bulletLength = 0;
    bulletReset();
  }
}
