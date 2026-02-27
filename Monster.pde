public class Monster {
  int x;
  int y;
  PImage img;
  
  public Monster(int x, int y){
    this.x = x;
    this.y = y;
    this.img = monster;
  }
  
  public void draw(){
    image(img, displayX(x), displayY(y), 128, 128);
  }
  public void move(){
    float dx = float(spielerX-this.x);
    float dy = float(spielerY-this.y);
    
    float c = sqrt(dx*dx + dy*dy);
    
    float rx = dx/c;
    float ry = dy/c;
    
    this.x += int(rx*2);
    this.y += int(ry*2);
  }
  void turn(){
    this.draw();
    this.move();
  }
}
