class Spaceship{
StopWatchTimer time;
boolean delay = true;

void display(){
   fill(252,162,207);
   fill(220,0,240); 
   fill(255);
   rect(sX,720,8,20);
   rect(sX,730,50,15);
   fill(220,0,240); 
   rect(sX,735,60,10);
   rectMode(CENTER);  
}

void control(){
  //mouse coordinates to move the ship
  sX = mouseX;
  sY = mouseY;
}

/**count down before game starts*/
void countDown(StopWatchTimer time){ 
  if(menu == false){
      if (time.getElapsedTime()>0 && time.getElapsedTime()<7100) {
      fill(255);
      textSize(80);
      if (time.getElapsedTime()>2000 && time.getElapsedTime()<=3000)  text("3",width/2-10,height/2);
      else if (time.getElapsedTime()>3000 && time.getElapsedTime()<=4000) text("2",width/2-10,height/2);
      else if (time.getElapsedTime()>4000 && time.getElapsedTime()<=5000) text("1",width/2-10,height/2);
      else if (time.getElapsedTime()>5000 && time.getElapsedTime()<=6000) text("GO!",width/2-80,height/2);
      else if (time.getElapsedTime()>7000)  {
      start = true;
      showEnemy = true;
      }
    }
  }
  time.stop();
  }
}
