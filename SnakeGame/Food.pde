class Food {
  
  private float x;
  private float y;
  
  Food(float x, float y) {
    this.x = x; // Side note: You only need "this" if the variable names overlap
    this.y = y;
  }
  
  void display() {
    fill(#EF626C);
    rect(x, y, 50, 50); 
  }
  
  boolean didContact(float sx, float sy, float size) {
    // I realized this is much easier for 2 rectangles...
    return (x <= (sx + size)) && (x + 50 >= sx) && (y <= (sy + size)) && (y + 50 >= sy);
  }
  
}
