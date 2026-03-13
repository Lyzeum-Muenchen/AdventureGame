public class Monster {
  int x;
  int y;
  PImage img;
  boolean alive;

  public Monster(int x, int y) {
    this.x = x;
    this.y = y;
    this.alive = true;
    this.img = loadImage("zombie.png");
  }

  public Monster() {
    this.x = int(random(-1000, 1000));
    this.y = int(random(-1000, 1000));
    this.alive = true;
    this.img = loadImage("zombie.png");
  }
  void drawMonster() {
    if (this.alive) {
      image(this.img,
        displayX(this.x),
        displayY(this.y),
        128, 128);
    }
  }
  void moveMonster() {
    float dx = float(spielerX-this.x);
    float dy = float(spielerY-this.y);

    float c = sqrt(dx*dx + dy*dy);

    float rx = dx/c;
    float ry = dy/c;

    this.x += int(rx*2);
    this.y += int(ry*2);
  }

  void checkDead() {
    float dx = float(feuerballX - this.x);
    float dy = float(feuerballY - this.y);
    float l = sqrt(dx*dx + dy*dy);
    if (l < 30){
      alive = false;
    }
  }
  void act(){
    this.checkDead();
    this.drawMonster();
    this.moveMonster();
  }
}
