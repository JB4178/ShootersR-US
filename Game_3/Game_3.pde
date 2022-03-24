Doom[] dooms = new Doom[3]; //<>//
shooter[] myShooters = new shooter[10];
Bullet[] Bullets = new Bullet[7];
int score;
int PLAY_STATE = 1;
int INITIAL_STATE = 2;
int state = INITIAL_STATE;
color bg;

void setup() {

  score = 0;
  //Set size
  size(500, 600);
  for (int i = 0; i<= dooms.length-1; i++) {
    dooms[i] = new Doom();
  }
  for (int i = 0; i<= Bullets.length-1; i++) {
    Bullets[i] = new Bullet(false);
  }
  for (int i = 0; i<= dooms.length-1; i++) {
  }
  for (int i = 0; i<= myShooters.length-1; i++) {
    myShooters[i] = new shooter();
  }
}

void draw() {
  //Background
  background(bg);
  if (state == INITIAL_STATE) {
    bg =#2C2B89;
    //Initial screen
    fill(0);
    textSize(35);
    textAlign(CENTER, CENTER);
    //Welcome Sign
    text("Welcome to Classic Catch", width/2, 2*height/11 );

    //Set RectMode to CORNER
    rectMode(CENTER);
    //First Button
    fill(0);
    rect(width/2, 2*height/5, width/2, height/6); 
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Play Game", width/2, 2*height/5);

    //Second button
    fill(0);
    rect(width/2, 3*height/5, width/2, height/6); 
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Exit", width/2, 3*height/5);
    
    //Instructions
    fill(0);
    textSize(20);
    textAlign(CENTER,CENTER);
    text("Shoot the boulders before they destroy the Earth ", width/2, 13*height/16);
    
     fill(0);
    textSize(15);
    textAlign(CENTER,CENTER);
    text("Use the 'f' button to shoot and use your mouse to move. ", width/2, 13*height/16+25); 
    
    fill(0);
    textSize(25);
    textAlign(CENTER,CENTER);
    text("Save Earth!! ", width/2, 13*height/16+50);
  } else if (state == PLAY_STATE) {
    bg =#06054D;

    for (int i= 0; i<height; i+=20) {
      for (int j = 0; j<width; j+=20) {
        fill(255, 50);
        noStroke();
        circle(j, i, 3);
       
      }
    }

    for (int i = 0; i<= dooms.length-1; i++) {
      for (int j =  0; j < Bullets.length; j++) {
        //Score Controls
        if (dooms[i].boulderEscape()) {
          score-= 1;
        } else if (Bullets[j].getDisplay() && dist(Bullets[j].getBulletX(), Bullets[j].getBulletY(), dooms[i].getboulderX(), dooms[i].getboulderY())
          <= dooms[i].getboulderDiam()) {
          score += 1;
        } 

        //Draw Shooter
        myShooters[0].drawShooter();
      
        //Draw Bullets with a loop
        if (Bullets[j].getDisplay()) {
          Bullets[j].drawBullet();
          Bullets[j].moveBullet();
        }



        //Draw Boulders with Loop
        dooms[i].drawBoulder();
        //Move Boulders
        dooms[i].moveBoulder();



        if (Bullets[j].getDisplay() && dist(Bullets[j].getBulletX(), Bullets[j].getBulletY(), dooms[i].getboulderX(), dooms[i].getboulderY())
          <= dooms[i].getboulderDiam()) {
          dooms[i].destroyBoulder();
          Bullets[i].bulletHit();
          dooms[i].increaseSpeed();
        } else if (dooms[i].boulderEscape()) {
          dooms[i].reset();
          score -= 1;
        }

        if (Bullets[j].hitTop()) {
          Bullets[j].bulletReset();
        }
      }
 
    //Score display
    textSize(25);
    textAlign(CENTER, CENTER);
    text("Score:"+score, 60, 30);
  }
}
}
void keyPressed() {
  if (state == PLAY_STATE) {
    if (key == 'f' || key == 'F' ) {
      for (int i = 0; i < Bullets.length; i++) {
        if (!Bullets[i].getDisplay()) {
          Bullets[i].setBulletX(myShooters[0].getShooterX());
          Bullets[i].setDisplay(true);
          break;
        }
      }
    }
  } 
}

void mousePressed() {
  if (state == INITIAL_STATE) {
    if ((mouseX >= width/4) && (mouseX <= 3*width/4) && (mouseY >= 2*height/5-height/12)
      && (mouseY<= (2*height/5+height/12))) {
      state = PLAY_STATE;
    }

    if ((mouseX >= width/4) && (mouseX <= 3*width/4) && (mouseY >= 3*height/5-height/12)
      && (mouseY<= (3*height/5+height/12))) {
      exit();
    }
  }
}
