float mapSize = 0.8; //PERCENTAGE OF HEIGHT
float rows = 25; // ROWS AND COLUMNS IN MAP
int maxTails = 256; //Maximum of tails-squares
int speed = 5;//test af github
float tailSize = 0.8;
int difficulty;

int inhibitNr = 100;
int inhibitX[] = new int[inhibitNr];
int inhibitY[] = new int[inhibitNr];

float mapStartX, mapStartY, rowSize;
int tailX[] = new int[maxTails];
int tailY[] = new int[maxTails];


int playerSpeed = 1;
int biteX = int(random(0, rows));
int biteY = int(random(0, rows));

PImage pizza, grass;
int turnQueue[] = new int[speed];

PShape snake;
void setup() {
  size(1000, 1000);
  frameRate(60);

  snake = loadShape("pacman.svg");

  mapStartY = (height*(1-mapSize))/2;
  mapStartX = (width-(height*mapSize))/2;
  rowSize = (height*mapSize)/rows;

  //setting tails up
  for (int i = 0; i<maxTails; i++) {
    tailX[i] = -1;
    tailY[i] = -1;
  }
  for (int i = 0; i<speed; i++) {
    turnQueue[i] = 0;
  }
  grass = loadImage("grass.png");
  pizza = loadImage("pizza.png");
  grass.resize(width, height);
}

//Random Start Pos for Snake Head
int snakeX = int(rows/2);
int snakeY = int(rows/2);

int snakeXSpeed = 0;
int snakeYSpeed = 0;

//fps-tidtager
int frameNr = 0;

int tailsInUse = 10;

int score = 0;
void doClear() {
  tailsInUse = 10;
  frameNr = 0;
  snakeXSpeed = 0;
  snakeYSpeed = 0;
  snakeX = int(rows/2);
  snakeY = int(rows/2);
  for (int i = 0; i<maxTails; i++) {
    tailX[i] = -1;
    tailY[i] = -1;
  }
  for (int i = 0; i<speed; i++) {
    turnQueue[i] = 0;
  }
  biteX = int(random(0, rows));
  biteY = int(random(0, rows));
}

boolean showGui = true;

void draw() {
  if (showGui) {
    RenderMenu();
  } else if (frameNr % speed == 0) {
    background(grass);
    if (checkIfGameover()) {
      //background(255);
      fill(255);
      text("You Fucked Up. Score: "+score, width/2, height/2);
      if (mousePressed) {
        doClear();
      }
    } else {
      drawMap();
      drawInhibits();
      drawTails();
      drawSnake();
      manageBites();
    }
  }

  frameNr++;
}
public boolean spaceOccupied() {
  boolean occupied = false;
  for (int i = 0; i<maxTails; i++) {
    if (tailX[i] == biteX && tailY[i] == biteY) {
      occupied = true;
    }
  }
  for (int i = 0; i<inhibitNr; i++){
    if (inhibitX[i] == biteX && inhibitY[i] == biteY) {
      occupied = true;
    }
  }
  return occupied;
}

public boolean checkIfGameover() {
  //check if collided with tail
  boolean gameOver = false;

  for (int i = 0; i<maxTails; i++) {
    if (tailX[i] == snakeX && tailY[i] == snakeY) {
      gameOver = true;
    }
  }
  if (difficulty == 1 || difficulty == 2) {
    if (snakeX >= rows || snakeX < 0 || snakeY >= rows || snakeY < 0) {
      gameOver = true;
    }
  }
  for (int i = 0; i<inhibitNr; i++) {
    if (snakeX == inhibitX[i] && snakeY == inhibitY[i] && difficulty == 2) {
      gameOver = true;
    }
  }
  return gameOver;
}