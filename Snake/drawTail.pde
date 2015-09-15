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