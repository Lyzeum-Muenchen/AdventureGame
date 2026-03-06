PImage spielerBild;
PImage tree;
PImage rubble;
PImage monster;
PImage fire;

Monster otto;
Monster paul;
Monster leopold;
Monster kevin;

int spielerX = 0;
int spielerY = 0;
int seeX = 200;
int seeY = 150;

int feuerballX = 0;
int feuerballY = 0;
int feuerballVX = 0;
int feuerballVY = 0;
float feuerballWinkel = 0;

boolean feuerballActive = false;

int monsterX = 200;
int monsterY = -200;

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
  monster = loadImage("zombie.png");
  fire = loadImage("fireball.png");
  
  paul = new Monster(500, 500);
  otto = new Monster(-500, 500);
  kevin = new Monster();
  leopold = new Monster();
}

void draw(){
  background(20, 190, 50);
  fill(#5446D8);
  for(int i = 0; i < 100; i++){
    drawTerrain(terrainX[i], terrainY[i], terrainType[i]);
  }
  fill(50);
  
  drawFeuerball();
  drawPlayer();
  drawMonster();
  
  moveMonster();
  
  otto.drawMonster();
  otto.moveMonster();
  paul.drawMonster();
  paul.moveMonster();
  leopold.drawMonster();
  leopold.moveMonster();
  kevin.drawMonster();
  kevin.moveMonster();
}
void drawFeuerball(){
  if(feuerballActive){
    fill(200, 0, 0);
    noStroke();
    
    pushMatrix();
    translate(displayX(feuerballX), displayY(feuerballY));
    rotate(feuerballWinkel);
    image(fire, 0, 0, 64, 64);
    popMatrix();
    
    feuerballX += feuerballVX;
    feuerballY += feuerballVY;
  }
}
void fireFeuerball(){
  feuerballActive = true;
  
  feuerballX = spielerX;
  feuerballY = spielerY;
  
  float dx = float(mouseX - width/2);
  float dy = float(mouseY - height/2);
  
  float l = sqrt(dx*dx + dy*dy);
  feuerballVX = int(10*dx/l);
  feuerballVY = int(10*dy/l);
  
  if(dx < 0){
    feuerballWinkel = PI + atan(dy/dx);
  }
  else{
    feuerballWinkel = atan(dy/dx);
  }
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
    fireFeuerball();
  }
}

void drawPlayer(){
  image(spielerBild, width/2, height/2, 128, 128);
}

void drawMonster() {
  image(monster, displayX(monsterX), displayY(monsterY), 128, 128);
}

void moveMonster() {
  float dx = float(spielerX-monsterX);
  float dy = float(spielerY-monsterY);
  
  float c = sqrt(dx*dx + dy*dy);
  
  float rx = dx/c;
  float ry = dy/c;
  
  monsterX += int(rx*2);
  monsterY += int(ry*2);
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
