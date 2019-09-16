class Enemy {
 
//coordinates of enemy 
float eX; 
float eY;

boolean hold; 
int level;
int path;
boolean defeat;
boolean lvl;

//constructor
Enemy( int level, float exPos, float eyPos){
  this.eY = exPos;
  this.eX = eyPos;
  this.level = level;
  defeat = false;
  hold = false;
  path = 1;
  lvl = false;
}



//drawing the array of enemies
void play(){
 if(defeat == false && level ==1){
  frameRate(60);
      fill(240,177,255);
      rect(eX, eY, 40, eHeight); //top rect 
      fill(200,177,255);
      rect(eX-20, eY+5, eWidth, eHeight+5); //left rect
      fill(200,177,255);
      rect(eX+20, eY+5, eWidth, eHeight+5); //right rect
      fill(200,177,255);
      rect(eX, eY+5, eWidth, eHeight+5); // mid rect 
      rect(eX-25, eY+10, eWidth, eHeight+5); //left rect
      rect(eX+25, eY+10, eWidth, eHeight+5); //right rect
      //rect(eX, eY, eWidth, eHeight);
    
  }
  if(defeat == false && level ==2){
    
      fill(197,34,51);
      fill(240,100,70);
      rect(eX, eY, 40, eHeight); //top rect 
      fill(200,177,255);
      fill(54,56,46);
      rect(eX-20, eY+5, eWidth, eHeight+5); //left rect
      fill(200,177,255);
      //fill(54,56,46);
      rect(eX+20, eY+5, eWidth, eHeight+5); //right rect
      fill(240,100,70);
      fill(200,177,255);
      rect(eX, eY+5, eWidth, eHeight+5); // mid rect 
      rect(eX-25, eY+10, eWidth, eHeight+5); //semileft rect
      rect(eX+25, eY+10, eWidth, eHeight+5); //semiright rect
  }
  if(defeat == false && level == 3){
    
      fill(197,34,51);
      rect(eX, eY, 40, eHeight); //top rect 
      fill(200,177,255);
      fill(54,56,46);
      rect(eX-20, eY+5, eWidth, eHeight+5); //left rect
      fill(200,177,255);
      //fill(54,56,46);
      rect(eX+20, eY+5, eWidth, eHeight+5); //right rect
      fill(240,100,70);
      fill(200,177,255);
      rect(eX, eY+5, eWidth, eHeight+5); // mid rect 
      rect(eX-25, eY+10, eWidth, eHeight+5); //semileft rect
      rect(eX+25, eY+10, eWidth, eHeight+5); //semiright rect
  }
}

/**makes the enemies move a certain way***/
void move(){
    if(start == true && defeat == false){
      
     //1st level of enemies
    if(level == 1){
      if(seconds > 500 && seconds < 517){
      eX += 37*path; //moving on the x direction
      arrayX = arrayX - 37*path;
      hold = true; 
      } 
      else if( arrayX>= 121 || arrayX<=10){
       if(hold == true && seconds > 850) {
          eY += 20; //going down
          path*=-1;
          hold = false;
        }
      }
    } 
    
    //2nd level of enemies
    else if(level ==2  && defeat == false){
        if(seconds > 500 && seconds < 517){
      eX += 37*path; //moving on the x direction
      arrayX = arrayX - 37*path;
      hold = true; 
      } 
      else if(( arrayX>= 121 || arrayX<=10)){
       if(hold == true && seconds > 850) {
          eY += 35; //going down
          path*=-1;
          hold = false;
       }
      }
    } 
    
    //3rd level of enemies
      else if(level ==3  && defeat == false){
        if(seconds > 500 && seconds < 517){
      eX += 37*path; //moving on the x direction
      arrayX = arrayX - 37*path;
      hold = true; 
      } 
      else if(( arrayX>= 121 || arrayX<=10)){
       if(hold == true && seconds > 850) {
          eY += 36; //going down
          path*=-1;
          hold = false;
       }
      }
     } 
   }      
}
    
 /**collision detection for the bullet and enemy***/
  void collide(){ 
    
   if(eX-37 < bX && eX+37 > bX && eY < bY && eY+15 >bY){
    defeat = true;
    hit = true;
    score++;
    eY = eY - 2000;
    eX = eX + 2000;
   }
   if( score == 16 && level ==1 ){
   level = 2; 
   setupGame();
   eY = eY +400;
   }
   if(score == 32 && level == 2){
   level = 3;
   setupGame();
   eY = eY + 400;
   }
  
}


void gameover() {
    
    //defeat
   if (eY>=770) {
      start = false;
      fill(255);
      textSize(40);
      text("GAME OVER",width/2-110,height/2);
      gameOver = true;
      gameEnd = true;
  }
    //victory 
    if(score >= 48){
      start = false;
      fill(255);
      textSize(40);
      text("YOU WIN!",width/2-95,height/2);
    }
  }
}
