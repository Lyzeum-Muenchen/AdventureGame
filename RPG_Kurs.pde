PImage spielerBild;
int spielerX = 0;
int spielerY = 0;
int seeX = 200;
int seeY = 150;
int feuerballX = 0;
int feuerballY = 0;

void setup(){
  fullScreen();
  smooth(0);
  imageMode(CENTER);
  spielerBild = loadImage("LittleWizard.png");
}

void draw(){
  background(20, 190, 50);
  fill(#5446D8);
  circle(displayX(seeX), displayY(seeY), 200);
  fill(50);
  circle(displayX(500), displayY(-100), 50);
  circle(displayX(-600), displayY(-200), 50);
  fill(200, 0, 0);
  circle(displayX(feuerballX), displayY(feuerballY), 20);
  feuerballX += 10;
  drawPlayer();
}

void keyPressed(){
  if(key == 'w'){
    spielerY = spielerY - 5;
    // oder spielerY -= 5;
  }
  if(key == 's'){
    spielerY = spielerY +5;
  }
  if(key == 'a'){
    spielerX = spielerX -5;
  }
  if(key == 'd'){
    spielerX = spielerX + 5;
  }
  if(key == 'f'){
    feuerballX = spielerX;
    feuerballY = spielerY;
  }
}

void drawPlayer(){
  image(spielerBild, width/2, height/2, 128, 128);
}

int displayX(int objektX){
  int dx = objektX-spielerX;
  return width/2+dx;
}
int displayY(int objektY){
  int dy = objektY-spielerY;
  return height/2+dy;
}
