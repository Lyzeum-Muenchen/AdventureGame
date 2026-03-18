public class Terrain {
  int x;
  int y;
  int type;

  public Terrain() {
    this.x = int(random(-2000, 2000));
    this.y = int(random(-2000, 2000));
    this.type = int(random(0, 3));
  }

  void drawTerrain() {
    if (type == 0) {
      image(tree, displayX(x), displayY(y), 128, 128);
    } else if (type == 1) {
      image(rubble, displayX(x), displayY(y), 32, 32);
    } else if (type == 2) {
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
}
