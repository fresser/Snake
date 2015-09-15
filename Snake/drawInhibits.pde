void addInhib(int x, int y){
  boolean setted = false;
  for(int i = 0;i<inhibitNr;i++){
    if(inhibitX[i] == -500 && inhibitY[i] == -500 && !setted){
      setted = true;
      inhibitX[i] = x;
      inhibitY[i] = y;
    }
  }
}
void setupInhibits(){
  for(int i = 0;i<inhibitNr;i++){
    inhibitX[i] = -500;
    inhibitY[i] = -500;
  }
  
  
  //Hjørne LU
  addInhib(3,3);
  addInhib(3,4);
  addInhib(3,5);
  addInhib(4,3);
  addInhib(5,3);
  
  //Mid U
  addInhib(10,3);
  addInhib(11,3);
  addInhib(12,3);
  addInhib(13,3);
  addInhib(14,3);
  
  //Hjørne RU
  addInhib(19,3);
  addInhib(20,3);
  addInhib(21,3);
  addInhib(21,4);
  addInhib(21,5);
  
  //mid R
  addInhib(21,10);
  addInhib(21,11);
  addInhib(21,12);
  addInhib(21,13);
  addInhib(21,14);
  
  //Hjørne RB
  addInhib(21, 19);
  addInhib(21,20);
  addInhib(21,21);
  addInhib(20,21);
  addInhib(19,21);
  
  //Mid B
  addInhib(10,21);
  addInhib(11,21);
  addInhib(12,21);
  addInhib(13,21);
  addInhib(14,21);
  
  //Hjørne LB
  addInhib(3, 19);
  addInhib(3,20);
  addInhib(3,21);
  addInhib(4,21);
  addInhib(5,21);
  
  //Mid Left
  addInhib(3,10);
  addInhib(3,11);
  addInhib(3,12);
  addInhib(3,13);
  addInhib(3,14);
  
}
void drawInhibits(){
  for(int i = 0;i<inhibitNr;i++){
   if(inhibitX[i] != -500 && inhibitY[i] != -500 && difficulty == 2){
     noStroke();
     fill(255,255,0);
     rectMode(CORNER);
     rect(mapStartX+inhibitX[i]*rowSize,mapStartY+inhibitY[i]*rowSize,rowSize,rowSize);
   }
  }
}