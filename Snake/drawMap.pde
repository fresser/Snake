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
  stroke(0);
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