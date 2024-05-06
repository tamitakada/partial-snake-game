import java.util.Random;


Random rng = new Random();

Snake snake = new Snake();
Food currentFood;

void setup() {
  size(500, 500);
  currentFood = new Food(rng.nextInt(width - 100) + 50, rng.nextInt(height - 100) + 50);
}

void draw() {
  background(#FFFFFF);
  snake.display();
  currentFood.display();
  if (frameCount % 5 == 0) {
    snake.move();
    float[] snakeCoords = snake.getHeadCoordinates();
    if (currentFood.didContact(snakeCoords[0], snakeCoords[1], 50)) {
      currentFood = new Food(
        rng.nextInt(width - 100) + 50, 
        rng.nextInt(height - 100) + 50
      );
      snake.grow();
    }
  }
}

void keyPressed() {
  if (keyCode == RIGHT && (snake.getLength() == 1 || snake.dir != Direction.LEFT)) {
    snake.dir = Direction.RIGHT;
  }
  else if (keyCode == LEFT && (snake.getLength() == 1 || snake.dir != Direction.RIGHT)) {
    snake.dir = Direction.LEFT;
  }
  else if (keyCode == UP && (snake.getLength() == 1 || snake.dir != Direction.DOWN)) {
    snake.dir = Direction.UP;
  }
  else if (keyCode == DOWN && (snake.getLength() == 1 || snake.dir != Direction.UP)) {
    snake.dir = Direction.DOWN;
  }
}
