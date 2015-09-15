float mapSize = 0.8; //PERCENTAGE OF HEIGHT
float rows = 25; // ROWS AND COLUMNS IN MAP
int maxTails = 256; //Maximum of tails-squares
int speed = 5;
float tailSize = 0.8;
int difficulty;
int inhibitX = new int[25];
int inhibitY[] = new int[25];

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
int snakeX = int(random(0, rows));
int snakeY = int(random(0, rows));

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
  snakeX = int(random(0, rows));
  snakeY = int(random(0, rows));
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
    background(0);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(100);
    text("Snake by Lau", width/2, height*0.25);
    rectMode(CENTER);
    rect(width/2, height*0.4, 0.3*width, 0.1*height);

    rect(width/2, height*0.52, 0.3*width, 0.1*height);
    rect(width/2, height*0.64, 0.3*width, 0.1*height);

    textSize(height/18);
    fill(0);
    text("Easy", width/2, height*0.4);
    text("Intermediate", width/2, height*0.52);
    text("Hardcore", width/2, height*0.64);
    textSize(height/30);
    fill(255);
    text("Scroll to select speed: "+playerSpeed, width/2, height*0.72);
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
  if (difficulty == 1) {
    if (snakeX >= rows || snakeX < 0 || snakeY >= rows || snakeY < 0) {
      gameOver = true;
    }
  }
  return gameOver;
}