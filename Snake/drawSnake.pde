//derp

void drawSnake() {
  
  rectMode(CORNER);
  shapeMode(CENTER);
  float x = mapStartX+(snakeX*rowSize)+(rowSize/2);
  float y = mapStartY+(snakeY*rowSize)+(rowSize/2);
  fill(100, 100, 255);




  pushMatrix();
  translate(x,y);
  
  if (snakeYSpeed == -1) {
    rotate(-(PI/2));
  }
  if (snakeYSpeed == 1) {
    rotate(PI/2);
  }
  if (snakeXSpeed == 1) {
    rotate(0);
  }
  if (snakeXSpeed == -1) {
    rotate(PI);
  }
  shape(snake, 0, 0, rowSize, rowSize);  
  
  popMatrix();

  //rect(x, y, rowSize, rowSize);

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
if(difficulty == 1){
  //do nothing
}
else{
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
}