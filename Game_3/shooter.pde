class shooter {
  float shooterCenterx;
  float shooterCentery;
  float gap;
  int bulletX;
  int bulletY;
  int bulletSpeed;


  shooter() {
   
    gap = 60;
    shooterCentery = height - gap;
    
   
  }

  void drawShooter() {
     shooterCenterx = mouseX;
    

    fill(0);

    //Draw Shooter
    beginShape();
    vertex(shooterCenterx, shooterCentery-30);
    vertex(shooterCenterx-10, shooterCentery);
    vertex(shooterCenterx-10, shooterCentery+20);
    vertex(shooterCenterx-15, shooterCentery+20);
    vertex(shooterCenterx-20, shooterCentery+30);
    vertex(shooterCenterx-15, shooterCentery+25);
    vertex(shooterCenterx+15, shooterCentery+25);
    vertex(shooterCenterx+20, shooterCentery+30);
    vertex(shooterCenterx+15, shooterCentery+20);
    vertex(shooterCenterx+10, shooterCentery+20);
    vertex(shooterCenterx+10, shooterCentery+20);
    vertex(shooterCenterx+10, shooterCentery);
    endShape();
    
    shooterCenterx = constrain(shooterCenterx, 0, width);
  }



float getShooterX(){
    return shooterCenterx;
  }
 
}
