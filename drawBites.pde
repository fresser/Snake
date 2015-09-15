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