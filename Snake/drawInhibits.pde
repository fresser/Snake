void setupInhibits(){
  for(int i = 0;i<25;i++){
    inhibitX[i] = -500;
    inhibitY[i] = -500;
  }
  
  inhibitX[0] = 4;
  inhibitY[0] = 4;
  
}
void drawInhibits(){
  for(int i = 0;i<25;i++){
   if(inhibitX[i] != -500 && inhibitY[i] != -500){
     fill(255);
     rectMode(CORNER);
     rect(mapStartX+inhibitX[i]*rowSize,mapStartY+inhibitY[i]*rowSize,rowSize,rowSize);
   }
  }
  
}