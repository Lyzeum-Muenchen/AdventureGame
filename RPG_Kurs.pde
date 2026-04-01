import java.util.HashSet;

PImage spielerBild;
PImage tree;
PImage rubble;
PImage fire;

HashSet<Character> pressedKeys = new HashSet<Character>();
ArrayList<Monster> monsters = new ArrayList<Monster>();

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

int spawnCooldown = 50;
boolean gameOver = false;

Terrain[] terrains = new Terrain[100];
void setup(){
  fullScreen();
  
  smooth(0);
  imageMode(CENTER);
  spielerBild = loadImage("LittleWizard.png");
  tree = loadImage("tree.png");
  rubble = loadImage("rubble.png");
  fire = loadImage("fireball.png");
  
  startGame();
}

void startGame() {
  for(int i= 0; i < 100; i++){
    terrains[i] = new Terrain();
  }
  monsters = new ArrayList<Monster>();
  monsters.add(new Monster(500, 500));
  monsters.add(new Monster(-500, 500));
  monsters.add(new Monster());
  monsters.add(new Monster());
  feuerballActive = false;
  spielerX = 0;
  spielerY = 0;
  spawnCooldown = 50;
  gameOver = false;
}

void draw(){
  handleKeys();
  if (gameOver) {
    background(0);
    fill(200, 0, 0);
    textAlign(CENTER);
    PFont arialBold = createFont("Arial Bold", 128);
    PFont arial = createFont("Arial", 60);
    textFont(arialBold);
    text("GAME OVER", width/2, height/2);
    textFont(arial);
    fill(200);
    text("Press Any Key to Restart", width/2, height/2 + 100);
    
  } else {
    background(20, 190, 50);
    fill(#5446D8);
    for(int i = 0; i < 100; i++){
      terrains[i].drawTerrain();
    }
    fill(50);
    
    drawFeuerball();
    drawPlayer();
    
    for(int i = 0; i<monsters.size(); i++){
      monsters.get(i).act();
    }
    
    spawnMonster();
  }
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
  pressedKeys.add(key);
}
void keyReleased(){
  pressedKeys.remove(key);
}

void handleKeys(){
  if (gameOver && !pressedKeys.isEmpty()) {
    startGame();
  }
  if(pressedKeys.contains('w')){
    spielerY = spielerY - 5;
    // oder spielerY -= 5;
  }
  if(pressedKeys.contains('s')){
    spielerY = spielerY +5;
  }
  if(pressedKeys.contains('a')){
    spielerX = spielerX -5;
  }
  if(pressedKeys.contains('d')){
    spielerX = spielerX + 5;
  }
  if(pressedKeys.contains('f')){
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

void spawnMonster(){
  if (spawnCooldown > 0){
    spawnCooldown--;
  }else {
    monsters.add(new Monster());
    spawnCooldown = 50;
  }
}
