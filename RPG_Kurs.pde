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

int feuerballX = 0;
int feuerballY = 0;
int feuerballVX = 0;
int feuerballVY = 0;
float feuerballWinkel = 0;

boolean feuerballActive = false;


Terrain[] landscape = new Terrain[100];

void setup(){
  fullScreen();
  for(int i= 0; i < 100; i++){
    landscape[i] = new Terrain();
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
  
  for(int i = 0; i < 100; i++){
    landscape[i].drawTerrain();
  }
  
  
  drawFeuerball();
  drawPlayer();
  
  otto.turn();
  leopold.turn();
  kevin.turn();
  paul.turn();
  
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

int displayX(int objektX){
  int dx = objektX-spielerX;
  return width/2+dx;
}
int displayY(int objektY){
  int dy = objektY-spielerY;
  return height/2+dy;
}
