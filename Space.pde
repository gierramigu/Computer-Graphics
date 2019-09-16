class Space{
float dotX;
float dotY;
float dotSize;
float dotVelocity;
float dotColour;
 

//constructor
Space(float starX, float starY){
  this.dotX = starX;
  this.dotY = starY;
  dotSize = random(2,6);
  dotVelocity = random(1,3);
  dotColour = random(1,9);
}

void backDrop(){
  noStroke();

  //shape of dot 
  rect(dotX, dotY, dotSize, dotSize+5); 
  
  //random dot spawn and its colour 
  if(dotColour<3.5) fill(244,170,137); 
  else if(dotColour>2.5 && dotColour<3.5) fill(239,131,131); 
  else if(dotColour>8.8 && dotColour<9.75) fill(240,98,97);
  else if(dotColour>7.5 && dotColour<8.5) fill(169,88,165);
  else if(dotColour>4.5 && dotColour<6.8) fill(125,252,250); 
  else fill(97,62,151); 
 
  
}

void movement(){
  //add speed to Y per tick
  this.dotY = this.dotY + this.dotVelocity ;
  if(this.dotY > width) this.dotY = 2;       
 }
}
