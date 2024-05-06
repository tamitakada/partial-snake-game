# Partial Snake Game Implementation

## How to run

1. Open Terminal on your computer
2. Run `git clone git@github.com:tamitakada/partial-snake-game.git`
3. In Processing, go to File > Open... and navigate to the `partial-snake-game/SnakeGame` folder
4. Open `SnakeGame.pde` and run from Processing

## What's left

This is only a partial implementation, so some parts won't work as expected:
* No bounds check (the snake is allowed to go past the borders and hit itself)
* "Folding" if you change directions too quickly (the nodes don't wait for a full gap to open before moving, leading to what looks like the snake shrinking or folding)

## Notes

I left comments in the `Snake` file to explain how I got some things to work. The full game was more intensive than I realized! I definitely underestimated it as a project.
