public class Terrain {
  int x;
  int y;
  int type;
  
  public Terrain(){
    this.x = int(random(-2000, 2000));
    this.y = int(random(-2000, 2000));
    this.type = int(random(0, 3))
  }
}
