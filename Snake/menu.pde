void RenderMenu()
{
  background(0);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(100);
  text("Snake-Man", width/2, height*0.25);
  rectMode(CENTER);
  
  if (OverButton(width/2, height*0.4, 0.3*width, 0.1*height))
  {
    fill(150);
  } else {
    fill(255);
  }
  rect(width/2, height*0.4, 0.3*width, 0.1*height);
  
  if (OverButton(width/2, height*0.52, 0.3*width, 0.1*height))
  {
    fill(150);
  } else {
    fill(255);
  }
  rect(width/2, height*0.52, 0.3*width, 0.1*height);
  
  if (OverButton(width/2, height*0.64, 0.3*width, 0.1*height))
  {
    fill(150);
  } else {
    fill(255);
  }
  rect(width/2, height*0.64, 0.3*width, 0.1*height);

  textSize(height/18);
  fill(0);
  text("Easy", width/2, height*0.4);
  text("Intermediate", width/2, height*0.52);
  text("Hardcore", width/2, height*0.64);
  textSize(height/30);
  fill(255);
  text("Scroll to select speed: "+playerSpeed, width/2, height*0.72);
}

boolean OverButton(float x, float y, float w, float h)
{
  if (mouseX >= x - w/2 && mouseX <= x + w/2 &&
      mouseY >= y - h/2 && mouseY <= y + h/2)
  {
    return true;
  } else
  {
    return false;
  }
}

void clickedMenu(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2, float x3, float y3, float w3, float h3)
{
  if(showGui){
    if (OverButton(x1, y1, w1, h1))
    {
      showGui = false;
      difficulty = 0;
    }
    else if (OverButton(x2, y2, w2, h2))
    {
      showGui = false;
      difficulty = 1;
    }
    else if (OverButton(x3, y3, w3, h3))
    {
      showGui = false;
      difficulty = 2;
      setupInhibits();
    }
  }
}