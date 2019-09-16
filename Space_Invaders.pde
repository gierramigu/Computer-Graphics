Enemy[][] enemies = new Enemy[2][8];
Space[] stars = new Space[300];
Spaceship ship;
StopWatchTimer time;
Bullets bullet;
int seconds;
int level;
int gap = 75;
int eWidth = 10;
int eHeight = 10;
boolean hit; 
boolean start;  
boolean menu;  
boolean gameStarted = false;
boolean showEnemy = false; 
boolean nextLevel = false;
boolean gameOver = false;
boolean gameEnd = false;
int score;

//positions of ship
float sX; 
float sY;

//bullet positions
float bX;
float bY;
float arrayX;
float arrayY;

//test for the powerup
int lastTimeCheck;
int timeIntervalFlag = 1000;
int tick;


void setup(){
  frameRate(60);
  size(800,800);
  time = new StopWatchTimer();
  menu = true;
  start = false;
  ship = new Spaceship(); 
  bullet = new Bullets(); 
  setupGame();

  //creating dots in the background, spawning in random variables
  for (int i=0; i<stars.length; i++){
   stars[i]= new Space(random(width), random(height));
  }   
}


/**separate setup for the spawning enemies, because of different levels***/ 
void setupGame(){
  
   for(int rows =0; rows < enemies.length; rows ++){
   for( int cols = 0; cols < enemies[0].length; cols++){ 
    int exPos = 5;
    int eyPos = 30;
    exPos = exPos + (gap*(rows + 1) +(eWidth*rows));
    eyPos = eyPos + (gap*(cols + 1) +(eWidth*cols));
    
   //1st level of enemies
   if(score < 16){
    Enemy e = new Enemy(1,exPos,eyPos); 
    enemies [rows][cols] = e; 
    } 
    
   //2nd level of enemies
   else if(score < 32){
    Enemy e2 = new Enemy(2,exPos,eyPos);
    enemies[rows][cols] = e2; 
   }
   
   //3rd level enemies
   else if( score >=32){
   Enemy e3 = new Enemy(3, exPos, eyPos);
   enemies[rows][cols] = e3; 
   
   }
  }
 }
}

void draw(){
 
  //game starts when player has pressed play
  if(menu == false){
   //noCursor();
 
  //time variable for the enemies to move in a certain way down
  seconds = millis()-900*floor(millis()/900);
   
   background(26,72,118);

   //space background
   for(int i=0; i<stars.length; i++){
      stars[i].backDrop();
      stars[i].movement();
    }
      
  //this section allows the different levels to work
  boolean flag = true;
  for(int rows =0; rows < enemies.length; rows ++){
  for( int cols = 0; cols < enemies[0].length; cols++){
       if (!enemies[rows][cols].defeat){flag = false;}
    }
   }
   if (flag){ setupGame();}
   
  //spawns enemies after the countdown
  if(showEnemy){
  for( int rows = 0; rows < enemies.length; rows++){
  for(int cols=0; cols < enemies[0].length; cols++){
    enemies[rows][cols].play(); // displays the enemies in an array 
    enemies[rows][cols].collide();
    enemies[rows][cols].move(); 
    enemies[rows][cols].gameover();
    }
   }
  }
   
   //from other classes
   ship.display();
   ship.control();
   bullet.fire();
   bullet.showBullet();
   ship.countDown(time);
   score();
  }
  else if (menu == true){
  menu();
  menuHover();
  
  }
  if(gameEnd){
  restart();
  restartHover();
  }
  
  
 /**saving the current highscore***/
 //saving high score
 String HighScore = str(score);
 String Scores[] = {HighScore};
 String Score[] = loadStrings("highscore.txt");
 int highscore = int(Score[0]);
 if( score > highscore){
 saveStrings("highscore.txt", Scores);
 }
 
 //loading high score
  String Score1[] = loadStrings("highscore.txt");
  int highscore1 = int(Score1[0]);
  fill(255);
  textSize(30);
  text("Current Highscore:", 30, 60);
  text(highscore1, 330, 60);
}


void level(){
  textSize(40);
  text("Level 1", 30, 60);
}

/**for the score****/
void score(){
  textSize(40);
  text("Score:",600,600);
  scoreCount();
}

void scoreCount(){
  textSize(40);
  text(score,720,600);
}

/*MENU and Restart SECTION ****/

//this whole section displays menu screen
void menu(){
  image(loadImage("/images/menu1.jpg"), 0, 0, width, height);
  textSize(120);
  text("PLAY",250,600);
  textSize(20);
  text("Use mouse to move and fire", 252, 700);
}

//for the restart when the game is over
void restart(){
   cursor();
   textSize(90);
   text("Restart",255,600);
}

void mousePressed (){
  //gameover
 if(!gameStarted){
  if(mouseX >=100 && mouseY>=540 && mouseY<=660){
    menu = false;
    time.start(); //where the countdown begins
    gameStarted = true;
    setupGame();
    }
  }
  
  //for the restart
 if(gameOver){
  textSize(90);
  fill(0,255,255); //blue
   if(mouseX >=100 && mouseY>=540 && mouseY<=660){
      menu = true;
      gameOver = false;
      gameEnd = false;
      gameStarted = false;
      score = 0;
      level = 1;
    }
   }
} 

void menuHover(){
  if(mouseX >=100 && mouseY>=540 && mouseY<=660){
   image(loadImage("/images/menu2.jpg"), 0, 0, width, height);
   textSize(200);
   fill(0,255,255);
   text("PLAY",170,700);
  }
}

void restartHover(){
   if(mouseX >=100 && mouseY>=540 && mouseY<=660){  
   textSize(90);
   fill(0,255,255); //blue
   text("Restart",255,600);
  }

}
