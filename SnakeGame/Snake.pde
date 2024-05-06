class Snake {
  
  private ArrayList<Node> nodes;
  private Direction dir;
  
  private boolean pendingGrow;
  
  Snake() {
    pendingGrow = false;
    dir = Direction.UP;
    nodes = new ArrayList<Node>();
    nodes.add(new Node(100, 100));
  }
  
  int getLength() {
    return nodes.size();
  }
  
  float[] getHeadCoordinates() {
    float[] coords = {nodes.get(0).x, nodes.get(0).y};
    return coords;
  }
  
  void grow() {
    /*
      This was actually a pretty non-trivial function.
      To know where to add the final node, you have to know what
      direction the last part of the snake is going in. At that point,
      I thought it was best to just tack it onto move() instead of 
      copy/pasting the whole node loop into grow(). Hence the pendingGrow
      flag.
    */
    
    pendingGrow = true;
  }
  
  void display() {
    for (int i = 0; i < nodes.size(); i++) {
      nodes.get(i).display(); 
    }
  }
  
  void move() {
    // The first node should move in the snake's overall direction
    nodes.get(0).move(dir);
    
    /* 
      The direction of different parts of the snake changes depending on
      the section of the snake. "current" keeps track of which direction
      the current section of the snake that we're looking at at a certain
      point in the for loop is going in.
      
      This is important because the movement of each node depends only on 
      the previous node, and it doesn't matter what the rest of the snake
      is doing.
    */
    Direction current = dir;
    for (int i = 1; i < nodes.size(); i++) {
      
      // If you're moving vertically and the x's don't align
      if ((current == Direction.UP || current == Direction.DOWN) && 
        (nodes.get(i - 1).x != nodes.get(i).x)) {
        
        if (nodes.get(i - 1).x < nodes.get(i).x) {
          // If the previous node is further left, then this node
          // needs to "catch up" by going left.
          current = Direction.LEFT;
        }
        else current = Direction.RIGHT;
        nodes.get(i).move(current);
        
      }
      
      // If you're moving horizontally and the y's don't align
      else if ((current == Direction.RIGHT || current == Direction.LEFT) &&
        (nodes.get(i - 1).y != nodes.get(i).y)) {
          
        if (nodes.get(i - 1).y < nodes.get(i).y) {
          // If the previous node is further up, then this node
          // needs to "catch up" by going up.
          current = Direction.UP;
        }
        else current = Direction.DOWN;
        nodes.get(i).move(current);
          
      }
      
      // Otherwise, everything aligns on the right axis
      else {
        nodes.get(i).move(current);
      }
    }
    
    if (pendingGrow) { // see grow() for notes
      float newX = 0;
      float newY = 0;
      switch (current) {
        case UP:
          newX = nodes.get(nodes.size() - 1).x;
          newY = nodes.get(nodes.size() - 1).y + 50;
          break;
        case DOWN:
          newX = nodes.get(nodes.size() - 1).x;
          newY = nodes.get(nodes.size() - 1).y - 50;
          break;
        case RIGHT:
          newX = nodes.get(nodes.size() - 1).x - 50;
          newY = nodes.get(nodes.size() - 1).y;
          break;
        case LEFT:
          newX = nodes.get(nodes.size() - 1).x;
          newY = nodes.get(nodes.size() - 1).y + 50;
          break;
      }
      nodes.add(new Node(newX, newY));
      pendingGrow = false;
    }
  }
  
}
