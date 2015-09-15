float mapSize = 0.8; //PERCENTAGE OF HEIGHT
float rows = 20; // ROWS AND COLUMNS IN MAP
int maxTails = 256; //Maximum of tails-squares
int speed = 4;
float tailSize = 0.8;

float mapStartX, mapStartY, rowSize;
int tailX[] = new int[maxTails];
int tailY[] = new int[maxTails];

int biteX = int(random(0, rows));
int biteY = int(random(0, rows));

PImage pizza, grass;
int turnQueue[] = new int[speed];
void setup() {
  fullScreen();
  frameRate(60);

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
void doClear(){
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

void draw() {
  if (frameNr % speed == 0) {
    background(grass);
    if (checkIfGameover()) {
      //background(255);
      fill(255);
      text("You Fucked Up. Score: "+score, width/2, height/2);
      if(mousePressed){
        doClear();
      }
    } else {
      drawMap();
      drawTails();
      drawSnake();
      manageBites();
    }
  }

  frameNr++;
}


void drawMap() {
  fill(0);
  rectMode(CORNER);
  noStroke();
  rect(0, 0, mapStartX, height);
  rect(mapStartX, 0, width, mapStartY);
  rect(mapStartX+(height*mapSize), mapStartY, width, mapStartY+(height*mapSize));
  rect(mapStartX, mapStartY+(height*mapSize), mapStartX+(height*mapSize), height);
  textSize(height/30);
  textAlign(CENTER);
  fill(255);
  text("Score: "+score, width/2, height*0.05);
  //image(grass,mapStartX,mapStartY,height*mapSize,height*mapSize);
  //rect(width/2, height/2, height*mapSize, height*mapSize);

  //tegn linjer
  /*for (int i=1; i<=rows; i++) {
   float y = mapStartY+i*rowSize;
   float x1 = (width-(height*mapSize))/2;
   float x2 = width-x1;
   line(x1, y, x2, y);
   
   float x = mapStartX+i*rowSize;
   float y1 = (height*(1-mapSize))/2;
   float y2 = height-y1;
   line(x, y1, x, y2);
   }*/
}

void drawSnake() {
  rectMode(CORNER);
  float x = mapStartX+(snakeX*rowSize);
  float y = mapStartY+(snakeY*rowSize);
  fill(100, 100, 255);
  rect(x, y, rowSize, rowSize);

  if (turnQueue[0] == 0) {
  } else if (turnQueue[0] == 1) {
    snakeXSpeed = 0;
    snakeYSpeed = -1;
  } else if (turnQueue[0] == 2) {
    snakeXSpeed = 0;
    snakeYSpeed = 1;
  } else if (turnQueue[0] == 3) {
    snakeXSpeed = -1;
    snakeYSpeed = 0;
  } else if (turnQueue[0] == 4) {
    snakeXSpeed = 1;
    snakeYSpeed = 0;
  }
  for (int i = 0; i<speed; i++) {
    if (i != speed-1) {
      turnQueue[i] = turnQueue[i+1];
    }
    turnQueue[speed-1] = 0;
  }

  snakeX = snakeX+snakeXSpeed;
  snakeY = snakeY+snakeYSpeed;

  if (snakeX >= rows) {
    snakeX = 0;
  }
  if (snakeX < 0) {
    snakeX = int(rows)-1;
  }
  if (snakeY >= rows) {
    snakeY = 0;
  }
  if (snakeY < 0) {
    snakeY = int(rows)-1;
  }
}

void drawTails() {
  for (int i = 0; i<maxTails; i++) {

    //drawAllTails
    if (tailX[i] != -1 && tailY[i] != -1) {
      rectMode(CORNER);
      float x = mapStartX+(tailX[i]*rowSize)+(((1-tailSize)/2)*rowSize);
      float y = mapStartY+(tailY[i]*rowSize)+(((1-tailSize)/2)*rowSize);
      fill(100);
      rect(x, y, rowSize*tailSize, rowSize*tailSize);
    }
  }
  //shiftAllTails

  if (snakeXSpeed != 0 || snakeYSpeed != 0) {
    for (int i = tailsInUse; i>0; i--) {
      tailX[i] = tailX[i-1];
      tailY[i] = tailY[i-1];
    }
    tailX[0] = snakeX;
    tailY[0] = snakeY;
  }
}
void addToQueue(int direction) {
  boolean setted = false;
  for (int i = 0; i<speed; i++) {
    if (turnQueue[i] == 0 && setted != true) {
      turnQueue[i] = direction;
      setted = true;
    }
  }
}

void keyPressed() {
  if (keyCode == UP && snakeYSpeed != 1) {
    addToQueue(1);
  } else if (keyCode == DOWN && snakeYSpeed != -1) {
    addToQueue(2);
  } else if (keyCode == LEFT && snakeXSpeed != 1) {
    addToQueue(3);
  } else if (keyCode == RIGHT && snakeXSpeed != -1) {
    addToQueue(4);
  }
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

void manageBites() {
  fill(#E7F000);
  rectMode(CORNER);
  float x = mapStartX+(biteX*rowSize);
  float y = mapStartY+(biteY*rowSize);
  //rect(x, y, rowSize, rowSize);
  image(pizza, x, y, rowSize, rowSize);

  if (biteX == snakeX && biteY == snakeY) {
    score = score+100;
    biteX = int(random(0, rows));
    biteY = int(random(0, rows));
    while (spaceOccupied()) {
      biteX = int(random(0, rows));
      biteY = int(random(0, rows));
    }
    tailsInUse=tailsInUse+3;
  }
}


public boolean checkIfGameover() {
  //check if collided with tail
  boolean gameOver = false;

  for (int i = 0; i<maxTails; i++) {
    if (tailX[i] == snakeX && tailY[i] == snakeY) {
      gameOver = true;
    }
  }
  return gameOver;
}