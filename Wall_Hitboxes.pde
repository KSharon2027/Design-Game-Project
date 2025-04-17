// Player and doors
PVector player;
int playerW = 30;
int playerH = 50;
int speed = 4;

private Rectangle leftDoor, rightDoor;

// Character variables
float charX = 100;
float charY = 300;
float charW = 40;
float charH = 60;
float xSpeed = 5;
float ySpeed = 0;
float gravity = 0.6;
float jumpForce = -12;
boolean onGround = true;


void setup(){
  size(800, 600);
  background(255);
   
  player = new PVector(100, height - 100);
 
  leftDoor = new Rectangle(0, height - 150, 40, 100);
  rightDoor = new Rectangle(width - 40, height - 150, 40, 100);
}


void draw(){
  background(255);
 
 // Draw player
rect(player.x, player.y, playerW, playerH);
 
Walls();
Doors();
doorLogic();
//Sets onGround to true or false when jumping
onGround = blockJump(player, gravity, charY, charH);
handleMovement();


println("ySpeed: ", ySpeed, "Y Pos: ", player.y, "onGround: ", onGround);
} //End of draw function//



//Ken's Code
boolean playerOverlaps(Rectangle r) {
  return player.x < r.x + r.w &&
         player.x + playerW > r.x &&
         player.y < r.y + r.h &&
         player.y + playerH > r.y;      
} 



//Ken's Code
private class Rectangle {
  float x, y, w, h;
  Rectangle(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
} 




//Kai's Code
boolean blockJump(PVector block, float grav, float cy, float ch) {
    
    //Denys's Code
      // Changes state of onGround
      if (cy + ch < height - 50) {
        if (block.y < height - 100) {
        block.y += grav;
        grav += 0.6;
        }
       // ySpeed = 0;
        return true;
      } else {       
        return false;   
      }  
}




void Walls(){
  fill(155);
//Walls  
  //Left Wall
  rect (0, 0, 50, height - 150);
 
  //Right Wall
  rect (width - 50, 0, 50, height - 150);
  
  //Ceiling
  rect (0, 0, width, 50);
  
  //Floor
  rect (0, height - 50, width, 50);
fill(255);
}


void handleMovement(){
      // Move player
  if (keyPressed) {
    if (key == 'a' || keyCode == LEFT) player.x -= speed;
    if (key == 'd' || keyCode == RIGHT) player.x += speed;  
    
    if (key == 'w' && player.y < height + 500) {
      
      ySpeed = jumpForce;     
      
      if (player.y > 300) { //Jump Height
         if (gravity < 12) {
        gravity += 0.1;
           if (gravity > 5) {
             gravity -= 0.1;  
  } 
       print("Gravity: ", gravity); 
}
      player.y += ySpeed + gravity;  
      
      }      
    }
  }
}


void Doors(){
//Ken's Code
//Doors
  fill(255, 140, 0);
  rect(leftDoor.x, leftDoor.y, leftDoor.w, leftDoor.h);
  rect(rightDoor.x, rightDoor.y, rightDoor.w, rightDoor.h);
}


void doorLogic(){
    // Door teleport logic
  if (playerOverlaps(leftDoor)) {
    player.x = width - playerW - 50;
  } else if (playerOverlaps(rightDoor)) {
    player.x = 50;
  }
}
