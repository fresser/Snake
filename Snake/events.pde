
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e>0) {
    if (playerSpeed >1 && showGui) {
      playerSpeed = playerSpeed - 1;
    }
  } else {
    if (playerSpeed < 5 && showGui) {
      playerSpeed = playerSpeed +1;
    }
  }
  speed = 6-playerSpeed;
}
void mouseClicked() {
  if(showGui){
    showGui = false;
    difficulty = 1;
    if(difficulty == 2){
    setupInhibits();
    }
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