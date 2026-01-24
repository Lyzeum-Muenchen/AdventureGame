PImage spielerBild;
PImage tree;
PImage rubble;
int spielerX = 0;
int spielerY = 0;
int seeX = 200;
int seeY = 150;
int feuerballX = 0;
int feuerballY = 0;

int[] terrainX = new int[100];
int[] terrainY = new int[100];
int[] terrainType = new int[100];
void setup(){
  fullScreen();
  for(int i= 0; i < 100; i++){
    terrainX[i] = int(random(-1000, 1000));
    terrainY[i] = int(random(-1000, 1000));
    terrainType[i] = int(random(0, 3));
  }
  smooth(0);
  imageMode(CENTER);
  spielerBild = loadImage("LittleWizard.png");
  tree = loadImage("tree.png");
  rubble = loadImage("rubble.png");
}

void draw(){
  background(20, 190, 50);
  fill(#5446D8);
  for(int i = 0; i < 100; i++){
    drawTerrain(terrainX[i], terrainY[i], terrainType[i]);
  }
  fill(50);
  
  fill(200, 0, 0);
  noStroke();
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
void drawTerrain(int x, int y, int type){
  if(type == 0){
    image(tree, displayX(x), displayY(y), 128, 128);
  }
  else if (type == 1){
    image(rubble, displayX(x), displayY(y), 32, 32);
  }
  else if(type == 2){
    stroke(0, 250, 0);
    strokeWeight(5);
    line(displayX(x), displayY(y), 
      displayX(x)+5, displayY(y)-20);
    line(displayX(x)+10, displayY(y), 
      displayX(x)+10, displayY(y)-20);
    line(displayX(x)-10, displayY(y), 
      displayX(x)-5, displayY(y)-20);
  }
}
