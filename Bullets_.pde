class Bullets {
boolean press; 
float bulletXFixed; //x coordinate is fixed on the mouse position
int bSize =20;

void fire(){
 if(start){
    if(mousePressed && press == false){
        bulletXFixed = sX;
        bY = 700;
        press = true;
    }
  }
}

void showBullet(){
if (press){
  fill(252,162,207);
   bX = bulletXFixed;
      if (bY>0) {
        bY = bY - 9;
        rect(bX,bY,bSize,bSize);
      }
       if (bY< 0 || hit == true)  {press = false; hit = false;}
    }
  }

}
