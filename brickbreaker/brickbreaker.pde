Ball ball;
Platform platform;
Brick bricks[];

PFont f;

boolean paused,gameOver, levelComplete;
        
int level, numBricks, lives;

void setup() {
  size(600,400);
  frameRate(100);
  f = createFont("Arial", 16, true);
  textFont(f);
  numBricks = 12;
  level = 1;
  initialize();
}

void draw() {
  background(255);
  text("Brick Breaker by Alexander CT",10,390);
  int bricksBroken = 0;
  if (!died()) {
    for (int i = 0; i < bricks.length; i++) {
      bricks[i].display();
      ball.detectCollision(bricks[i]);
      if (bricks[i].broken)
        bricksBroken++;
    }
    if (bricksBroken == bricks.length)
      completeLevel();
    ball.detectCollision(platform); 
    ball.display();
    ball.move();
    platform.display();
    platform.move();
    drawLives();
  } else {
      if (--lives == 0) {
        gameOver();
      } else {
        ball.returnToOrigin();
        platform.returnToOrigin();
      }
  }  
}


void keyPressed() {
  if (key == ENTER && gameOver) {
    restartGame();
  } else if (key == ENTER && levelComplete) {
    restartGame();
    levelComplete = false;
  }
  if (key == 'p' || key == 'P' && !paused) {
    pauseGame();
  }
  if ((key == 'c' || key == 'C') && paused) {
    continueGame();
  }
  if ((key == 'q' || key == 'Q') && paused) {
    exit(); 
 }
 
}

void initialize() {
  ball     = new Ball(new Vector(width/2,339), new Vector(2,-2), 10, color(0,0,255));
  platform = new Platform(new Vector(width/2-30,350), new Vector(3,0), 60, 10, color(128,128,128));
  paused   = false;
  gameOver = false;
  lives    = 3;
  
  if (levelComplete)
    numBricks += 12;
  
  bricks = new Brick[numBricks];
  
  for (int i = 0; i < bricks.length; i++)
    bricks[i] = new Brick(new Vector(((i % 12) * width/12), ((i/12) * 20)), width/12, 20, color(255,0,0));
}

boolean died() {
  Vector bLoc = ball.getLocation();      //ball location
  Vector pLoc = platform.getLocation();  //platform location
  
  if (bLoc.x < 0 && bLoc.y > pLoc.y)
    return true; 
  else if (bLoc.x > width && bLoc.y > pLoc.y)
    return true;
  else if (bLoc.y > height)
    return true;
  else
    return false;
}

void restartGame() {
  initialize();
  loop();
}
 
void pauseGame() {
  paused = true;
  text("Juego pausado. Presiona [c] para continuar.\nPresiona [q] para salir del juego.", width/2 - 100, height/2);
  noLoop();
}
 
void continueGame() {
  paused = false;
  loop();
}

void gameOver() {
  gameOver = true;
  fill(0);
  text("Game Over!", width/2 - 50, height/2);
  noLoop();
  numBricks = 12;
}
 
void completeLevel() {
  noLoop();
  redraw();
  levelComplete = true;
  text("Nivel " + level + " completado!\nPresiona enter para iniciar el nivel " + ++level + ".", width/2 - 100, height/2);
}

void drawLives() {
  int rad = 10;
  for (int i = 0; i < lives; i++) {
    fill(0);
    ellipse(width-20,(i*20) + rad, rad, rad);   
  } 
}
