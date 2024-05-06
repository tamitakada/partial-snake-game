class Node {
  
  public float x;
  public float y;
  
  Node(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    fill(#9DD572);
    rect(x, y, 50, 50); 
  }
  
  void move(Direction dir) {
    switch (dir) {
      case UP:
        y -= 5;
        break;
      case DOWN:
        y += 5;
        break;
      case RIGHT:
        x += 5;
        break;
      case LEFT:
        x -= 5;
        break;
    }
  }
  
}
